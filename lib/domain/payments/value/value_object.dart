import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';
import 'package:ezrxmobile/domain/payments/value/value_transformers.dart';

class SoaData extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory SoaData(String input) {
    return SoaData._(validateStringNotEmpty(input));
  }

  DateTimeStringValue get simpleDateStringValue => DateTimeStringValue(
        findDate(value.getOrElse(() => '')),
      );

  String get simpleDateString => displayDateTimeString(
        findDate(value.getOrElse(() => '')),
        DateTimeFormatString.displaySimpleDateFormat,
      );

  DateTime get date =>
      tryParseDateTime(findDate(value.getOrElse(() => ''))) ?? DateTime.now();

  const SoaData._(this.value);
}

class PaymentMethodValue extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PaymentMethodValue(String input) {
    return PaymentMethodValue._(validateStringNotEmpty(input));
  }

  bool get isQrCode => checkIsQrCode(value.getOrElse(() => ''));

  bool get isPaymentGateway => checkIsPaymentGateway(value.getOrElse(() => ''));

  bool get isBankIn => checkIsBankIn(value.getOrElse(() => ''));

  bool get isAPL => checkIsAPL(value.getOrElse(() => ''));

  bool get displayWarningAnnoucement => isBankIn || isQrCode;

  const PaymentMethodValue._(this.value);
}

class BankOptionId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory BankOptionId(String input) {
    return BankOptionId._(validateStringNotEmpty(input));
  }

  bool get isBNI => checkIsBNI(value.getOrElse(() => ''));

  bool get isBCA => checkIsBCA(value.getOrElse(() => ''));

  bool get banksOnlyAllowTransferSameBank => !isBNI && !isBCA;

  const BankOptionId._(this.value);
}

class PaymentDue extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PaymentDue(String input) {
    return PaymentDue._(validateStringNotEmpty(input));
  }

  String get totalAmount => getTotalAmount(value.getOrElse(() => ''));
  const PaymentDue._(this.value);
}

class AdviceExpiryValue extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory AdviceExpiryValue(String input) {
    return AdviceExpiryValue._(validateStringNotEmpty(input));
  }

  int get expiryDays => getExpiryDays(value.getOrElse(() => ''));

  const AdviceExpiryValue._(this.value);
}

class DebitCreditCode extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory DebitCreditCode(String input) {
    return DebitCreditCode._(validateStringNotEmpty(input));
  }

  bool get isCredit => checkIsCreditByCode(value.getOrElse(() => ''));

  bool get isDedit => checkIsDebitByCode(value.getOrElse(() => ''));

  const DebitCreditCode._(this.value);
}

class ReferenceId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ReferenceId(String input) {
    return ReferenceId._(validateStringNotEmpty(input));
  }

  String get referenceListString =>
      getReferenceListString(value.getOrElse(() => ''));

  const ReferenceId._(this.value);
}

class TransactionStatus extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory TransactionStatus(String input) =>
      TransactionStatus._(validateStringNotEmpty(input));

  const TransactionStatus._(this.value);

  bool get paymentMYFailed =>
      isPaymentMYFailedStatusCode(value.getOrElse(() => ''));

  bool get paymentMarketPlaceFailed =>
      isPaymentMarketPlaceFailedStatusCode(value.getOrElse(() => ''));
}

class ClaimType extends ValueObject<int> {
  static final supportClaimTypes = List.generate(
    9,
    (index) => ClaimType(index + 1),
  );

  factory ClaimType(int input) => ClaimType._(Right(input));

  factory ClaimType.empty() => ClaimType(-1);

  @override
  final Either<ValueFailure<int>, int> value;

  const ClaimType._(this.value);

  String get title => getClaimTypeTitle(value.getOrElse(() => -1));

  String get data => getClaimTypeDataSubmit(value.getOrElse(() => -1));

  List<SupportDocumentType> get documentTypes =>
      checkIsNeedFullDocument(value.getOrElse(() => -1))
          ? SupportDocumentType.fullDocument
          : SupportDocumentType.notIncludeCopyDocument;

  bool get isEmpty => this == ClaimType.empty();

  bool get isNotEmpty => this != ClaimType.empty();
}

class SupportDocumentType extends ValueObject<int> {
  static final fullDocument = [
    SupportDocumentType.proofOfBillingSOA(),
    SupportDocumentType.agreement(),
    SupportDocumentType.poCopy(),
    SupportDocumentType.invoiceCopy(),
    SupportDocumentType.supportingComputation(),
  ];

  static final notIncludeCopyDocument = [
    SupportDocumentType.proofOfBillingDMSOAMSF(),
    SupportDocumentType.agreement(),
    SupportDocumentType.supportingComputation(),
  ];

  factory SupportDocumentType(int input) => SupportDocumentType._(Right(input));

  factory SupportDocumentType.proofOfBillingSOA() => SupportDocumentType(0);

  factory SupportDocumentType.proofOfBillingDMSOAMSF() =>
      SupportDocumentType(1);

  factory SupportDocumentType.agreement() => SupportDocumentType(2);

  factory SupportDocumentType.poCopy() => SupportDocumentType(3);

  factory SupportDocumentType.invoiceCopy() => SupportDocumentType(4);

  factory SupportDocumentType.supportingComputation() => SupportDocumentType(5);

  @override
  final Either<ValueFailure<int>, int> value;

  const SupportDocumentType._(this.value);

  String get title => getSupportDocumentTitle(value.getOrElse(() => -1));
}
