import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/account_selector.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/order_type.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/repository/i_customer_code_repository.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/chatbot/repository/i_chatbot_repository.dart';
import 'package:ezrxmobile/domain/connectivity/i_connectivity_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/mixpanel/repository/i_mixpanel_repository.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/repository/i_stock_info_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'eligibility_event.dart';

part 'eligibility_state.dart';

part 'eligibility_bloc.freezed.dart';

class EligibilityBloc extends Bloc<EligibilityEvent, EligibilityState> {
  final IChatBotRepository chatBotRepository;
  final IMixpanelRepository mixpanelRepository;
  final ICustomerCodeRepository customerCodeRepository;
  final IConnectivityRepository connectivityRepository;
  final Config config;
  StreamSubscription<bool>? _stockApiStatusStreamSubscription;
  IStockInfoRepository stockRepository;
  StreamSubscription<bool>? _connectivityStreamSubscription;

  EligibilityBloc({
    required this.chatBotRepository,
    required this.mixpanelRepository,
    required this.customerCodeRepository,
    required this.config,
    required this.stockRepository,
    required this.connectivityRepository,
  }) : super(EligibilityState.initial()) {
    on<EligibilityEvent>(_onEvent);
    this
      ..add(const EligibilityEvent.watchStockApiStatus())
      ..add(const EligibilityEvent.watchConnectivityStatus());
  }

