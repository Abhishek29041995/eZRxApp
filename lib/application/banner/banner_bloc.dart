import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/banner/repository/i_banner_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_bloc.freezed.dart';
part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final IBannerRepository bannerRepository;
  BannerBloc({required this.bannerRepository}) : super(BannerState.initial()) {
    on<BannerEvent>(_onEvent);
  }

  Future<void> _onEvent(BannerEvent event, Emitter<BannerState> emit) async {
    await event.map(
      initialized: (e) {
        emit(BannerState.initial());
      },
      fetch: (e) async {
        emit(state.copyWith(isLoading: true));
        //Fetch eZReach Banner
        final eZReachFailureOrSuccess = await bannerRepository.getEZReachBanner(
          salesOrganisation: e.salesOrganisation,
          country: e.country,
          role: e.role,
          bannerType: e.bannerType,
          branchCode: e.branchCode,
          targetCustomerType: e.targetCustomerType,
        );
        if (isClosed) return;
        eZReachFailureOrSuccess.fold(
          //eZReach Banner failed
          (failure) => emit(
            state.copyWith(
              banner: <EZReachBanner>[],
              bannerFailureOrSuccessOption: optionOf(eZReachFailureOrSuccess),
              isLoading: false,
            ),
          ),
          //eZReach Banner success
          (eZReachBannerList) => emit(
            state.copyWith(
              banner: eZReachBannerList, // Only eZReach banner success
              bannerFailureOrSuccessOption: none(),
              isLoading: false,
            ),
          ),
        );
      },
    );
  }
}
