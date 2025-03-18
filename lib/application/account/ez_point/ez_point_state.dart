part of 'ez_point_bloc.dart';

@freezed
class EZPointState with _$EZPointState {
  const factory EZPointState({
    required bool isFetching,
    required Option<Either<ApiFailure, dynamic>>
        eZPointTokenFailureOrSuccessOption,
    required EZPointToken ezPointToken,
  }) = _EZPointState;
  factory EZPointState.initial() => EZPointState(
        isFetching: false,
        eZPointTokenFailureOrSuccessOption: none(),
        ezPointToken: EZPointToken.empty(),
      );
}
