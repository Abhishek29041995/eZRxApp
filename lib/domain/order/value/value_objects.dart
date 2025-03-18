import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_step.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/value/value_transformers.dart';

class CompanyName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CompanyName(String input) {
    return CompanyName._(validateStringNotEmpty(input));
  }

  String get name {
    return naIfEmpty(value.getOrElse(() => ''));
  }

  const CompanyName._(this.value);
}

class BundleName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory BundleName(String input) {
    return BundleName._(validateStringNotEmpty(input));
  }

  String get name {
    return naIfEmpty(value.getOrElse(() => '--'));
  }

  const BundleName._(this.value);
}

class SoldToParty extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory SoldToParty(String input) {
    return SoldToParty._(validateStringNotEmpty(input.trim()));
  }

  String get name {
    return naIfEmpty(value.getOrElse(() => ''));
  }

  const SoldToParty._(this.value);
}

class ShipToParty extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ShipToParty(String input) {
    return ShipToParty._(validateStringNotEmpty(input));
  }

  String get name {
    return naIfEmpty(value.getOrElse(() => ''));
  }

  const ShipToParty._(this.value);
}

class PrincipalName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PrincipalName(String input) {
    return PrincipalName._(validateStringNotEmpty(input));
  }

  String get name {
    return naIfEmpty(value.getOrElse(() => ''));
  }

  const PrincipalName._(this.value);
}

class PrincipalCode extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PrincipalCode(String input) {
    return PrincipalCode._(validateStringNotEmpty(input));
  }

  const PrincipalCode._(this.value);

  String get _valueOrEmpty => value.getOrElse(() => '');

  String get _shortValue => removeLeadingZero(_valueOrEmpty);

  bool get salesRepSubmitAllowed =>
      havingSubmitPrincipalForSalesRep(_shortValue);

  bool get isAllMaterial => havingPrincipalCodeForAllMaterial(_valueOrEmpty);

  bool get isPnG => havingPnGPrincipalCode(_shortValue);

  bool get isAbbot => havingAbbotPrincipalCode(_shortValue);

  bool get isMinistryOfHealth =>
      havingMinistryOfHealthPrincipalCode(_shortValue);
}

class MaterialNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MaterialNumber(String input) {
    return MaterialNumber._(validateStringNotEmpty(input));
  }

  String get displayMatNo =>
      naIfEmpty(removeLeadingZero(value.getOrElse(() => '')));

  const MaterialNumber._(this.value);
}

class MaterialInfoType extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MaterialInfoType(String input) {
    return MaterialInfoType._(validateStringNotEmpty(input));
  }

  factory MaterialInfoType.material() {
    return const MaterialInfoType._(Right('material'));
  }

  factory MaterialInfoType.bonus() {
    return const MaterialInfoType._(Right('bonus'));
  }

  factory MaterialInfoType.bundle() {
    return MaterialInfoType._(validateStringNotEmpty('bundle'));
  }

  factory MaterialInfoType.combo() {
    return MaterialInfoType._(validateStringNotEmpty('combo'));
  }

  bool get typeBundle => isBundle(value.getOrElse(() => ''));

  bool get typeMaterial => isMaterial(value.getOrElse(() => ''));

  bool get typeCombo => isCombo(value.getOrElse(() => ''));

  bool get typeBonus => isBonus(value.getOrElse(() => ''));

  bool get typeDealBonus => isDealsBonus(value.getOrElse(() => ''));

  bool get typeDealOrOverrideBonus =>
      isDealOrOverrideBonus(value.getOrElse(() => ''));

  int get sortPriority {
    if (typeCombo) return 3;
    if (typeBundle) return 2;

    return 1;
  }

  const MaterialInfoType._(this.value);
}

class MaterialCode extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MaterialCode(String input) {
    return MaterialCode._(validateStringNotEmpty(input));
  }

  String get displayMatNo {
    return naIfEmpty(removeLeadingZero(value.getOrElse(() => '')));
  }

  const MaterialCode._(this.value);
}