  Future<void> _onEvent(
    EligibilityEvent event,
    Emitter<EligibilityState> emit,
  ) async {
    await event.map(
      initialized: (_) {
        emit(EligibilityState.initial());
      },
      update: (e) {
        emit(
          state.copyWith(
            user: e.user,
            salesOrganisation: e.salesOrganisation,
            salesOrgConfigs: e.salesOrgConfigs,
          ),
        );
      },
      selectedCustomerCode: (e) async {
        final failureOrSuccess = await customerCodeRepository.storeCustomerInfo(
          customerCode: e.customerCodeInfo.customerCodeSoldTo,
          shippingAddress: e.shipToInfo.shipToCustomerCode,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (success) => emit(
            state.copyWith(
              customerCodeInfo: e.customerCodeInfo,
              shipToInfo: e.shipToInfo,
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
        );
      },
      loadStoredCustomerCode: (e) async {
        emit(
          state.copyWith(
            isLoadingCustomerCode: true,
            preSelectShipTo: false,
          ),
        );

        final customerStorageSuccessOrFailure =
            await customerCodeRepository.getCustomerCodeStorage();
        if (isClosed) return;
        final lastSavedCustomerInfo = customerStorageSuccessOrFailure.fold(
          (_) => AccountSelector.empty(),
          (accountSelector) => accountSelector,
        );

        if (lastSavedCustomerInfo.customerCode.isEmpty) {
          add(
            const EligibilityEvent.fetchAndPreSelectCustomerCode(),
          );

          return;
        }

        // Using the last saved shippingAddress to fetch current customerInformation
        // as we do not receive all the shipToCodes associated with a customerCode
        // at once. Necessary because when using the last saved customerCode,
        // If the required shipToCode is on a paginated page beyond the first,
        // the default behavior sets the first shipToCode as the shippingAddress.

        final failureOrSuccess = await customerCodeRepository.getCustomerCode(
          salesOrganisation: state.salesOrganisation,
          searchKey: SearchKey.search(lastSavedCustomerInfo.shippingAddress),
          hideCustomer: state.salesOrgConfigs.hideCustomer,
          user: state.user,
          pageSize: config.pageSize,
          offset: 0,
        );
        if (isClosed) return;
        final customerCodeInfoList =
            failureOrSuccess.fold<List<CustomerCodeInfo>>(
          (_) => <CustomerCodeInfo>[],
          (customerInformation) => customerInformation.soldToInformation,
        );

        if (customerCodeInfoList.isEmpty) {
          add(
            const EligibilityEvent.fetchAndPreSelectCustomerCode(),
          );

          return;
        }

        var shipToInfo = customerCodeInfoList.first.shipToInfos.first;
        if (lastSavedCustomerInfo.shippingAddress.isNotEmpty) {
          shipToInfo = customerCodeInfoList.first.shipToInfos.firstWhere(
            (shipToInfo) =>
                shipToInfo.shipToCustomerCode ==
                lastSavedCustomerInfo.shippingAddress,
            orElse: () => customerCodeInfoList.first.shipToInfos.first,
          );
        }

        final customerCodeInfo = customerCodeInfoList.firstWhere(
          (element) =>
              element.customerCodeSoldTo == lastSavedCustomerInfo.customerCode,
          orElse: () => customerCodeInfoList.first,
        );

        emit(
          state.copyWith(
            customerCodeInfo: customerCodeInfo,
            shipToInfo: shipToInfo,
            isLoadingCustomerCode: false,
            preSelectShipTo: true,
          ),
        );
      },
      fetchAndPreSelectCustomerCode: (e) async {
        final failureOrSuccess = await customerCodeRepository.getCustomerCode(
          salesOrganisation: state.salesOrganisation,
          searchKey: SearchKey.empty(),
          hideCustomer: state.salesOrgConfigs.hideCustomer,
          user: state.user,
          pageSize: config.pageSize,
          offset: 0,
        );
        if (isClosed) return;
        final customerCodeInfoList =
            failureOrSuccess.fold<List<CustomerCodeInfo>>(
          (_) => <CustomerCodeInfo>[],
          (customerInformation) => customerInformation.soldToInformation,
        );

        emit(
          state.copyWith(
            customerCodeInfo: customerCodeInfoList.preSelectedCustomerCodeInfo,
            shipToInfo: customerCodeInfoList.preSelectedShipToInfo,
            isLoadingCustomerCode: false,
            preSelectShipTo: customerCodeInfoList.canPreSelectShipToCode,
          ),
        );
      },
      registerChatBot: (e) async {
        mixpanelRepository.registerSuperProps(
          user: state.user,
          salesOrg: state.salesOrg,
          salesOrgConfigs: state.salesOrgConfigs,
          customerCodeInfo: state.customerCodeInfo,
          shipToInfo: state.shipToInfo,
        );

        final failureOrSuccess = await chatBotRepository.passPayloadToChatbot(
          salesOrganisation: state.salesOrganisation,
          user: state.user,
          salesOrganisationConfigs: state.salesOrgConfigs,
          customerCodeInfo: state.customerCodeInfo,
          shipToInfo: state.shipToInfo,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (value) {
            emit(
              state.copyWith(
                failureOrSuccessOption: none(),
              ),
            );
          },
        );
      },
      updatedCustomerCodeConfig: (_UpdatedCustomerCodeConfig e) {
        emit(
          state.copyWith(
            customerCodeConfig: e.customerCodeConfig,
          ),
        );
      },
      updateStockInfoAvailability: (_UpdateStockInfoAvailability e) {
        emit(
          state.copyWith(
            isStockInfoNotAvailable: e.isStockInfoNotAvailable,
          ),
        );
      },
      watchStockApiStatus: (_WatchStockApiStatus e) {
        _stockApiStatusStreamSubscription?.cancel();
        _stockApiStatusStreamSubscription =
            stockRepository.watchStockApiStatus().listen((event) {
          add(
            EligibilityEvent.updateStockInfoAvailability(
              isStockInfoNotAvailable: event,
            ),
          );
        });
      },
      watchConnectivityStatus: (_WatchConnectivityStatus value) async {
        await _connectivityStreamSubscription?.cancel();

        _connectivityStreamSubscription =
            connectivityRepository.watchNetworkAvailability().listen(
          (isNetworkAvailable) {
            if (isClosed) return;
            add(
              EligibilityEvent.updateNetworkAvailability(
                isNetworkAvailable: isNetworkAvailable,
              ),
            );
          },
        );
        final failureOrSuccess =
            await connectivityRepository.initializeConnectivity();
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (_) {},
        );
      },
      updateNetworkAvailability: (_UpdateNetworkAvailability value) {
        emit(
          state.copyWith(
            isNetworkAvailable: value.isNetworkAvailable,
          ),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    await _stockApiStatusStreamSubscription?.cancel();
    await _connectivityStreamSubscription?.cancel();

    return super.close();
  }
}
