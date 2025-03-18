import 'dart:async';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/deep_linking/repository/i_deep_linking_repository.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/order_item_params.dart';
import 'package:ezrxmobile/domain/order/entities/payment_params.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/infrastructure/core/chatbot/chatbot_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deep_linking_event.dart';

part 'deep_linking_state.dart';

part 'deep_linking_bloc.freezed.dart';

class DeepLinkingBloc extends Bloc<DeepLinkingEvent, DeepLinkingState> {
  final ChatBotService chatBotService;
  final IDeepLinkingRepository repository;
  StreamSubscription<EzrxLink>? _deepLinkStreamSubscription;

  DeepLinkingBloc({
    required this.repository,
    required this.chatBotService,
  }) : super(const DeepLinkingState.initial()) {
    on<DeepLinkingEvent>(_onEvent);
  }

  Future<void> _onEvent(
    DeepLinkingEvent event,
    Emitter<DeepLinkingState> emit,
  ) async {
    await event.map(
      initialize: (_) async {
        await _deepLinkStreamSubscription?.cancel();

        _deepLinkStreamSubscription = repository.watchDeepLinkValue().listen(
          (event) {
            if (isClosed) return;
            add(
              DeepLinkingEvent.addPendingLink(event),
            );
          },
        );
        final failureOrSuccess = await repository.initializeDeepLink();
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            DeepLinkingState.error(failure),
          ),
          (success) {},
        );
      },
      addPendingLink: (event) async {
        emit(
          DeepLinkingState.linkPending(
            event.link,
            banner: event.banner,
          ),
        );
        // ChatBot is managed by plugin and the ChatBot screen is an overlay.
        // For now, whenever we tap on the deep link, a screen opened from the
        // link will be behind the ChatBot, so we need to close the chatbot when
        // receive the link to be able to see the screen from the link
        await chatBotService.closeChatBot();
      },
      consumePendingLink: (event) {
        state.whenOrNull(
          linkPending: (link, banner) {
            if (link.isContactUs) {
              final failureOrSuccess = repository.getCurrentMarket();

              failureOrSuccess.fold(
                (error) => emit(
                  DeepLinkingState.error(error),
                ),
                (market) => emit(
                  DeepLinkingState.redirectContactUs(market),
                ),
              );

              return;
            } else if (link.isResetPassword) {
              final failureOrSuccess = repository.extractResetPasswordKey(
                link: link.resetPasswordFilteredUri,
              );

              failureOrSuccess.fold(
                (error) => emit(
                  DeepLinkingState.error(error),
                ),
                (resetPassword) => emit(
                  DeepLinkingState.redirectResetPassword(resetPassword),
                ),
              );

              return;
            } else if (link.isTnC) {
              emit(const DeepLinkingState.redirectTnC());

              return;
            } else if (link.isPrivacy) {
              emit(const DeepLinkingState.redirectPrivacy());

              return;
            }

            if (event.selectedShipTo == ShipToInfo.empty()) {
              emit(
                const DeepLinkingState.error(
                  ApiFailure.other('Please login to proceed'),
                ),
              );

              return;
            }

            if (link.isProductDetail) {
              final failureOrSuccess = repository.extractMaterialNumber(
                link: link.uri,
              );

              failureOrSuccess.fold(
                (error) => emit(
                  DeepLinkingState.error(error),
                ),
                (materialNumber) => emit(
                  DeepLinkingState.redirectProductDetail(
                    materialNumber,
                    banner: banner,
                  ),
                ),
              );
            } else if (link.isBundleDetail) {
              final failureOrSuccess = repository.extractMaterialNumber(
                link: link.uri,
              );

              failureOrSuccess.fold(
                (error) => emit(
                  DeepLinkingState.error(error),
                ),
                (materialNumber) => emit(
                  DeepLinkingState.redirectBundleDetail(
                    materialNumber,
                    banner: banner,
                  ),
                ),
              );
            } else if (link.isProductListing) {
              final failureOrSuccessSearchKey =
                  repository.extractProductSearchKey(
                link: link.uri,
              );

              failureOrSuccessSearchKey.fold(
                (error) => emit(DeepLinkingState.error(error)),
                (searchKey) {
                  final materialFilter = repository.extractMaterialFilter(
                    link: link.uri,
                    materialFilter: event.materialFilter,
                  );
                  emit(
                    DeepLinkingState.redirectProductsTab(
                      searchKey,
                      materialFilter,
                    ),
                  );
                },
              );
            } else if (link.isOrderDetail) {
              final failureOrSuccess = repository.extractOrderNumber(
                selectedCustomerCode: event.selectedCustomerCode,
                selectedShipTo: event.selectedShipTo,
                link: link.uri,
              );

              failureOrSuccess.fold(
                (error) => emit(
                  DeepLinkingState.error(error),
                ),
                (orderNumber) => emit(
                  DeepLinkingState.redirectOrderDetail(orderNumber),
                ),
              );
            } else if (link.isReturnSummaryDetail) {
              final failureOrSuccess = repository.extractReturnItem(
                link: link.uri,
              );

              failureOrSuccess.fold(
                (error) => emit(
                  DeepLinkingState.error(error),
                ),
                (returnItem) => emit(
                  DeepLinkingState.redirectReturnDetail(returnItem),
                ),
              );
            } else if (link.isZPPaymentSummaryDetail ||
                link.isMPPaymentSummaryDetail) {
              final failureOrSuccess =
                  repository.extractPaymentIdentifierInfo(link: link.uri);

              failureOrSuccess.fold(
                (error) => emit(
                  DeepLinkingState.error(error),
                ),
                (paymentBatchAdditionalInfo) => emit(
                  DeepLinkingState.redirectPaymentDetail(
                    paymentIdentifierInfo: paymentBatchAdditionalInfo,
                    isMarketPlace: link.isMPPaymentSummaryDetail,
                  ),
                ),
              );
            } else if (link.isZPInvoiceDetail || link.isMPInvoiceDetail) {
              final failureOrSuccess =
                  repository.extractInvoiceNumber(link: link.uri);

              failureOrSuccess.fold(
                (error) => emit(
                  DeepLinkingState.error(error),
                ),
                (invoiceNumber) => emit(
                  DeepLinkingState.redirectInvoiceDetail(
                    invoiceNumber: invoiceNumber,
                    isMarketPlace: link.isMPInvoiceDetail,
                  ),
                ),
              );
            } else if (link.isZPMyAccountPayment || link.isMPMyAccountPayment) {
              final failureOrSuccess =
                  repository.extractPaymentParams(link: link.uri);

              failureOrSuccess.fold(
                (error) => emit(
                  DeepLinkingState.error(error),
                ),
                (params) => emit(
                  DeepLinkingState.redirectPaymentHome(
                    params: params,
                    isMarketPlace: link.isMPMyAccountPayment,
                  ),
                ),
              );
            } else if (link.isFaq) {
              emit(const DeepLinkingState.redirectFAQ());
            } else if (link.isAboutUs) {
              emit(const DeepLinkingState.redirectAboutUs());
            } else if (link.isUserGuide) {
              emit(const DeepLinkingState.redirectUserGuide());
            } else if (link.isOrder) {
              emit(const DeepLinkingState.redirectOrder());
            } else if (link.isSetting) {
              emit(const DeepLinkingState.redirectSetting());
            } else if (link.isCart) {
              emit(const DeepLinkingState.redirectCart());
            } else if (link.isOrderItemDetail) {
              final failureOrSuccess = repository.extractOrderItemParams(
                link: link.uri,
                selectedCustomerCode: event.selectedCustomerCode,
                selectedShipTo: event.selectedShipTo,
              );
              failureOrSuccess.fold(
                (error) => emit(
                  DeepLinkingState.error(error),
                ),
                (params) => emit(
                  DeepLinkingState.redirectOrderItemDetail(params: params),
                ),
              );
            } else if (link.isAnnouncement) {
              emit(const DeepLinkingState.redirectAnnouncement());
            } else if (link.isArticle) {
              emit(const DeepLinkingState.redirectArticle());
            } else if (link.isReturn) {
              emit(const DeepLinkingState.redirectReturn());
            } else if (link.isZPCreditDetail || link.isMPCreditDetail) {
              final failureOrSuccess =
                  repository.extractCreditId(link: link.uri);
              failureOrSuccess.fold(
                (error) => emit(
                  DeepLinkingState.error(error),
                ),
                (creditId) => emit(
                  DeepLinkingState.redirectCreditDetail(
                    creditId: creditId,
                    isMarketPlace: link.isMPCreditDetail,
                  ),
                ),
              );
            } else if (link.isClaimSubmission) {
              emit(const DeepLinkingState.redirectClaimSubmission());
            } else if (link.isNewReturnRequest) {
              emit(const DeepLinkingState.redirectNewReturnRequest());
            } else if (link.isRaiseTicket) {
              final failureOrSuccess =
                  repository.extractChatUrl(link: link.uri);

              failureOrSuccess.fold(
                (error) => emit(
                  DeepLinkingState.error(error),
                ),
                (chatUrl) => emit(
                  DeepLinkingState.redirectRaiseTicket(
                    chatUrl: chatUrl,
                  ),
                ),
              );
            } else {
              emit(
                const DeepLinkingState.error(
                  ApiFailure.other('Link is not valid'),
                ),
              );
            }
          },
        );
      },
    );
  }

  @override
  Future<void> close() {
    _deepLinkStreamSubscription?.cancel();

    return super.close();
  }
}
