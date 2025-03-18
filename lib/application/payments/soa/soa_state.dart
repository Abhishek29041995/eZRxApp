part of 'soa_bloc.dart';

@freezed
class SoaState with _$SoaState {
  const SoaState._();
  const factory SoaState({
    required bool isFetching,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required List<Soa> soaList,
    required SoaFilter appliedFilter,
  }) = _SoaState;

  factory SoaState.initial() => SoaState(
        isFetching: false,
        failureOrSuccessOption: none(),
        soaList: <Soa>[],
        appliedFilter: SoaFilter.empty(),
      );

  List<Soa> get filterList => appliedFilter.isAppliedFilterValid
      ? soaList.getSoaListRespectMonth
          .where(
            (element) => (DateUtils.isSameMonth(
                  element.soaData.date,
                  appliedFilter.fromDate.dateTime,
                ) ||
                DateUtils.isSameMonth(
                  element.soaData.date,
                  appliedFilter.toDate.dateTime,
                ) ||
                (element.soaData.date
                        .isAfter(appliedFilter.fromDate.dateTime) &&
                    element.soaData.date
                        .isBefore(appliedFilter.toDate.dateTime))),
          )
          .toList()
      : soaList.getSoaListRespectMonth;

}
