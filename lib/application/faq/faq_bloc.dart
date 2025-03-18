import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/faq/entity/faq_info.dart';
import 'package:ezrxmobile/domain/faq/entity/faq_item.dart';
import 'package:ezrxmobile/domain/faq/repository/i_faq_repositoty.dart';
import 'package:ezrxmobile/domain/faq/value/value_object.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_event.dart';
part 'faq_state.dart';
part 'faq_bloc.freezed.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  final IFAQInfoRepository faqInfoRepository;
  final Config config;
  FaqBloc({required this.faqInfoRepository, required this.config})
      : super(FaqState.initial()) {
    on<FaqEvent>(_onEvent);
  }

  Future<FutureOr<void>> _onEvent(
    FaqEvent event,
    Emitter<FaqState> emit,
  ) async {
    await event.map(
      getFaq: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
            faqInfo: FAQInfo.empty(),
            searchKey: SearchKey.empty(),
          ),
        );

        final failureOrSuccessOption = await faqInfoRepository.getFAQList(
          salesOrg: e.salesOrg,
          pageSize: config.pageSize,
          after: state.faqInfo.endCursor,
        );
        if (isClosed) return;
        failureOrSuccessOption.fold(
          (failure) => emit(
            state.copyWith(
              isFetching: false,
              apiFailureOrSuccessOption: optionOf(failureOrSuccessOption),
            ),
          ),
          (faqInfo) => emit(
            state.copyWith(
              faqInfo: faqInfo,
              isFetching: false,
              apiFailureOrSuccessOption: optionOf(failureOrSuccessOption),
              selectedCategory: FAQCategory('All'),
              canLoadMore: faqInfo.faqList.length > config.pageSize,
            ),
          ),
        );
      },
      loadMoreAFaq: (e) async {
        if (state.isFetching || !state.canLoadMore) return;
        emit(
          state.copyWith(
            isFetching: true,
            apiFailureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccessOption = await faqInfoRepository.getFAQList(
          salesOrg: e.salesOrg,
          pageSize: config.pageSize,
          after: state.faqInfo.endCursor,
        );
        if (isClosed) return;
        failureOrSuccessOption.fold(
          (failure) => emit(
            state.copyWith(
              isFetching: false,
              apiFailureOrSuccessOption: optionOf(failureOrSuccessOption),
            ),
          ),
          (faqInfo) {
            emit(
              state.copyWith(
                faqInfo: faqInfo.copyWith(
                  faqList: [...state.faqInfo.faqList, ...faqInfo.faqList],
                ),
                canLoadMore: faqInfo.faqList.length >= config.pageSize,
                isFetching: false,
                apiFailureOrSuccessOption: optionOf(failureOrSuccessOption),
              ),
            );
          },
        );
      },
      filterByFaqCategory: (e) {
        emit(
          state.copyWith(
            selectedCategory:
                FAQCategory(e.selectedCategory.getOrDefaultValue('')),
          ),
        );
      },
      updateSearchKey: (e) {
        if (!e.searchKey.isValid()) return;

        emit(state.copyWith(searchKey: e.searchKey));
      },
    );
  }
}
