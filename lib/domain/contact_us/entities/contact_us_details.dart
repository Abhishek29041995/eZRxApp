import 'package:ezrxmobile/domain/announcement_info/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_us_details.freezed.dart';

@freezed
class ContactUsDetails with _$ContactUsDetails {
  const ContactUsDetails._();
  const factory ContactUsDetails({
    required HtmlContent content,
    required String preloginSendToEmail,
    required String postloginSendToEmail,
  }) = _ContactUsDetails;

  factory ContactUsDetails.empty() => ContactUsDetails(
        content: HtmlContent(''),
        postloginSendToEmail: '',
        preloginSendToEmail: '',
      );
}