class MaterialInStock extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MaterialInStock(String input) {
    return MaterialInStock._(validateStringNotEmpty(input));
  }

  bool get isMaterialInStock {
    return getInStock(value.getOrElse(() => ''));
  }

  const MaterialInStock._(this.value);
}

class MaterialGroup extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MaterialGroup(String input) {
    return MaterialGroup._(Right(input));
  }

  const MaterialGroup._(this.value);
}

class MaterialPrice extends ValueObject<double> {
  static const unavailablePriceValue = -1.0;
  @override
  final Either<ValueFailure<double>, double> value;

  factory MaterialPrice(double input) => MaterialPrice._(Right(input));

  factory MaterialPrice.unavailable() =>
      const MaterialPrice._(Right(unavailablePriceValue));

  const MaterialPrice._(this.value);

  bool get isEmpty => value.getOrElse(() => 0) == 0;

  bool get isUnavailable => value.getOrElse(() => 0) == unavailablePriceValue;
}

class MaterialQty extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory MaterialQty(int input) => MaterialQty._(Right(input));

  const MaterialQty._(this.value);

  int get intValue => value.getOrElse(() => 0);

  bool get isQtyGreaterThanZero => intValue > 0;
}

class DiscountType extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory DiscountType(String input) {
    return DiscountType._(Right(input));
  }

  const DiscountType._(this.value);

  bool get isAmount {
    return !isEmpty && !isPercent;
  }

  bool get isPercent {
    return materialBundleTypeIsPercent(value.getOrElse(() => ''));
  }

  bool get isEmpty {
    return value.getOrElse(() => '').isEmpty;
  }
}

class ComboSuffix extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory ComboSuffix(String input) {
    return ComboSuffix._(validateIntegerValue(input));
  }

  String get stringValue => intToString(value.getOrElse(() => 0));

  const ComboSuffix._(this.value);
}

class MaterialTaxClassification extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MaterialTaxClassification(String input) {
    return MaterialTaxClassification._(Right(input));
  }

  const MaterialTaxClassification._(this.value);

  // In Tax classification we are only holding noTax value and for
  // other classifications we are checking [!isNoTax] which is considered
  // as Full Tax and Special Scheme

  bool get isNoTax {
    return materialEligibleForTaxExclusion(value.getOrElse(() => ''));
  }

// Need to revisit once Tax Exempt User story is ready
// bool get isExempt {
//   return materialTaxClassificationIsExempt(value.getOrElse(() => ''));
// }
}

class PaymentTermCode extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PaymentTermCode(String input) {
    return PaymentTermCode._(validateStringNotEmpty(input));
  }

  String get displayPaymentTermCode {
    return naIfEmpty(value.getOrElse(() => ''));
  }

  bool get isOutsideOfSystem =>
      isPaymentTermCodeOutsideOfSystem(value.getOrElse(() => ''));

  const PaymentTermCode._(this.value);
}

class PaymentTermDescription extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PaymentTermDescription(String input) {
    return PaymentTermDescription._(validateStringNotEmpty(input));
  }

  String get displayPaymentTermDescription {
    return naIfEmpty(value.getOrElse(() => ''));
  }

  const PaymentTermDescription._(this.value);
}

class CustomerClassification extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CustomerClassification(String input) {
    return CustomerClassification._(validateStringNotEmpty(input));
  }

  String get displayCustomerClassification {
    return naIfEmpty(value.getOrElse(() => ''));
  }

  const CustomerClassification._(this.value);
}

class PhoneNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PhoneNumber(String input) {
    return PhoneNumber._(validateStringNotEmpty(input));
  }

  String get validPhoneNumber => getValidPhoneNumber(value.getOrElse(() => ''));

  String get displayTelephoneNumber {
    return naIfEmpty(validPhoneNumber);
  }

  const PhoneNumber._(this.value);
}

class CountryCode extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CountryCode(String input) {
    return CountryCode._(validateStringNotEmpty(input));
  }

  const CountryCode._(this.value);
}

class TemplateName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory TemplateName(String input) {
    return TemplateName._(validateStringNotEmpty(input));
  }

  const TemplateName._(this.value);
}

