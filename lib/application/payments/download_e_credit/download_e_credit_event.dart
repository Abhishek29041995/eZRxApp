part of 'download_e_credit_bloc.dart';

@freezed
class DownloadECreditEvent with _$DownloadECreditEvent {
  const factory DownloadECreditEvent.fetchECreditDownloadUrl({
    required String eCredit,
  }) = _FetchECreditDownloadUrl;
  const factory DownloadECreditEvent.downloadECredit() = _DownloadECredit;
}
