part of 'about_us_bloc.dart';

@freezed
class AboutUsEvent with _$AboutUsEvent {
  const factory AboutUsEvent.initialize({
    required SalesOrg salesOrg,
  }) = _Initialize;
  const factory AboutUsEvent.fetchAboutUsInfo() = _FetchAboutUsInfo;

  const factory AboutUsEvent.fetchAboutUsStaticInfo() = _FetchAboutUsStaticInfo;
}
