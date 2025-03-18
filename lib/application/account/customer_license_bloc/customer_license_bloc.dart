import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_license.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/account/repository/customer_license_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_license_event.dart';
part 'customer_license_state.dart';
part 'customer_license_bloc.freezed.dart';

class CustomerLicenseBloc
    extends Bloc<CustomerLicenseEvent, CustomerLicenseState> {
  final CustomerLicenseRepository customerLicenseRepository;
  final Config config;
  CustomerLicenseBloc({
    required this.customerLicenseRepository,
    required this.config,
  }) : super(CustomerLicenseState.initial()) {
    on<CustomerLicenseEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
    CustomerLicenseEvent event,
    Emitter<CustomerLicenseState> emit,
  ) async {
    await event.map(
      initialized: (e) async {
        emit(
          CustomerLicenseState.initial().copyWith(
            salesOrganization: e.salesOrganization,
            customerInfo: e.customerInfo,
            user: e.user,
          ),
        );

        add(const CustomerLicenseEvent.fetch());
      },
      fetch: (_Fetch e) async {
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
            customerLicenses: <CustomerLicense>[],
            canLoadMore: true,
          ),
        );
        final failureOrSuccessOption =
            await customerLicenseRepository.getCustomerLicense(
          customerCode: state.customerInfo,
          offset: 0,
          salesOrganisation: state.salesOrganization,
          pageSize: config.pageSize,
          user: state.user,
        );
        if (isClosed) return;
        failureOrSuccessOption.fold(
          (failure) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccessOption),
              isFetching: false,
            ),
          ),
          (customerLicenses) => emit(
            state.copyWith(
              failureOrSuccessOption: none(),
              isFetching: false,
              customerLicenses: customerLicenses,
              canLoadMore: customerLicenses.length >= config.pageSize,
            ),
          ),
        );
      },
      loadMore: (_LoadMore e) async {
        if (state.isFetching || !state.canLoadMore) return;
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccessOption =
            await customerLicenseRepository.getCustomerLicense(
          customerCode: state.customerInfo,
          offset: state.customerLicenses.length,
          salesOrganisation: state.salesOrganization,
          pageSize: config.pageSize,
          user: state.user,
        );
        if (isClosed) return;
        failureOrSuccessOption.fold(
          (failure) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccessOption),
              isFetching: false,
            ),
          ),
          (customerLicenses) {
            final updateCustomerLicenses =
                List<CustomerLicense>.from(state.customerLicenses)
                  ..addAll(customerLicenses);
            emit(
              state.copyWith(
                failureOrSuccessOption: none(),
                isFetching: false,
                customerLicenses: updateCustomerLicenses,
                canLoadMore: updateCustomerLicenses.length >= config.pageSize,
              ),
            );
          },
        );
      },
    );
  }
}
