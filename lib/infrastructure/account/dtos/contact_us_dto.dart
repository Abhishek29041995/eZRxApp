import 'package:ezrxmobile/domain/account/entities/contact_us.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_us_dto.freezed.dart';
part 'contact_us_dto.g.dart';

@freezed
class ContactUsDto with _$ContactUsDto {
  const ContactUsDto._();

  const factory ContactUsDto({
    @JsonKey(name: 'name', defaultValue: '') required String name,
    @JsonKey(name: 'contactNumber', defaultValue: '')
        required String contactNumber,
    @JsonKey(name: 'email', defaultValue: '') required String email,
    @JsonKey(name: 'message', defaultValue: '') required String message,
  }) = _ContactUsDto;

  factory ContactUsDto.fromDomain(
    ContactUs contactUs,
  ) {
    return ContactUsDto(
      name: contactUs.username.getOrCrash(),
      contactNumber: contactUs.contactNumber.getOrCrash(),
      email: contactUs.email.getOrCrash(),
      message: contactUs.message.getOrCrash(),
    );
  }

  ContactUs toDomain() {
    return ContactUs(
      username: Username(name),
      contactNumber: PhoneNumber(contactNumber),
      email: EmailAddress(email),
      message: StringValue(message),
    );
  }

  factory ContactUsDto.fromJson(Map<String, dynamic> json) =>
      _$ContactUsDtoFromJson(json);
}