class BonusMaterialCalculation extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory BonusMaterialCalculation(String input) {
    return BonusMaterialCalculation._(validateStringNotEmpty(input));
  }

  BonusMaterialCalculationEnum get getCalculationEnum =>
      getBonusCalculationEnum(value.getOrElse(() => ''));

  const BonusMaterialCalculation._(this.value);
}

class OrderItemType extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory OrderItemType(String input) {
    return OrderItemType._(validateStringNotEmpty(input));
  }

  bool get isMaterialTypeComm {
    return checkMaterialType(value.getOrElse(() => ''));
  }

  bool get isMaterialTypeBonus {
    return checkMaterialTypeBonus(value.getOrElse(() => ''));
  }

  const OrderItemType._(this.value);
}

class TenderContractNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory TenderContractNumber(String input) {
    return TenderContractNumber._(Right(input));
  }

  String get displayTenderContractNumber {
    return naIfEmpty(value.getOrElse(() => '-'));
  }

  bool get isContractNumberEmpty {
    return value.getOrElse(() => '').isEmpty;
  }

  bool get isContractNumberNotEmpty {
    return value.getOrElse(() => '').isNotEmpty;
  }

  String get displayTenderContractNumberInCart {
    return getTenderContractNumber(value.getOrElse(() => ''));
  }

  String get displayTenderContractItemNumber {
    return naIfEmpty(value.getOrElse(() => '-'));
  }

  String get displayTenderVisaNumber {
    return naIfEmpty(removeLeadingZero(value.getOrElse(() => '-')));
  }

  String get displayAnnouncementLetterNumber {
    return naIfEmpty(removeLeadingZero(value.getOrElse(() => '-')));
  }

  String get displayTenderContractReference {
    return getTenderContractNumber(value.getOrElse(() => ''));
  }

  const TenderContractNumber._(this.value);
}

class TenderContractReason extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory TenderContractReason(String input) {
    return TenderContractReason._(Right(input));
  }

  bool get is730 {
    return contractIs730(value.getOrElse(() => ''));
  }

  bool get isEmpty => value.getOrElse(() => '').isEmpty;

  bool get isNotEmpty => value.getOrElse(() => '').isNotEmpty;

  String get displayTenderContractReason {
    return naIfEmpty(removeLeadingZero(value.getOrElse(() => '-')));
  }

  String get tenderContractReasonTitle =>
      getTenderOrderReasonTitle(value.getOrElse(() => '-'));

  const TenderContractReason._(this.value);
}

class CollectiveNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CollectiveNumber(String input) {
    return CollectiveNumber._(validateStringNotEmpty(input));
  }

  const CollectiveNumber._(this.value);
}

class PaymentTerm extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PaymentTerm(String input) {
    return PaymentTerm._(validateStringNotEmpty(input));
  }

  String get getPaymentTerm => getPaymentTermValue(value.getOrElse(() => ''));

  const PaymentTerm._(this.value);
}

class Zdp8OverrideValue extends ValueObject<double> {
  @override
  final Either<ValueFailure<double>, double> value;

  factory Zdp8OverrideValue(double input) =>
      Zdp8OverrideValue._(validateNumberIsBiggerThanZero(input));

  const Zdp8OverrideValue._(this.value);
}

class OrderNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory OrderNumber(String input) {
    return OrderNumber._(validateStringNotEmpty(input));
  }

  const OrderNumber._(this.value);
}

class PriceOverrideValue extends ValueObject<double> {
  @override
  final Either<ValueFailure<double>, double> value;

  factory PriceOverrideValue(double input) =>
      PriceOverrideValue._(validateNumberIsBiggerThanZero(input));

  const PriceOverrideValue._(this.value);
}

class CounterOfferValue extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CounterOfferValue(String input) {
    return CounterOfferValue._(
      validateStringNotEmpty(input).flatMap(validateStringIsBiggerThanZero),
    );
  }

  double get doubleValue => getDoubleParsedValue(value.getOrElse(() => ''));

  String get stringValue => doubleValue.toString();

  PriceOverrideValue get toPriceOverrideValue =>
      getPriceOverrideValue(doubleValue);

  const CounterOfferValue._(this.value);
}

