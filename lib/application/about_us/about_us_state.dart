part of 'about_us_bloc.dart';

@freezed
class AboutUsState with _$AboutUsState {
  const factory AboutUsState({
    required SalesOrg salesOrg,
    required bool isFetching,
    required AboutUs aboutUsInfo,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
  }) = _AboutUsState;

  factory AboutUsState.initial() => AboutUsState(
        salesOrg: SalesOrg(''),
        aboutUsInfo: AboutUs.empty(),
        apiFailureOrSuccessOption: none(),
        isFetching: false,
      );
}
