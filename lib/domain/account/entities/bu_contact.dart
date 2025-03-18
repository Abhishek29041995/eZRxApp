import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bu_contact.freezed.dart';

@freezed
class BuContact with _$BuContact {
  const BuContact._();

  const factory BuContact({
    required String instruction,
    required List<PhoneNumber> phoneNumbers,
  }) = _BuContact;

  factory BuContact.empty() => const BuContact(
        instruction: '',
        phoneNumbers: <PhoneNumber>[],
      );

  factory BuContact.salesOrgContact({
    required String instruction,
    required List<PhoneNumber> phoneNumbers,
  }) =>
      BuContact(
        instruction: instruction,
        phoneNumbers: phoneNumbers,
      );
}