class CounterOfferDiscountValue extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CounterOfferDiscountValue(String input) {
    return CounterOfferDiscountValue._(
      validateStringNotEmpty(input)
          .flatMap(validateStringIsBiggerThanZero)
          .flatMap(
            (input) => validateInputIsLessThanMaxValue(input, 100),
          ),
    );
  }

  double get doubleValue => getDoubleParsedValue(value.getOrElse(() => ''));

  Zdp8OverrideValue get toZdp8OverrideValue =>
      getZdp8OverrideValue(doubleValue);

  const CounterOfferDiscountValue._(this.value);
}

class DocumentType extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  bool get isZPFB => isContainIgnoreCase(value.getOrElse(() => ''), 'zpfb');

  bool get isZPFC => isContainIgnoreCase(value.getOrElse(() => ''), 'zpfc');

  bool get isZPOR => isContainIgnoreCase(value.getOrElse(() => ''), 'zpor');

  bool get isZPVF => isContainIgnoreCase(value.getOrElse(() => ''), 'zpvf');

  bool get isZPFV => isContainIgnoreCase(value.getOrElse(() => ''), 'zpfv');

  bool get isSpecialOrderType => isZPFB || isZPFC;

  bool get isCovidOrderTypeForPH => isZPVF || isZPFV;

  bool get isCovidOrderTypeForSG => isZPFC;

  factory DocumentType(String input) =>
      DocumentType._(validateStringNotEmpty(input));

  factory DocumentType.zpor() => DocumentType('zpor');

  String get documentTypeCode {
    if (isZPFB) return 'ZPFB';
    if (isZPFC) return 'ZPFC';
    if (isZPOR) return 'ZPOR';

    return '';
  }

  const DocumentType._(this.value);
}

class ShippingCondition extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ShippingCondition(String input) {
    return ShippingCondition._(Right(input));
  }

  bool get isGreenDelivery {
    return isEqualsIgnoreCase(value.getOrElse(() => ''), 'GD');
  }

  const ShippingCondition._(this.value);
}

class FlexibleGroup extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory FlexibleGroup(String input) {
    return FlexibleGroup._(validateStringNotEmpty(input));
  }

  const FlexibleGroup._(this.value);
}

class ComboDealCategoryType extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ComboDealCategoryType(String input) {
    return ComboDealCategoryType._(validateStringNotEmpty(input));
  }

  bool get isMaterialNumber =>
      isEqualsIgnoreCase(value.getOrElse(() => ''), 'MATNR');

  bool get isPrinciple =>
      isEqualsIgnoreCase(value.getOrElse(() => ''), 'ZPRINC');

  const ComboDealCategoryType._(this.value);
}

class ZDP5Info extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ZDP5Info(String input) {
    return ZDP5Info._(Right(input));
  }

  int get intValue => getParsedValue(value.getOrElse(() => ''));

  bool get isValidValue => isValueNotEmpty(value.getOrElse(() => ''));

  const ZDP5Info._(this.value);
}

class Ean extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Ean(String input) {
    return Ean._(validateStringNotEmpty(input));
  }

  const Ean._(this.value);
}

class DataTotalHidden extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory DataTotalHidden(int input) => DataTotalHidden._(Right(input));

  const DataTotalHidden._(this.value);

  bool get isDataHidden => notZero(value.getOrElse(() => 0));
}

class FavouriteResponse extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory FavouriteResponse(int input) => FavouriteResponse._(Right(input));

  const FavouriteResponse._(this.value);

  bool get isSuccessful => checkIfSuccessful(value.getOrElse(() => 0));
}

class Prsfd extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Prsfd(String input) {
    return Prsfd._(validateStringNotEmpty(input));
  }

  bool get isBonus => isBonusReturnType(value.getOrElse(() => ''));

  const Prsfd._(this.value);
}

class LineNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory LineNumber(String input) {
    return LineNumber._(validateStringNotEmpty(input));
  }

  int get parentIntValue => getParentLineNumberIntValue(intValue);

  int get intValue => getParsedValue(value.getOrElse(() => ''));

  const LineNumber._(this.value);
}

class OrderStepValue extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory OrderStepValue(String input) {
    return OrderStepValue._(validateStringNotEmpty(input));
  }

  const OrderStepValue._(this.value);

  String get displayOrderStatus => getOrderStatus(value.getOrElse(() => ''));

  String get displaySAPOrderStatus =>
      getOrderSAPStatus(value.getOrElse(() => ''));

  String get deliveryDateTitle =>
      getDeliveryDateTitle(value.getOrElse(() => ''));

  List<OrderHistoryStep> get viewByOrderHistorySteps => getOrderHistorySteps(
        isViewByOrder: true,
        stepTitle: value.getOrElse(() => ''),
      );

  bool get isInQueue => checkIfInQueue(value.getOrElse(() => ''));

  String get orderConfirmationIcon =>
      queueStateToOrderConfirmationIcon(isInQueue);

  String get orderConfirmationPrefixMessage =>
      queueStateToOrderConfirmationPrefixMessage(isInQueue);

  String get orderConfirmationSuffixMessage =>
      queueStateToOrderConfirmationSuffixMessage(isInQueue);

  String get prefix => getOrderNumberPrefix(isInQueue);

  List<OrderHistoryStep> get viewByItemHistorySteps => getOrderHistorySteps(
        isViewByOrder: false,
        stepTitle: displaySAPOrderStatus,
      );
}

class ScaleBasis extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ScaleBasis(String input) {
    return ScaleBasis._(validateStringNotEmpty(input));
  }

  bool get isValueScale => value.getOrElse(() => '').toUpperCase() == 'B';

  bool get isQuantityScale => value.getOrElse(() => '').toUpperCase() == 'C';

  const ScaleBasis._(this.value);
}

class ItemRegistrationNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ItemRegistrationNumber(String input) =>
      ItemRegistrationNumber._(validateStringNotEmpty(input));

  String get displayDashIfEmpty => dashIfEmpty((value.getOrElse(() => '')));

  bool get isNotEmpty => value.getOrElse(() => '').isNotEmpty;

  bool get isValueIsNotRequired =>
      checkIfValueIsNotRequired(value.getOrElse(() => ''));

  bool get isValidIRN => isNotEmpty && !isValueIsNotRequired;

  const ItemRegistrationNumber._(this.value);
}

class DeliveryOption extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory DeliveryOption.standardDelivery() =>
      DeliveryOption('standardDelivery');

  factory DeliveryOption.requestDeliveryDate() =>
      DeliveryOption('requestDeliveryDate');

  factory DeliveryOption.urgentDelivery() => DeliveryOption('urgentDelivery');

  factory DeliveryOption(String input) =>
      DeliveryOption._(validateStringNotEmpty(input));

  const DeliveryOption._(this.value);

  String get title => getDeliveryOptionTitle(value.getOrElse(() => ''));

  String get icon => getDeliveryOptionIcon(value.getOrElse(() => ''));

  String get description =>
      getDeliveryOptionDescription(value.getOrElse(() => ''));

  String get price => getDeliveryOptionPrice(value.getOrElse(() => ''));
}

class UrgentDeliveryTimePickerOption extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory UrgentDeliveryTimePickerOption.today() =>
      UrgentDeliveryTimePickerOption('todayUrgentDelivery');

  factory UrgentDeliveryTimePickerOption.tomorrow() =>
      UrgentDeliveryTimePickerOption('tomorrowUrgentDelivery');

  factory UrgentDeliveryTimePickerOption.saturday() =>
      UrgentDeliveryTimePickerOption('saturdayUrgentDelivery');

  factory UrgentDeliveryTimePickerOption(String input) =>
      UrgentDeliveryTimePickerOption._(validateStringNotEmpty(input));

  const UrgentDeliveryTimePickerOption._(this.value);

  String get title =>
      getUrgentDeliveryTimePickerOptionTitle(value.getOrElse(() => ''));
}
