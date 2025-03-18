part of 'download_e_credit_bloc.dart';

@freezed
class DownloadECreditState with _$DownloadECreditState {
  const factory DownloadECreditState({
    required DownloadPaymentAttachment fileUrl,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool isDownloading,
  }) = _DownloadECreditState;

  factory DownloadECreditState.initial() => DownloadECreditState(
        failureOrSuccessOption: none(),
        isDownloading: false,
        fileUrl: DownloadPaymentAttachment.empty(),
      );
}
