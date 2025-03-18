import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_us.freezed.dart';

@freezed
class ContactUs with _$ContactUs {
  const ContactUs._();

  const factory ContactUs({
    required Username username,
    required EmailAddress email,
    required PhoneNumber contactNumber,
    required StringValue message,
  }) = _ContactUs;

  factory ContactUs.empty() => ContactUs(
        username: Username(''),
        email: EmailAddress(''),
        contactNumber: PhoneNumber(''),
        message: StringValue(''),
      );
}
