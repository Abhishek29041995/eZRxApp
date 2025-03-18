import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/forgot_password/forgot_password_bloc.dart';
import 'package:ezrxmobile/application/payments/claim_management/claim_management_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/return_items/return_items_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_item_params.dart';
import 'package:ezrxmobile/domain/order/entities/payment_params.dart';
import 'package:ezrxmobile/presentation/core/png_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:upgrader/upgrader.dart';

import 'package:ezrxmobile/application/about_us/about_us_bloc.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/settings/setting_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_filter/announcement_filter_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_bloc.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_filter/articles_info_filter_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/application/chatbot/chat_bot_bloc.dart';
import 'package:ezrxmobile/application/deep_linking/deep_linking_bloc.dart';
import 'package:ezrxmobile/application/notification/notification_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_material_detail_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/order/product_search/product_search_bloc.dart';
import 'package:ezrxmobile/application/order/re_order_permission/re_order_permission_bloc.dart';
import 'package:ezrxmobile/application/order/scan_material_info/scan_material_info_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_filter/view_by_item_filter_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_filter/view_by_order_filter_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary_details/payment_summary_details_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/details/return_details_by_request_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/confirm_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/dialogs/custom_dialogs.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/create_order/camera_files_permission_bottomsheet.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with WidgetsBindingObserver {
  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        if (_checkIfRefreshIsNeeded()) {
          context.read<AuthBloc>().add(const AuthEvent.init());
        } else {
          context.read<NotificationBloc>().add(const NotificationEvent.fetch());
        }
        break;

      case AppLifecycleState.paused:
        _initializeTimestamp();
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        break;
    }
  }

  void _initializeTimestamp() => dateTime = DateTime.now();

  bool _checkIfRefreshIsNeeded() =>
      dateTime.difference(DateTime.now()).inMinutes >= 30 ||
      context.read<AuthBloc>().state == const AuthState.visitedAppSettings();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<EligibilityBloc, EligibilityState>(
          listenWhen: (previous, current) =>
              previous.customerCodeInfo != current.customerCodeInfo &&
              current.customerCodeInfo != CustomerCodeInfo.empty(),
          listener: (context, state) => context.read<CustomerCodeBloc>().add(
                CustomerCodeEvent.fetchCustomerCodeConfig(
                  customerCodeInfo: state.customerCodeInfo,
                ),
              ),
        ),
        BlocListener<CustomerCodeBloc, CustomerCodeState>(
          listenWhen: (previous, current) =>
              previous.customerCodeConfig != current.customerCodeConfig ||
              previous.configFailureOrSuccessOption !=
                  current.configFailureOrSuccessOption,
          listener: (context, state) {
            state.configFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (_) {},
              ),
            );
            context.read<EligibilityBloc>().add(
                  EligibilityEvent.updatedCustomerCodeConfig(
                    customerCodeConfig: state.customerCodeConfig,
                  ),
                );
          },
        ),
        BlocListener<AuthBloc, AuthState>(
          listenWhen: (previous, current) => previous != current,
          listener: (context, state) {
            state.mapOrNull(
              authenticated: (authState) {
                context.read<UserBloc>().add(const UserEvent.fetch());

                context.router.replaceAll(
                  const [
                    SplashPageRoute(),
                    HomeNavigationTabbarRoute(),
                  ],
                );
              },
              unauthenticated: (unauthState) {
                final forgotPasswordState =
                    context.read<ForgotPasswordBloc>().state;
                _logout(context);

                context.router.replaceAll(
                  [
                    const SplashPageRoute(),
                    const LoginPageRoute(),
                  ],
                );
                if (forgotPasswordState.resetPasswordKey.isNotEmpty) {
                  context.read<ForgotPasswordBloc>().add(
                        ForgotPasswordEvent.validateResetPasswordKey(
                          forgotPasswordState.resetPasswordKey,
                        ),
                      );
                }
              },
              biometricDenied: (value) {
                _showBioMetricPermissionDialog();
              },
              visitedAppSettings: (value) => false,
            );
          },
        ),
        BlocListener<UserBloc, UserState>(
          listenWhen: (previous, current) =>
              previous.user.id != current.user.id,
          listener: (context, state) async {
            final salesOrgBloc = context.read<SalesOrgBloc>();
            salesOrgBloc.add(const SalesOrgEvent.initialized());
            final router = context.router;
            if (state.user.id.isEmpty) return;

            unawaited(
              context
                  .setLocale(state.user.preferredLanguage.locale)
                  .then((value) async {
                /* We need delay for a short time here before display message because when change locale
                       the system need time to re-load the new translation files, so if we create string
                       translate variables before reloaded, we won't use the lastest locale changed
                    */
                await Future.delayed(const Duration(milliseconds: 500));
                _welcomeUserMessage(state);
              }),
            );

            if (state.isAppFirstLaunch) {
              //Fetch sales org to show content in IntroPage
              _initializeSalesOrg(state);
              await router.push(const IntroPageRoute());
            }
            if (state.showTermsAndConditionDialog) {
              await router.push(
                AupTCPageRoute(
                  key: WidgetKeys.aupTcScreen,
                  user: state.user,
                  isMarketPlace: false,
                ),
              );
            }
            //If user reject classic TnC, we will logout the user
            //This check is to prevent the code below is called
            if (!router.currentPath.contains('/main')) return;
            if (state.showResetPasswordScreen) {
              await router.push(ResetPasswordPageRoute(isFirstLogin: true));
            }

            _initializeSalesOrg(state);
          },
        ),
        BlocListener<UserBloc, UserState>(
          listenWhen: (previous, current) =>
              previous.user != current.user &&
              previous.user.id == current.user.id,
          listener: (context, state) {
            final eligibilityBloc = context.read<EligibilityBloc>();
            eligibilityBloc.add(
              EligibilityEvent.update(
                user: state.user,
                salesOrganisation: eligibilityBloc.state.salesOrganisation,
                salesOrgConfigs: eligibilityBloc.state.salesOrgConfigs,
              ),
            );
          },
        ),
        BlocListener<UserBloc, UserState>(
          listenWhen: (previous, current) =>
              previous.userFailureOrSuccessOption !=
              current.userFailureOrSuccessOption,
          listener: (context, state) => {
            state.userFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                  if (context.mounted) {
                    context.read<AuthBloc>().add(
                          const AuthEvent.logout(),
                        );
                  }
                },
                (_) {},
              ),
            ),
          },
        ),
        BlocListener<EligibilityBloc, EligibilityState>(
          listenWhen: (previous, current) =>
              previous.showMarketPlaceTnc != current.showMarketPlaceTnc,
          listener: (context, state) {
            final isLoginOnBehalf =
                context.read<UserBloc>().state.isLoginOnBehalf;
            if (state.showMarketPlaceTnc && !isLoginOnBehalf) {
              context.router.push(
                AupTCPageRoute(
                  user: state.user,
                  isMarketPlace: true,
                ),
              );
            }
          },
        ),
        BlocListener<CartBloc, CartState>(
          listenWhen: (previous, current) =>
              previous.apiFailureOrSuccessOption !=
                  current.apiFailureOrSuccessOption ||
              previous.isFetching != current.isFetching ||
              previous.isUpserting != current.isUpserting,
          listener: (context, state) {
            state.apiFailureOrSuccessOption.fold(
              () {
                if (!state.isUpserting &&
                    state.containsSampleBonus &&
                    !context
                        .read<EligibilityBloc>()
                        .state
                        .isBonusOverrideEnable) {
                  context.read<CartBloc>().add(
                        const CartEvent.removeSampleBonusFromCartConfig(),
                      );
                }
              },
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleCartApiFailure(context, failure);
                },
                (_) {},
              ),
            );
          },
        ),
        BlocListener<PaymentCustomerInformationBloc,
            PaymentCustomerInformationState>(
          listenWhen: (previous, current) =>
              previous.paymentCustomerInformation !=
              current.paymentCustomerInformation,
          listener: (context, paymentCustomerInformationState) {
            if (!paymentCustomerInformationState
                .isPaymentCustomerInformationEmpty) {
              context.read<PaymentTermBloc>().add(
                    PaymentTermEvent.fetch(
                      customeCodeInfo: context
                          .read<EligibilityBloc>()
                          .state
                          .customerCodeInfo,
                      paymentCustomerInformation:
                          paymentCustomerInformationState
                              .paymentCustomerInformation,
                      salesOrganisation:
                          context.read<SalesOrgBloc>().state.salesOrganisation,
                      salesOrganisationConfigs:
                          context.read<SalesOrgBloc>().state.configs,
                      salesRepresentativeInfo:
                          context.read<UserBloc>().state.salesRepInfo,
                      user: context.read<UserBloc>().state.user,
                    ),
                  );
            }
          },
        ),
        BlocListener<ViewByItemsBloc, ViewByItemsState>(
          listenWhen: (previous, current) =>
              previous.failureOrSuccessOption != current.failureOrSuccessOption,
          listener: (context, state) => state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) {
                if (!state.isFetching) {
                  _fetchProductImage(
                    context,
                    state.orderHistory.orderHistoryItems,
                  );
                }
              },
            ),
          ),
        ),
        BlocListener<ChatBotBloc, ChatBotState>(
          listenWhen: (previous, current) =>
              previous.chatbotFailureOrSuccessOption !=
              current.chatbotFailureOrSuccessOption,
          listener: (context, state) =>
              state.chatbotFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) => ErrorUtils.handleApiFailure(context, failure),
              (_) {},
            ),
          ),
        ),
        BlocListener<MaterialListBloc, MaterialListState>(
          listenWhen: (previous, current) =>
              previous.materialList != current.materialList,
          listener: (context, state) {
            if (state.materialList.isNotEmpty) {
              _fetchMaterialPrice(
                context,
                state.materialList,
              );
              _fetchMaterialListProductImage(state, context);
            }
          },
        ),
        BlocListener<ScanMaterialInfoBloc, ScanMaterialInfoState>(
          listenWhen: (previous, current) =>
              previous.apiFailureOrSuccessOption !=
              current.apiFailureOrSuccessOption,
          listener: (context, state) {
            state.apiFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  failure.maybeMap(
                    cameraPermissionFailed: (_) => showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      isDismissible: false,
                      builder: (_) => const CameraFilesPermission(
                        type: PermissionType.camera,
                      ),
                    ),
                    storagePermissionFailed: (_) => showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      isDismissible: false,
                      builder: (_) => const CameraFilesPermission(
                        type: PermissionType.files,
                      ),
                    ),
                    scannedProductNotFound: (_) async {
                      final result = await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        isDismissible: false,
                        builder: (_) => ConfirmBottomSheet(
                          iconWidget: SvgPicture.asset(SvgImage.alert),
                          title: context.tr('Unable to find this product'),
                          content: context
                              .tr('Please try scanning different barcode'),
                          cancelButtonText: context.tr('Close'),
                          confirmButtonText: context.tr('Scan again'),
                        ),
                      );
                      if (result == true && context.mounted) {
                        unawaited(
                          context.router.push(const ScanMaterialInfoRoute()),
                        );
                      }
                    },
                    orElse: () => ErrorUtils.handleApiFailure(context, failure),
                  );
                },
                (_) {
                  context.router.push(
                    ProductDetailsPageRoute(materialInfo: state.material),
                  );
                },
              ),
            );
          },
        ),
        BlocListener<ViewByItemDetailsBloc, ViewByItemDetailsState>(
          listenWhen: (previous, current) =>
              previous.failureOrSuccessOption != current.failureOrSuccessOption,
          listener: (context, state) => state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) => _fetchProductImage(
                context,
                state.orderHistory.orderHistoryItems,
              ),
            ),
          ),
        ),
        BlocListener<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
          listenWhen: (previous, current) =>
              previous.failureOrSuccessOption != current.failureOrSuccessOption,
          listener: (context, state) => state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) => _fetchProductImage(
                context,
                state.orderHistoryDetails.orderHistoryDetailsOrderItem,
              ),
            ),
          ),
        ),
        BlocListener<CreditAndInvoiceDetailsBloc, CreditAndInvoiceDetailsState>(
          listenWhen: (previous, current) =>
              previous.failureOrSuccessOption != current.failureOrSuccessOption,
          listener: (context, state) => state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) => _fetchProductImage(
                context,
                state.itemsInfo,
              ),
            ),
          ),
        ),
        BlocListener<EligibilityBloc, EligibilityState>(
          listenWhen: (previous, current) =>
              previous.user.selectedOrderType !=
                  current.user.selectedOrderType &&
              previous.user.id == current.user.id,
          listener: (context, state) => _initializeOrderingModule(state),
        ),
        BlocListener<EligibilityBloc, EligibilityState>(
          listenWhen: (previous, current) =>
              current != EligibilityState.initial() &&
              current.isRefreshed(previous, onOrderTypeChanged: false),
          listener: (context, state) {
            if (state.haveShipTo) {
              _initializeOrderingModule(state);
              _initializeOrderHistoryModule(state);
              if (state.isInvalidSelectedOrderType) {
                context.read<CartBloc>().add(const CartEvent.clearCart());
                context.read<UserBloc>().add(
                      UserEvent.selectOrderType(orderType: DocumentType.zpor()),
                    );
              }

              context.read<NotificationBloc>().add(
                    const NotificationEvent.fetch(),
                  );

              context.read<AnnouncementBloc>().add(
                    AnnouncementEvent.getMaintenanceBanners(
                      salesOrg: state.salesOrg,
                    ),
                  );

              context.read<ResetPasswordBloc>().add(
                    ResetPasswordEvent.initialize(
                      resetPasswordKey: '',
                      user: state.user,
                    ),
                  );

              context.read<EligibilityBloc>().add(
                    const EligibilityEvent.registerChatBot(),
                  );

              context
                  .read<AboutUsBloc>()
                  .add(AboutUsEvent.initialize(salesOrg: state.salesOrg));

              context.read<CustomerLicenseBloc>().add(
                    CustomerLicenseEvent.initialized(
                      customerInfo: state.customerCodeInfo,
                      salesOrganization: state.salesOrganisation,
                      user: state.user,
                    ),
                  );

              context.read<DownloadPaymentAttachmentsBloc>().add(
                    DownloadPaymentAttachmentEvent.initialized(
                      salesOrganization: state.salesOrganisation,
                      customerCodeInfo: state.customerCodeInfo,
                    ),
                  );

              context
                  .read<PaymentCustomerInformationBloc>()
                  .add(const PaymentCustomerInformationEvent.initialized());

              context.read<PaymentCustomerInformationBloc>().add(
                    PaymentCustomerInformationEvent.fetch(
                      customeCodeInfo: state.customerCodeInfo,
                      salesOrganisation: state.salesOrganisation,
                      selectedShipToCode: state.shipToInfo.shipToCustomerCode,
                    ),
                  );

              context.read<ArticlesInfoBloc>().add(
                    ArticlesInfoEvent.initialize(
                      user: state.user,
                      salesOrg: state.salesOrg,
                      shipToInfo: state.shipToInfo,
                    ),
                  );
              context.read<ArticlesInfoFilterBloc>().add(
                    ArticlesInfoFilterEvent.fetchCategory(
                      salesOrg: state.salesOrg,
                    ),
                  );
              context.read<AnnouncementFilterBloc>().add(
                    AnnouncementFilterEvent.fetchCategory(
                      salesOrg: state.salesOrg,
                    ),
                  );

              context.read<AnnouncementInfoBloc>().add(
                    AnnouncementInfoEvent.initialize(
                      user: state.user,
                      salesOrg: state.salesOrg,
                    ),
                  );

              //Initialize for deeplink cases
              context.read<PaymentSummaryDetailsBloc>().add(
                    PaymentSummaryDetailsEvent.initialized(
                      salesOrganization: state.salesOrganisation,
                      customerCodeInfo: state.customerCodeInfo,
                      user: state.user,
                      shipToInfo: state.shipToInfo,
                    ),
                  );

              context.read<CreditAndInvoiceDetailsBloc>().add(
                    CreditAndInvoiceDetailsEvent.initialized(
                      salesOrganisation: state.salesOrganisation,
                      customerCodeInfo: state.customerCodeInfo,
                    ),
                  );

              if (!state.user.role.type.hasReturnsAdminAccess) return;
            }
          },
        ),
        BlocListener<DeepLinkingBloc, DeepLinkingState>(
          listener: (context, state) {
            final eligibilityState = context.read<EligibilityBloc>().state;

            state.when(
              initial: () {},
              linkPending: (_, __) {
                if (!locator<Upgrader>().blocked()) {
                  context.read<DeepLinkingBloc>().add(
                        DeepLinkingEvent.consumePendingLink(
                          selectedCustomerCode:
                              eligibilityState.customerCodeInfo,
                          selectedShipTo: eligibilityState.shipToInfo,
                          materialFilter: context
                              .read<MaterialFilterBloc>()
                              .state
                              .materialFilter,
                        ),
                      );
                }
              },
              redirectProductDetail: (materialNumber, banner) {
                if (!eligibilityState.user.userCanAccessProducts) {
                  _showNoAccessSnackbar();

                  return;
                }
                final materialInfo = MaterialInfo.empty().copyWith(
                  materialNumber: materialNumber,
                  type: MaterialInfoType.material(),
                );
                if (eligibilityState.isZDP5eligible) {
                  context.read<MaterialPriceBloc>().add(
                        MaterialPriceEvent.fetchPriceForZDP5Materials(
                          materialInfo: materialInfo,
                        ),
                      );
                }
                context.read<MaterialPriceBloc>().add(
                      MaterialPriceEvent.fetch(
                        comboDealEligible: eligibilityState.comboDealEligible,
                        materials: [materialInfo],
                      ),
                    );

                context.router.push(
                  ProductDetailsPageRoute(
                    materialInfo: materialInfo,
                    banner: banner,
                  ),
                );
              },
              redirectBundleDetail: (materialNumber, banner) {
                if (!eligibilityState.user.userCanAccessProducts ||
                    eligibilityState.salesOrgConfigs.disableBundles) {
                  _showNoAccessSnackbar();

                  return;
                }
                context.router.push(
                  BundleDetailPageRoute(
                    materialInfo: MaterialInfo.empty().copyWith(
                      materialNumber: materialNumber,
                      type: MaterialInfoType.bundle(),
                    ),
                    banner: banner,
                  ),
                );
              },
              redirectProductsTab: (searchKey, materialFilter) {
                if (!eligibilityState.user.userCanAccessProducts) {
                  _showNoAccessSnackbar();

                  return;
                }
                //to update search key and fetch on product listing page
                context.read<MaterialListBloc>()
                  ..add(
                    MaterialListEvent.updateSearchKey(
                      searchKey: searchKey.getValue(),
                    ),
                  )
                  ..add(
                    MaterialListEvent.fetch(
                      selectedMaterialFilter: materialFilter,
                    ),
                  );

                context.navigateTo(const ProductsTabRoute());
              },
              redirectOrderDetail: (orderNumber) {
                if (!eligibilityState.user.userCanAccessOrderHistory) {
                  _showNoAccessSnackbar(isOrder: true);

                  return;
                }
                context.read<ViewByOrderDetailsBloc>().add(
                      ViewByOrderDetailsEvent.fetch(orderNumber: orderNumber),
                    );
              },
              redirectReturnDetail: (returnItem) {
                if (!eligibilityState.isReturnsEnable) {
                  _showNoAccessSnackbar();

                  return;
                }
                if (returnItem.invoiceID.isNotEmpty &&
                    returnItem.lineNumber.isNotEmpty) {
                  context.read<ReturnSummaryDetailsBloc>().add(
                        ReturnSummaryDetailsEvent.fetch(
                          returnItem: returnItem,
                        ),
                      );

                  context.router.push(
                    const ReturnRequestSummaryByItemDetailsRoute(),
                  );
                } else {
                  context.read<ReturnDetailsByRequestBloc>().add(
                        ReturnDetailsByRequestEvent.fetch(
                          returnId: returnItem.requestId,
                        ),
                      );
                  context.router.push(const ReturnRequestDetailsRoute());
                }
              },
              redirectPaymentDetail: (paymentIdentifierInfo, isMarketPlace) {
                if (!eligibilityState.isPaymentEnabled) {
                  _showNoAccessSnackbar();

                  return;
                }
                context.read<PaymentSummaryDetailsBloc>().add(
                      PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
                        details: paymentIdentifierInfo,
                        isMarketPlace: isMarketPlace,
                      ),
                    );
                context.router.push(
                  PaymentSummaryDetailsPageRoute(
                    isMarketPlace: isMarketPlace,
                  ),
                );
              },
              redirectPaymentHome: (PaymentParams params, bool isMarketPlace) {
                if (!eligibilityState.isPaymentEnabled ||
                    (isMarketPlace &&
                        eligibilityState.marketPlacePaymentEligible)) {
                  _showNoAccessSnackbar();

                  return;
                }
                if (params.tab == PaymentTab.paymentSummary()) {
                  context.router.pushAll(
                    [
                      PaymentPageRoute(isMarketPlace: isMarketPlace),
                      PaymentSummaryPageRoute(isMarketPlace: isMarketPlace),
                    ],
                  );

                  return;
                }
                if (params.tab == PaymentTab.statementOfAccs()) {
                  if (!eligibilityState
                      .salesOrgConfigs.statementOfAccountEnabled) {
                    _showNoAccessSnackbar();

                    return;
                  }

                  context.router.pushAll(
                    [
                      PaymentPageRoute(isMarketPlace: isMarketPlace),
                      StatementAccountsPageRoute(isMarketPlace: isMarketPlace),
                    ],
                  );

                  return;
                }
                if (params.tab == PaymentTab.claimManagement()) {
                  if (!eligibilityState.salesOrg.isPaymentClaimEnabled) {
                    _showNoAccessSnackbar();

                    return;
                  }
                  context.read<ClaimManagementBloc>().add(
                        ClaimManagementEvent.initialized(
                          salesOrganisation: eligibilityState.salesOrganisation,
                          customerCodeInfo: eligibilityState.customerCodeInfo,
                          user: eligibilityState.user,
                        ),
                      );

                  context.router.pushAll(
                    [
                      PaymentPageRoute(isMarketPlace: isMarketPlace),
                      const ClaimManagementPageRoute(),
                    ],
                  );

                  return;
                }
                if (params.subTab == PaymentSubTab.allInvoices()) {
                  context.router.pushAll(
                    [
                      PaymentPageRoute(isMarketPlace: isMarketPlace),
                      AccountSummaryRoute(
                        isMarketPlace: isMarketPlace,
                        children: [
                          AllInvoicesPageRoute(isMarketPlace: isMarketPlace),
                        ],
                      ),
                    ],
                  );

                  return;
                }
                if (params.subTab == PaymentSubTab.allCreditNotes()) {
                  context.router.pushAll(
                    [
                      PaymentPageRoute(isMarketPlace: isMarketPlace),
                      AccountSummaryRoute(
                        isMarketPlace: isMarketPlace,
                        children: [
                          AllCreditsPageRoute(isMarketPlace: isMarketPlace),
                        ],
                      ),
                    ],
                  );

                  return;
                }
                if (params.subTab == PaymentSubTab.fullSummary()) {
                  context.router.pushAll(
                    [
                      PaymentPageRoute(isMarketPlace: isMarketPlace),
                      AccountSummaryRoute(
                        isMarketPlace: isMarketPlace,
                        children: [
                          FullSummaryPageRoute(isMarketPlace: isMarketPlace),
                        ],
                      ),
                    ],
                  );

                  return;
                }
                context.router
                    .push(PaymentPageRoute(isMarketPlace: isMarketPlace));
              },
              redirectInvoiceDetail: (invoiceNumber, isMarketPlace) {
                if (!eligibilityState.isPaymentEnabled) {
                  _showNoAccessSnackbar();

                  return;
                }
                context.read<CreditAndInvoiceDetailsBloc>().add(
                      CreditAndInvoiceDetailsEvent.fetchInvoiceById(
                        invoiceId: invoiceNumber,
                        isMarketPlace: isMarketPlace,
                      ),
                    );
                context.router.push(
                  InvoiceDetailsPageRoute(isMarketPlace: isMarketPlace),
                );
              },
              redirectFAQ: () {
                context.router.push(const FAQPageRoute());
              },
              redirectContactUs: (market) {
                context.router.push(ContactUsPageRoute(appMarket: market));
              },
              redirectAboutUs: () {
                context.router.push(const AboutUsPageRoute());
              },
              redirectUserGuide: () {
                context.navigateTo(
                  PdfViewPageRoute(
                    url: locator<Config>().getUserGuidePdfUrl(
                      eligibilityState.salesOrg.country.toLowerCase(),
                    ),
                    titleText: 'User guide',
                  ),
                );
              },
              error: (error) {
                ErrorUtils.handleApiFailure(context, error);
              },
              redirectResetPassword: (String resetPasswordKey) {
                if (context.read<AuthBloc>().state ==
                    const AuthState.authenticated()) {
                  context.read<ForgotPasswordBloc>().add(
                        ForgotPasswordEvent.saveResetPasswordKey(
                          resetPasswordKey,
                        ),
                      );
                  context.read<AuthBloc>().add(const AuthEvent.logout());

                  return;
                }
                context.read<ForgotPasswordBloc>().add(
                      ForgotPasswordEvent.validateResetPasswordKey(
                        resetPasswordKey,
                      ),
                    );
              },
              redirectOrder: () {
                if (!eligibilityState.user.userCanAccessOrderHistory) {
                  _showNoAccessSnackbar(isOrder: true);

                  return;
                }
                context.navigateTo(const OrdersTabRoute());
              },
              redirectTnC: () {
                context.navigateTo(
                  StaticHtmlViewerRoute(
                    title: 'Terms of Use',
                    htmlPath: context
                        .read<EligibilityBloc>()
                        .state
                        .user
                        .tncStaticFile,
                  ),
                );
              },
              redirectPrivacy: () {
                context.navigateTo(
                  StaticHtmlViewerRoute(
                    title: 'Privacy policy',
                    htmlPath: context
                        .read<EligibilityBloc>()
                        .state
                        .user
                        .privacyPolicyStaticFile,
                  ),
                );
              },
              redirectSetting: () {
                context.navigateTo(const MoreTabRoute());
              },
              redirectCart: () {
                context.router.push(CartPageRoute());
              },
              redirectOrderItemDetail: (OrderItemParams params) {
                if (!eligibilityState.user.userCanAccessOrderHistory) {
                  _showNoAccessSnackbar(isOrder: true);

                  return;
                }
                context.read<ViewByItemDetailsBloc>().add(
                      ViewByItemDetailsEvent.fetchOrderHistoryDetails(
                        orderNumber: params.orderNumber,
                        lineNumber: params.lineNumber,
                      ),
                    );

                context.router.push(
                  const ViewByItemDetailsPageRoute(),
                );
              },
              redirectAnnouncement: () {
                context.router.push(
                  const AnnouncementsTabRoute(),
                );
              },
              redirectArticle: () {
                context.router.push(
                  const ArticlesTabRoute(),
                );
              },
              redirectReturn: () {
                if (!eligibilityState.isReturnsEnable) {
                  _showNoAccessSnackbar();

                  return;
                }
                context.navigateTo(const ReturnRootRoute());
              },
              redirectCreditDetail: (String creditId, bool isMarketPlace) {
                // TODO: Revisit after the Credit Detail Page refactored so the page only need creditID to fetch Apis
                // if (eligibilityState.isPaymentEnabled) {
                //   context.router.push(
                //       CreditDetailsPageRoute(isMarketPlace: isMarketPlace));
                // } else {
                //   _showNoAccessSnackbar();
                // }
              },
              redirectClaimSubmission: () {
                if (!eligibilityState.isPaymentEnabled ||
                    !eligibilityState.salesOrg.isPaymentClaimEnabled) {
                  _showNoAccessSnackbar();

                  return;
                }
                context.read<ClaimManagementBloc>().add(
                      ClaimManagementEvent.initialized(
                        salesOrganisation: eligibilityState.salesOrganisation,
                        customerCodeInfo: eligibilityState.customerCodeInfo,
                        user: eligibilityState.user,
                      ),
                    );

                context.router.pushAll([
                  const ClaimManagementPageRoute(),
                  const NewClaimSubmissionPageRoute(),
                ]);
              },
              redirectNewReturnRequest: () {
                if (!eligibilityState.isReturnsEnable) {
                  _showNoAccessSnackbar();

                  return;
                }
                context.read<UsageCodeBloc>().add(
                      UsageCodeEvent.fetch(
                        salesOrg: eligibilityState.salesOrg,
                      ),
                    );
                context.read<ReturnItemsBloc>().add(
                      ReturnItemsEvent.initialized(
                        salesOrganisation: eligibilityState.salesOrganisation,
                        customerCodeInfo: eligibilityState.customerCodeInfo,
                        shipToInfo: eligibilityState.shipToInfo,
                        user: eligibilityState.user,
                      ),
                    );
                context.read<NewRequestBloc>().add(
                      NewRequestEvent.initialized(
                        salesOrg: eligibilityState.salesOrg,
                      ),
                    );
                context.router.pushAll([
                  const ReturnRootRoute(),
                  const NewRequestPageRoute(),
                ]);
              },
              redirectRaiseTicket: (String chatUrl) {
                context.navigateTo(SubmitTicketPageRoute(chatUrl: chatUrl));
              },
            );
          },
        ),
        BlocListener<SalesOrgBloc, SalesOrgState>(
          listenWhen: (previous, current) =>
              previous.isLoading != current.isLoading,
          listener: (context, state) {
            state.salesOrgFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                  _initBlocs(context);
                },
                (_) {},
              ),
            );
            if (!state.isLoading) {
              if (!state.haveSelectedSalesOrganisation) {
                _initBlocs(context);
              }
              if (state.haveSelectedSalesOrganisation &&
                  state.configs != SalesOrganisationConfigs.empty()) {
                final eligibilityState = context.read<EligibilityBloc>().state;
                context.read<EligibilityBloc>()
                  ..add(
                    EligibilityEvent.update(
                      salesOrganisation: state.salesOrganisation,
                      salesOrgConfigs: state.configs,
                      user: context.read<UserBloc>().state.user,
                    ),
                  )
                  ..add(
                    const EligibilityEvent.loadStoredCustomerCode(),
                  );
                context.read<CustomerCodeBloc>()
                  ..add(
                    CustomerCodeEvent.initialized(
                      userInfo: context.read<UserBloc>().state.user,
                      selectedSalesOrg: state.salesOrganisation,
                      hideCustomer: state.configs.hideCustomer,
                    ),
                  )
                  ..add(
                    CustomerCodeEvent.fetch(searchValue: SearchKey.empty()),
                  );
                context.read<CustomerCodeBloc>().add(
                      CustomerCodeEvent.fetchCustomerCodeConfig(
                        customerCodeInfo: eligibilityState.customerCodeInfo,
                      ),
                    );
                // context.read<HomePageBloc>().add(const HomePageEvent.refresh());
              }
            }
          },
        ),
        BlocListener<EligibilityBloc, EligibilityState>(
          listenWhen: (previous, current) =>
              previous.isLoadingCustomerCode != current.isLoadingCustomerCode &&
              !current.isLoadingCustomerCode,
          listener: (context, state) {
            final mandatoryShipTo = !state.preSelectShipTo &&
                !context.read<UserBloc>().state.isAppFirstLaunch;

            if (mandatoryShipTo) {
              context.router.push(const CustomerSearchPageRoute());
            }
          },
        ),
        BlocListener<EligibilityBloc, EligibilityState>(
          listenWhen: (previous, current) =>
              previous.isNetworkAvailable != current.isNetworkAvailable &&
              current.isNetworkAvailable,
          listener: (context, state) => locator<Upgrader>().updateVersionInfo(),
        ),
        BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
          listenWhen: (previous, current) =>
              previous.resetPasswordFailureOrSuccessOption !=
              current.resetPasswordFailureOrSuccessOption,
          listener: (context, state) {
            state.resetPasswordFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  if (failure == const ApiFailure.passwordResetKeyInvalid()) {
                    context.router
                        .push(const ResetPasswordLinkExpiredPageRoute());

                    return;
                  }

                  ErrorUtils.handleApiFailure(context, failure);
                },
                (success) => context.router
                    .push(const ForgetPasswordConfirmationPageRoute()),
              ),
            );
          },
        ),
        BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
          listenWhen: (previous, current) =>
              previous.isValidating != current.isValidating &&
              !current.isValidating,
          listener: (context, state) {
            state.resetPasswordFailureOrSuccessOption.fold(
              () {
                context.read<ResetPasswordBloc>().add(
                      ResetPasswordEvent.initialize(
                        resetPasswordKey: state.resetPasswordKey,
                        user: User.empty(),
                      ),
                    );
                context
                    .read<ForgotPasswordBloc>()
                    .add(const ForgotPasswordEvent.initialized());
                context.router.push(ResetPasswordPageRoute());
              },
              (_) {},
            );
          },
        ),
        BlocListener<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
          listenWhen: (previous, current) =>
              previous.isLoading != current.isLoading && !current.isLoading,
          listener: (context, state) {
            if (state.orderHistoryDetails != OrderHistoryDetails.empty()) {
              context.router.push(const ViewByOrderDetailsPageRoute());
            } else {
              CustomSnackBar(
                icon: const Icon(
                  Icons.info,
                  color: ZPColors.error,
                ),
                backgroundColor: ZPColors.errorSnackBarColor,
                messageText: context.tr(
                  'You do not have access to view this order',
                ),
              ).show(context);
            }
          },
        ),
      ],
      child: const _Splash(),
    );
  }

  void _fetchMaterialPrice(BuildContext context, List<MaterialInfo> list) =>
      context.read<MaterialPriceBloc>().add(
            MaterialPriceEvent.fetch(
              comboDealEligible:
                  context.read<EligibilityBloc>().state.comboDealEligible,
              materials: list,
            ),
          );

  void _fetchProductImage(BuildContext context, List list) =>
      context.read<ProductImageBloc>().add(
            ProductImageEvent.fetch(
              list: list,
            ),
          );

  void _fetchMaterialListProductImage(
    MaterialListState state,
    BuildContext context,
  ) {
    if (state.selectedMaterialFilter.bundleOffers) {
      for (final materialData in state.materialList) {
        _fetchProductImage(
          context,
          materialData.data,
        );
      }
    } else {
      _fetchProductImage(
        context,
        state.materialList,
      );
    }
  }

  // void _getAdminPoAttachment(EligibilityState eligibilityState) {
  //   if (!eligibilityState.user.accessRight.adminPOAttachment) return;
  //   final salesOrg = eligibilityState.salesOrganisation.salesOrg;
  //   final customerCodeInfo = eligibilityState.customerCodeInfo;

  //   context.read<AdminPoAttachmentFilterBloc>()
  //     ..add(AdminPoAttachmentFilterEvent.salesOrgChanged(salesOrg))
  //     ..add(AdminPoAttachmentFilterEvent.soldToChanged(customerCodeInfo));

  //   context.read<AdminPoAttachmentBloc>().add(
  //         AdminPoAttachmentEvent.fetch(
  //           adminPoAttachmentFilter: AdminPoAttachmentFilter.empty().copyWith(
  //             salesOrg: salesOrg,
  //             soldTo: customerCodeInfo,
  //           ),
  //         ),
  //       );
  // }

  void _showBioMetricPermissionDialog() {
    CustomDialogs.confirmationDialog(
      context: context,
      title: 'Permission Required!',
      message:
          'App wants to access Face id/Biometric to secure account access for logged in user. Please go to app settings and enable it.',
      confirmText: 'Settings',
      cancelText: 'Logout',
      onAcceptPressed: () async {
        final visited = await openAppSettings();
        if (mounted && visited) {
          context.read<AuthBloc>().add(const AuthEvent.visitedAppSettings());
        }
      },
      onCancelPressed: () async =>
          context.read<AuthBloc>().add(const AuthEvent.logout()),
    );
  }

  void _welcomeUserMessage(UserState userState) {
    if (userState.user.username.isValid()) {
      final welcomeMessage =
          '${context.tr('Welcome back')}, ${userState.user.username.getOrCrash()}';
      final loginOnBehalfMessage =
          '${context.tr('Logged in on behalf of')} ${userState.user.username.getOrCrash()}.';
      final message =
          userState.isLoginOnBehalf ? loginOnBehalfMessage : welcomeMessage;
      context
          .read<SettingBloc>()
          .add(const SettingEvent.checkIfBiometricPossible());
      CustomSnackBar(messageText: message).show(context);
    }
  }

  void _initializeSalesOrg(UserState userState) {
    final salesOrgBloc = context.read<SalesOrgBloc>();
    if (userState.haveSalesOrganisation) {
      salesOrgBloc.add(
        SalesOrgEvent.loadSavedOrganisation(
          salesOrganisations: userState.userSalesOrganisations,
        ),
      );
    }
  }

  void _initializeOrderingModule(EligibilityState state) {
    _initializeProduct(state);
    _initializeCart(state);
  }

  void _initializeProduct(EligibilityState eligibilityState) {
    context.read<MaterialFilterBloc>()
      ..add(const MaterialFilterEvent.resetFilter())
      ..add(
        MaterialFilterEvent.fetch(
          user: context.read<UserBloc>().state.user,
          salesOrganisation: eligibilityState.salesOrganisation,
          customerCodeInfo: eligibilityState.customerCodeInfo,
          shipToInfo: eligibilityState.shipToInfo,
          hasAccessToCovidMaterial: eligibilityState.canOrderCovidMaterial,
        ),
      );
    context.read<MaterialListBloc>().add(
          MaterialListEvent.initialized(
            salesOrganisation: eligibilityState.salesOrganisation,
            configs: eligibilityState.salesOrgConfigs,
            customerCodeInfo: eligibilityState.customerCodeInfo,
            shipToInfo: eligibilityState.shipToInfo,
            selectedMaterialFilter: MaterialFilter.empty(),
            user: eligibilityState.user,
          ),
        );
    context.read<ProductSearchBloc>().add(
          ProductSearchEvent.initialized(
            configs: eligibilityState.salesOrgConfigs,
            salesOrganization: eligibilityState.salesOrganisation,
            customerCodeInfo: eligibilityState.customerCodeInfo,
            shipToInfo: eligibilityState.shipToInfo,
            user: eligibilityState.user,
          ),
        );
    context.read<ProductImageBloc>().add(
          ProductImageEvent.initialized(
            salesOrganisation: eligibilityState.salesOrganisation,
            customerCodeInfo: eligibilityState.customerCodeInfo,
          ),
        );
    context.read<MaterialPriceBloc>().add(
          MaterialPriceEvent.initialized(
            salesOrganisation: eligibilityState.salesOrganisation,
            salesConfigs: eligibilityState.salesOrgConfigs,
            customerCodeInfo: eligibilityState.customerCodeInfo,
            shipToInfo: eligibilityState.shipToInfo,
          ),
        );
    context.read<ComboDealMaterialDetailBloc>().add(
          ComboDealMaterialDetailEvent.initialize(
            salesOrganisation: eligibilityState.salesOrganisation,
            customerCodeInfo: eligibilityState.customerCodeInfo,
            shipToInfo: eligibilityState.shipToInfo,
            salesConfigs: eligibilityState.salesOrgConfigs,
            user: eligibilityState.user,
          ),
        );
    context.read<ScanMaterialInfoBloc>().add(
          ScanMaterialInfoEvent.initialized(
            salesOrganisation: eligibilityState.salesOrganisation,
            customerCodeInfo: eligibilityState.customerCodeInfo,
            user: eligibilityState.user,
            shipToInfo: eligibilityState.shipToInfo,
            salesOrgConfigs: eligibilityState.salesOrgConfigs,
          ),
        );
  }

  void _initializeCart(EligibilityState eligibilityState) {
    context.read<CartBloc>().add(
          CartEvent.initialized(
            salesOrganisationConfigs: eligibilityState.salesOrgConfigs,
            salesOrganisation: eligibilityState.salesOrganisation,
            customerCodeInfo: eligibilityState.customerCodeInfo,
            shipToInfo: eligibilityState.shipToInfo,
            user: eligibilityState.user,
          ),
        );
    context.read<AdditionalDetailsBloc>().add(
          AdditionalDetailsEvent.initialized(
            config: eligibilityState.salesOrgConfigs,
            customerCodeInfo: eligibilityState.customerCodeInfo,
          ),
        );
    context.read<PoAttachmentBloc>().add(
          const PoAttachmentEvent.initialized(),
        );
    context.read<OrderSummaryBloc>().add(
          OrderSummaryEvent.initialized(
            shipToInfo: eligibilityState.shipToInfo,
            user: eligibilityState.user,
            customerCodeInfo: eligibilityState.customerCodeInfo,
            salesOrganisation: eligibilityState.salesOrganisation,
            salesOrgConfig: eligibilityState.salesOrgConfigs,
          ),
        );
  }

  void _initializeOrderHistoryModule(EligibilityState state) {
    if (state.user.userCanAccessOrderHistory) {
      context.read<ViewByItemsBloc>().add(
            ViewByItemsEvent.initialized(
              customerCodeInfo: state.customerCodeInfo,
              salesOrgConfigs: state.salesOrgConfigs,
              shipToInfo: state.shipToInfo,
              user: state.user,
              salesOrganisation: state.salesOrganisation,
            ),
          );
      context
          .read<ViewByItemFilterBloc>()
          .add(const ViewByItemFilterEvent.initialize());
      context.read<ViewByItemDetailsBloc>().add(
            ViewByItemDetailsEvent.initialized(
              salesOrganisation: state.salesOrganisation,
              customerCodeInfo: state.customerCodeInfo,
              salesOrgConfig: state.salesOrgConfigs,
              user: state.user,
              shipToInfo: state.shipToInfo,
            ),
          );
      context.read<ViewByOrderBloc>().add(
            ViewByOrderEvent.initialized(
              salesOrganisation: state.salesOrganisation,
              customerCodeInfo: state.customerCodeInfo,
              salesOrgConfigs: state.salesOrgConfigs,
              user: state.user,
              sortDirection: 'desc',
              shipToInfo: state.shipToInfo,
            ),
          );
      context.read<ViewByOrderFilterBloc>().add(
            ViewByOrderFilterEvent.initialized(
              salesOrganisation: state.salesOrganisation,
            ),
          );
      context.read<ViewByOrderDetailsBloc>().add(
            ViewByOrderDetailsEvent.initialized(
              customerCodeInfo: state.customerCodeInfo,
              user: state.user,
              salesOrganisation: state.salesOrganisation,
              shipToInfo: state.shipToInfo,
              configs: state.salesOrgConfigs,
            ),
          );
      context.read<ReOrderPermissionBloc>().add(
            ReOrderPermissionEvent.initialized(
              customerCodeInfo: state.customerCodeInfo,
              shipToInfo: state.shipToInfo,
              salesOrganisation: state.salesOrganisation,
              salesOrganisationConfigs: state.salesOrgConfigs,
              user: state.user,
            ),
          );
    }
  }

  void _initBlocs(BuildContext context) {
    context.read<CustomerCodeBloc>().add(
          CustomerCodeEvent.initialized(
            userInfo: context.read<UserBloc>().state.user,
            selectedSalesOrg:
                context.read<SalesOrgBloc>().state.salesOrganisation,
            hideCustomer:
                context.read<SalesOrgBloc>().state.configs.hideCustomer,
          ),
        );
  }

  void _logout(BuildContext context) {
    locator<MixpanelService>().onLogout();
    context.read<DeepLinkingBloc>().add(const DeepLinkingEvent.initialize());
    context.read<UserBloc>().add(const UserEvent.initialized());
    context.read<ChatBotBloc>().add(const ChatBotEvent.resetChatbot());
    context.read<EligibilityBloc>().add(const EligibilityEvent.initialized());
    context
        .read<AnnouncementBloc>()
        .add(const AnnouncementEvent.clearClosedTime());

    final appMarket = AppMarket(
      context.deviceLocale.countryCode?.toLowerCase() ??
          AppMarket.defaultMarket().getOrDefaultValue('kh'),
    ).defaultMarket;

    context.read<LoginFormBloc>().add(
          LoginFormEvent.loadLastSavedCred(appMarket),
        );

    // Check if the device's language code is supported
    if (context.supportedLocales
        .map((locale) => locale.languageCode)
        .contains(context.deviceLocale.languageCode)) {
      context.resetLocale();
    } else {
      context.setLocale(
        context.fallbackLocale ?? const Locale('en'),
      );
    }

    context.read<AnnouncementBloc>().add(
          const AnnouncementEvent.clearBannerId(),
        );
  }

  void _showNoAccessSnackbar({bool isOrder = false}) {
    CustomSnackBar(
      icon: const Icon(Icons.info, color: ZPColors.error),
      backgroundColor: ZPColors.errorSnackBarColor,
      messageText: context.tr(
        isOrder
            ? 'You do not have access to view this order'
            : "You don't have access",
      ),
    ).show(context);
  }
}

class _Splash extends StatelessWidget {
  const _Splash();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ZPColors.white,
      body: Image.asset(
        PngImage.splash,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
