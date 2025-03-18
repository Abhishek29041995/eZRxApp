part of 'usage_code_bloc.dart';

@freezed
class UsageCodeState with _$UsageCodeState {
  const UsageCodeState._();
  const factory UsageCodeState({
    required List<Usage> usages,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _UsageCodeState;

  factory UsageCodeState.initial() => UsageCodeState(
        failureOrSuccessOption: none(),
        usages: <Usage>[],
      );

  Usage getUsage(String code) => usages.firstWhere(
        (element) => element.usageCode == code,
        orElse: () => Usage.empty(),
      );
}
