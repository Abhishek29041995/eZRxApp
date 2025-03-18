part of 'payment_in_progress_bloc.dart';

@freezed
class PaymentInProgressState with _$PaymentInProgressState {
  const PaymentInProgressState._();
  const factory PaymentInProgressState({
    required StringValue amount,
    required bool isFetching,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _PaymentSummaryState;

  factory PaymentInProgressState.initial() => PaymentInProgressState(
        failureOrSuccessOption: none(),
        isFetching: false,
        amount: StringValue(''),
      );
}
