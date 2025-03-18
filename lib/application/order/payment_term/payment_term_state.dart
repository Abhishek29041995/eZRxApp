part of 'payment_term_bloc.dart';

@freezed
class PaymentTermState with _$PaymentTermState {
  const PaymentTermState._();

  const factory PaymentTermState({
    required List<PaymentTerm> paymentTerms,
    required bool isFetching,
    required Option<Either<ApiFailure, dynamic>>
        paymentTermsFailureOrSuccessOption,
  }) = _PaymentTermState;

  factory PaymentTermState.initial() => PaymentTermState(
        paymentTerms: <PaymentTerm>[],
        isFetching: false,
        paymentTermsFailureOrSuccessOption: none(),
      );
}
