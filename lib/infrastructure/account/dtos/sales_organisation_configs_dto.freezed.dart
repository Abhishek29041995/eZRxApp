// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_organisation_configs_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalesOrganisationConfigsDto _$SalesOrganisationConfigsDtoFromJson(
    Map<String, dynamic> json) {
  return _SalesOrganisationConfigsDto.fromJson(json);
}

/// @nodoc
mixin _$SalesOrganisationConfigsDto {
  @JsonKey(name: 'disableProcessingStatus')
  bool get disableProcessingStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency')
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'hideCustomer', defaultValue: false)
  bool get hideCustomer => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableGimmickMaterial', defaultValue: false)
  bool get enableGimmickMaterial => throw _privateConstructorUsedError;
  @JsonKey(name: 'disablePrincipals', defaultValue: false)
  bool get disablePrincipals => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalList')
  @_PrincipalListConverter()
  List<SalesOrganisationConfigsPrincipalDto> get principalList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'disableOrderType', defaultValue: false)
  bool get disableOrderType => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableBatchNumber', defaultValue: false)
  bool get enableBatchNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'disableBundles', defaultValue: false)
  bool get disableBundles => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableZDP5', defaultValue: false)
  bool get enableZDP5 => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableTaxClassification', defaultValue: false)
  bool get enableTaxClassification => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableVat', defaultValue: false)
  bool get enableVat => throw _privateConstructorUsedError;
  @JsonKey(name: 'vatValue', defaultValue: 0)
  int get vatValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialWithoutPrice', defaultValue: false)
  bool get materialWithoutPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableSpecialInstructions', defaultValue: false)
  bool get enableSpecialInstructions => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableReferenceNote', defaultValue: false)
  bool get enableReferenceNote => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableCollectiveNumber', defaultValue: false)
  bool get enableCollectiveNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableMobileNumber', defaultValue: false)
  bool get enableMobileNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableFutureDeliveryDay', defaultValue: false)
  bool get enableFutureDeliveryDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'enablePOAttachmentRequired', defaultValue: false)
  bool get enablePOAttachmentRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'enablePaymentTerms', defaultValue: false)
  bool get enablePaymentTerms => throw _privateConstructorUsedError;
  @JsonKey(name: 'futureDeliveryDay', defaultValue: '')
  String get futureDeliveryDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableGMC', defaultValue: false)
  bool get enableGMC => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableListPrice', defaultValue: false)
  bool get enableListPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableDefaultMD', defaultValue: false)
  bool get enableDefaultMD => throw _privateConstructorUsedError;
  @JsonKey(name: 'priceOverride', defaultValue: false)
  bool get priceOverride => throw _privateConstructorUsedError;
  @JsonKey(name: 'disablePaymentTermsDisplay', defaultValue: false)
  bool get disablePaymentTermsDisplay => throw _privateConstructorUsedError;
  @JsonKey(name: 'disableDeliveryDate', defaultValue: false)
  bool get disableDeliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableBillTo', defaultValue: false)
  bool get enableBillTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'showPOAttachment', defaultValue: false)
  bool get showPOAttachment => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiryDateDisplay', defaultValue: false)
  bool get expiryDateDisplay => throw _privateConstructorUsedError;
  @JsonKey(name: 'hideStockDisplay', defaultValue: false)
  bool get hideStockDisplay => throw _privateConstructorUsedError;
  @JsonKey(name: 'addOosMaterials', defaultValue: false)
  bool get addOosMaterials => throw _privateConstructorUsedError;
  @JsonKey(name: 'oosValue', defaultValue: 0)
  int get oosValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableRemarks', defaultValue: false)
  bool get enableRemarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableOHPrice', defaultValue: true)
  bool get enableOHPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'ponRequired', defaultValue: false)
  bool get poNumberRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableIRN', defaultValue: false)
  bool get enableIRN => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableTaxDisplay', defaultValue: false)
  bool get enableTaxDisplay => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableTenderOrders', defaultValue: false)
  bool get enableTenderOrders => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableTaxAtTotalLevelOnly', defaultValue: false)
  bool get enableTaxAtTotalLevelOnly => throw _privateConstructorUsedError;
  @JsonKey(name: 'netPriceOverride', defaultValue: false)
  bool get netPriceOverride => throw _privateConstructorUsedError;
  @JsonKey(name: 'batchNumDisplay', defaultValue: false)
  bool get batchNumDisplay => throw _privateConstructorUsedError;
  @JsonKey(name: 'displayOrderDiscount', defaultValue: false)
  bool get displayOrderDiscount => throw _privateConstructorUsedError;
  @StringToDoubleConverter()
  @JsonKey(name: 'minOrderAmount', defaultValue: 0.0)
  double get minOrderAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'salesOrgCode', defaultValue: '0')
  String get salesOrg => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableZDP8Override', defaultValue: false)
  bool get enableZDP8Override => throw _privateConstructorUsedError;
  @JsonKey(name: 'disableReturnsAccessSR', defaultValue: false)
  bool get disableReturnsAccessSR => throw _privateConstructorUsedError;
  @JsonKey(name: 'disableReturnsAccess', defaultValue: false)
  bool get disableReturnsAccess => throw _privateConstructorUsedError;
  @JsonKey(name: 'disableOverrideFieldCustomer', defaultValue: false)
  bool get disableOverrideFieldCustomer => throw _privateConstructorUsedError;
  @JsonKey(name: 'disableOverrideFieldSR', defaultValue: false)
  bool get disableOverrideFieldSR => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableGreenDelivery', defaultValue: false)
  bool get enableGreenDelivery => throw _privateConstructorUsedError;
  @JsonKey(name: 'greenDeliveryDelayInDays', defaultValue: 2)
  int get greenDeliveryDelayInDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableComboDeals', defaultValue: false)
  bool get enableComboDeals => throw _privateConstructorUsedError;
  @JsonKey(name: 'greenDeliveryUserRole', defaultValue: 0)
  int get greenDeliveryUserRole => throw _privateConstructorUsedError;
  @JsonKey(name: 'comboDealsUserRole', defaultValue: 0)
  int get comboDealsUserRole => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableGMN', defaultValue: false)
  bool get enableGMN => throw _privateConstructorUsedError;
  @JsonKey(name: 'displayItemTaxBreakdown', defaultValue: false)
  bool get displayItemTaxBreakdown => throw _privateConstructorUsedError;
  @JsonKey(name: 'displaySubtotalTaxBreakdown', defaultValue: false)
  bool get displaySubtotalTaxBreakdown => throw _privateConstructorUsedError;
  @JsonKey(name: 'disablePayment', defaultValue: false)
  bool get disablePayment => throw _privateConstructorUsedError;
  @JsonKey(name: 'hideCredit', defaultValue: false)
  bool get hideCredit => throw _privateConstructorUsedError;
  @JsonKey(name: 'allowReturnsOutsidePolicy', defaultValue: false)
  bool get allowReturnsOutsidePolicy => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableMarketPlace', defaultValue: false)
  bool get enableMarketPlace => throw _privateConstructorUsedError;
  @StringToDoubleConverter()
  @JsonKey(name: 'mpMinOrderAmount', defaultValue: 0.0)
  double get mpMinOrderAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'statementOfAccountEnabled', defaultValue: false)
  bool get statementOfAccountEnabled => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableSmallOrderFee', defaultValue: false)
  bool get enableSmallOrderFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'smallOrderFeeUserRoles', defaultValue: <String>[])
  List<String> get smallOrderFeeUserRoles => throw _privateConstructorUsedError;
  @JsonKey(name: 'smallOrderFee', defaultValue: 0.0)
  double get smallOrderFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'movThreshold', defaultValue: 0.0)
  double get movThreshold => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableMPSmallOrderFee', defaultValue: false)
  bool get enableMPSmallOrderFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'mpSmallOrderFeeUserRoles', defaultValue: <String>[])
  List<String> get mpSmallOrderFeeUserRoles =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'mpSmallOrderFee', defaultValue: 0.0)
  double get mpSmallOrderFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'mpMovThreshold', defaultValue: 0.0)
  double get mpMovThreshold => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderTypes', defaultValue: [])
  List<SalesOrganisationConfigsOrderTypeDto> get orderTypes =>
      throw _privateConstructorUsedError;
  @JsonKey(
      name: 'authorizedExtSalesRep',
      defaultValue: <ExternalSalesRepresentativeInfoDto>[])
  List<ExternalSalesRepresentativeInfoDto> get authorizedExtSalesRep =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'disclaimer', defaultValue: '')
  String get disclaimer => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableDeliveryOptions', defaultValue: false)
  bool get enableDeliveryOptions => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableRequestDeliveryDate', defaultValue: false)
  bool get enableRequestDeliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableSaturdayUrgentDelivery', defaultValue: false)
  bool get enableSaturdayUrgentDelivery => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableStandardDelivery', defaultValue: false)
  bool get enableStandardDelivery => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableTodayUrgentDelivery', defaultValue: false)
  bool get enableTodayUrgentDelivery => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableTomorrowUrgentDelivery', defaultValue: false)
  bool get enableTomorrowUrgentDelivery => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableUrgentDelivery', defaultValue: false)
  bool get enableUrgentDelivery => throw _privateConstructorUsedError;
  @JsonKey(name: 'saturdayDeliveryFee', defaultValue: 0.0)
  double get saturdayDeliveryFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'selectableDeliveryDays', defaultValue: 0)
  int get selectableDeliveryDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'standardDeliveryDays', defaultValue: 0)
  int get standardDeliveryDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'todayDeliveryFee', defaultValue: 0.0)
  double get todayDeliveryFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'tomorrowDeliveryFee', defaultValue: 0.0)
  double get tomorrowDeliveryFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'poReferenceLength', defaultValue: 0)
  int get poReferenceLength => throw _privateConstructorUsedError;
  @JsonKey(name: 'referenceNoteLength', defaultValue: 0)
  int get referenceNoteLength => throw _privateConstructorUsedError;
  @JsonKey(name: 'showEZCSTickets', defaultValue: false)
  bool get showEZCSTickets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalesOrganisationConfigsDtoCopyWith<SalesOrganisationConfigsDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrganisationConfigsDtoCopyWith<$Res> {
  factory $SalesOrganisationConfigsDtoCopyWith(
          SalesOrganisationConfigsDto value,
          $Res Function(SalesOrganisationConfigsDto) then) =
      _$SalesOrganisationConfigsDtoCopyWithImpl<$Res,
          SalesOrganisationConfigsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'disableProcessingStatus') bool disableProcessingStatus,
      @JsonKey(name: 'currency') String currency,
      @JsonKey(name: 'hideCustomer', defaultValue: false) bool hideCustomer,
      @JsonKey(name: 'enableGimmickMaterial', defaultValue: false)
      bool enableGimmickMaterial,
      @JsonKey(name: 'disablePrincipals', defaultValue: false)
      bool disablePrincipals,
      @JsonKey(name: 'principalList')
      @_PrincipalListConverter()
      List<SalesOrganisationConfigsPrincipalDto> principalList,
      @JsonKey(name: 'disableOrderType', defaultValue: false)
      bool disableOrderType,
      @JsonKey(name: 'enableBatchNumber', defaultValue: false)
      bool enableBatchNumber,
      @JsonKey(name: 'disableBundles', defaultValue: false) bool disableBundles,
      @JsonKey(name: 'enableZDP5', defaultValue: false) bool enableZDP5,
      @JsonKey(name: 'enableTaxClassification', defaultValue: false)
      bool enableTaxClassification,
      @JsonKey(name: 'enableVat', defaultValue: false) bool enableVat,
      @JsonKey(name: 'vatValue', defaultValue: 0) int vatValue,
      @JsonKey(name: 'materialWithoutPrice', defaultValue: false)
      bool materialWithoutPrice,
      @JsonKey(name: 'enableSpecialInstructions', defaultValue: false)
      bool enableSpecialInstructions,
      @JsonKey(name: 'enableReferenceNote', defaultValue: false)
      bool enableReferenceNote,
      @JsonKey(name: 'enableCollectiveNumber', defaultValue: false)
      bool enableCollectiveNumber,
      @JsonKey(name: 'enableMobileNumber', defaultValue: false)
      bool enableMobileNumber,
      @JsonKey(name: 'enableFutureDeliveryDay', defaultValue: false)
      bool enableFutureDeliveryDay,
      @JsonKey(name: 'enablePOAttachmentRequired', defaultValue: false)
      bool enablePOAttachmentRequired,
      @JsonKey(name: 'enablePaymentTerms', defaultValue: false)
      bool enablePaymentTerms,
      @JsonKey(name: 'futureDeliveryDay', defaultValue: '')
      String futureDeliveryDay,
      @JsonKey(name: 'enableGMC', defaultValue: false) bool enableGMC,
      @JsonKey(name: 'enableListPrice', defaultValue: false)
      bool enableListPrice,
      @JsonKey(name: 'enableDefaultMD', defaultValue: false)
      bool enableDefaultMD,
      @JsonKey(name: 'priceOverride', defaultValue: false) bool priceOverride,
      @JsonKey(name: 'disablePaymentTermsDisplay', defaultValue: false)
      bool disablePaymentTermsDisplay,
      @JsonKey(name: 'disableDeliveryDate', defaultValue: false)
      bool disableDeliveryDate,
      @JsonKey(name: 'enableBillTo', defaultValue: false) bool enableBillTo,
      @JsonKey(name: 'showPOAttachment', defaultValue: false)
      bool showPOAttachment,
      @JsonKey(name: 'expiryDateDisplay', defaultValue: false)
      bool expiryDateDisplay,
      @JsonKey(name: 'hideStockDisplay', defaultValue: false)
      bool hideStockDisplay,
      @JsonKey(name: 'addOosMaterials', defaultValue: false)
      bool addOosMaterials,
      @JsonKey(name: 'oosValue', defaultValue: 0) int oosValue,
      @JsonKey(name: 'enableRemarks', defaultValue: false) bool enableRemarks,
      @JsonKey(name: 'enableOHPrice', defaultValue: true) bool enableOHPrice,
      @JsonKey(name: 'ponRequired', defaultValue: false) bool poNumberRequired,
      @JsonKey(name: 'enableIRN', defaultValue: false) bool enableIRN,
      @JsonKey(name: 'enableTaxDisplay', defaultValue: false)
      bool enableTaxDisplay,
      @JsonKey(name: 'enableTenderOrders', defaultValue: false)
      bool enableTenderOrders,
      @JsonKey(name: 'enableTaxAtTotalLevelOnly', defaultValue: false)
      bool enableTaxAtTotalLevelOnly,
      @JsonKey(name: 'netPriceOverride', defaultValue: false)
      bool netPriceOverride,
      @JsonKey(name: 'batchNumDisplay', defaultValue: false)
      bool batchNumDisplay,
      @JsonKey(name: 'displayOrderDiscount', defaultValue: false)
      bool displayOrderDiscount,
      @StringToDoubleConverter()
      @JsonKey(name: 'minOrderAmount', defaultValue: 0.0)
      double minOrderAmount,
      @JsonKey(name: 'salesOrgCode', defaultValue: '0') String salesOrg,
      @JsonKey(name: 'enableZDP8Override', defaultValue: false)
      bool enableZDP8Override,
      @JsonKey(name: 'disableReturnsAccessSR', defaultValue: false)
      bool disableReturnsAccessSR,
      @JsonKey(name: 'disableReturnsAccess', defaultValue: false)
      bool disableReturnsAccess,
      @JsonKey(name: 'disableOverrideFieldCustomer', defaultValue: false)
      bool disableOverrideFieldCustomer,
      @JsonKey(name: 'disableOverrideFieldSR', defaultValue: false)
      bool disableOverrideFieldSR,
      @JsonKey(name: 'enableGreenDelivery', defaultValue: false)
      bool enableGreenDelivery,
      @JsonKey(name: 'greenDeliveryDelayInDays', defaultValue: 2)
      int greenDeliveryDelayInDays,
      @JsonKey(name: 'enableComboDeals', defaultValue: false)
      bool enableComboDeals,
      @JsonKey(name: 'greenDeliveryUserRole', defaultValue: 0)
      int greenDeliveryUserRole,
      @JsonKey(name: 'comboDealsUserRole', defaultValue: 0)
      int comboDealsUserRole,
      @JsonKey(name: 'enableGMN', defaultValue: false) bool enableGMN,
      @JsonKey(name: 'displayItemTaxBreakdown', defaultValue: false)
      bool displayItemTaxBreakdown,
      @JsonKey(name: 'displaySubtotalTaxBreakdown', defaultValue: false)
      bool displaySubtotalTaxBreakdown,
      @JsonKey(name: 'disablePayment', defaultValue: false) bool disablePayment,
      @JsonKey(name: 'hideCredit', defaultValue: false) bool hideCredit,
      @JsonKey(name: 'allowReturnsOutsidePolicy', defaultValue: false)
      bool allowReturnsOutsidePolicy,
      @JsonKey(name: 'enableMarketPlace', defaultValue: false)
      bool enableMarketPlace,
      @StringToDoubleConverter()
      @JsonKey(name: 'mpMinOrderAmount', defaultValue: 0.0)
      double mpMinOrderAmount,
      @JsonKey(name: 'statementOfAccountEnabled', defaultValue: false)
      bool statementOfAccountEnabled,
      @JsonKey(name: 'enableSmallOrderFee', defaultValue: false)
      bool enableSmallOrderFee,
      @JsonKey(name: 'smallOrderFeeUserRoles', defaultValue: <String>[])
      List<String> smallOrderFeeUserRoles,
      @JsonKey(name: 'smallOrderFee', defaultValue: 0.0) double smallOrderFee,
      @JsonKey(name: 'movThreshold', defaultValue: 0.0) double movThreshold,
      @JsonKey(name: 'enableMPSmallOrderFee', defaultValue: false)
      bool enableMPSmallOrderFee,
      @JsonKey(name: 'mpSmallOrderFeeUserRoles', defaultValue: <String>[])
      List<String> mpSmallOrderFeeUserRoles,
      @JsonKey(name: 'mpSmallOrderFee', defaultValue: 0.0)
      double mpSmallOrderFee,
      @JsonKey(name: 'mpMovThreshold', defaultValue: 0.0) double mpMovThreshold,
      @JsonKey(name: 'orderTypes', defaultValue: [])
      List<SalesOrganisationConfigsOrderTypeDto> orderTypes,
      @JsonKey(
          name: 'authorizedExtSalesRep',
          defaultValue: <ExternalSalesRepresentativeInfoDto>[])
      List<ExternalSalesRepresentativeInfoDto> authorizedExtSalesRep,
      @JsonKey(name: 'disclaimer', defaultValue: '') String disclaimer,
      @JsonKey(name: 'enableDeliveryOptions', defaultValue: false)
      bool enableDeliveryOptions,
      @JsonKey(name: 'enableRequestDeliveryDate', defaultValue: false)
      bool enableRequestDeliveryDate,
      @JsonKey(name: 'enableSaturdayUrgentDelivery', defaultValue: false)
      bool enableSaturdayUrgentDelivery,
      @JsonKey(name: 'enableStandardDelivery', defaultValue: false)
      bool enableStandardDelivery,
      @JsonKey(name: 'enableTodayUrgentDelivery', defaultValue: false)
      bool enableTodayUrgentDelivery,
      @JsonKey(name: 'enableTomorrowUrgentDelivery', defaultValue: false)
      bool enableTomorrowUrgentDelivery,
      @JsonKey(name: 'enableUrgentDelivery', defaultValue: false)
      bool enableUrgentDelivery,
      @JsonKey(name: 'saturdayDeliveryFee', defaultValue: 0.0)
      double saturdayDeliveryFee,
      @JsonKey(name: 'selectableDeliveryDays', defaultValue: 0)
      int selectableDeliveryDays,
      @JsonKey(name: 'standardDeliveryDays', defaultValue: 0)
      int standardDeliveryDays,
      @JsonKey(name: 'todayDeliveryFee', defaultValue: 0.0)
      double todayDeliveryFee,
      @JsonKey(name: 'tomorrowDeliveryFee', defaultValue: 0.0)
      double tomorrowDeliveryFee,
      @JsonKey(name: 'poReferenceLength', defaultValue: 0)
      int poReferenceLength,
      @JsonKey(name: 'referenceNoteLength', defaultValue: 0)
      int referenceNoteLength,
      @JsonKey(name: 'showEZCSTickets', defaultValue: false)
      bool showEZCSTickets});
}

/// @nodoc
class _$SalesOrganisationConfigsDtoCopyWithImpl<$Res,
        $Val extends SalesOrganisationConfigsDto>
    implements $SalesOrganisationConfigsDtoCopyWith<$Res> {
  _$SalesOrganisationConfigsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? disableProcessingStatus = null,
    Object? currency = null,
    Object? hideCustomer = null,
    Object? enableGimmickMaterial = null,
    Object? disablePrincipals = null,
    Object? principalList = null,
    Object? disableOrderType = null,
    Object? enableBatchNumber = null,
    Object? disableBundles = null,
    Object? enableZDP5 = null,
    Object? enableTaxClassification = null,
    Object? enableVat = null,
    Object? vatValue = null,
    Object? materialWithoutPrice = null,
    Object? enableSpecialInstructions = null,
    Object? enableReferenceNote = null,
    Object? enableCollectiveNumber = null,
    Object? enableMobileNumber = null,
    Object? enableFutureDeliveryDay = null,
    Object? enablePOAttachmentRequired = null,
    Object? enablePaymentTerms = null,
    Object? futureDeliveryDay = null,
    Object? enableGMC = null,
    Object? enableListPrice = null,
    Object? enableDefaultMD = null,
    Object? priceOverride = null,
    Object? disablePaymentTermsDisplay = null,
    Object? disableDeliveryDate = null,
    Object? enableBillTo = null,
    Object? showPOAttachment = null,
    Object? expiryDateDisplay = null,
    Object? hideStockDisplay = null,
    Object? addOosMaterials = null,
    Object? oosValue = null,
    Object? enableRemarks = null,
    Object? enableOHPrice = null,
    Object? poNumberRequired = null,
    Object? enableIRN = null,
    Object? enableTaxDisplay = null,
    Object? enableTenderOrders = null,
    Object? enableTaxAtTotalLevelOnly = null,
    Object? netPriceOverride = null,
    Object? batchNumDisplay = null,
    Object? displayOrderDiscount = null,
    Object? minOrderAmount = null,
    Object? salesOrg = null,
    Object? enableZDP8Override = null,
    Object? disableReturnsAccessSR = null,
    Object? disableReturnsAccess = null,
    Object? disableOverrideFieldCustomer = null,
    Object? disableOverrideFieldSR = null,
    Object? enableGreenDelivery = null,
    Object? greenDeliveryDelayInDays = null,
    Object? enableComboDeals = null,
    Object? greenDeliveryUserRole = null,
    Object? comboDealsUserRole = null,
    Object? enableGMN = null,
    Object? displayItemTaxBreakdown = null,
    Object? displaySubtotalTaxBreakdown = null,
    Object? disablePayment = null,
    Object? hideCredit = null,
    Object? allowReturnsOutsidePolicy = null,
    Object? enableMarketPlace = null,
    Object? mpMinOrderAmount = null,
    Object? statementOfAccountEnabled = null,
    Object? enableSmallOrderFee = null,
    Object? smallOrderFeeUserRoles = null,
    Object? smallOrderFee = null,
    Object? movThreshold = null,
    Object? enableMPSmallOrderFee = null,
    Object? mpSmallOrderFeeUserRoles = null,
    Object? mpSmallOrderFee = null,
    Object? mpMovThreshold = null,
    Object? orderTypes = null,
    Object? authorizedExtSalesRep = null,
    Object? disclaimer = null,
    Object? enableDeliveryOptions = null,
    Object? enableRequestDeliveryDate = null,
    Object? enableSaturdayUrgentDelivery = null,
    Object? enableStandardDelivery = null,
    Object? enableTodayUrgentDelivery = null,
    Object? enableTomorrowUrgentDelivery = null,
    Object? enableUrgentDelivery = null,
    Object? saturdayDeliveryFee = null,
    Object? selectableDeliveryDays = null,
    Object? standardDeliveryDays = null,
    Object? todayDeliveryFee = null,
    Object? tomorrowDeliveryFee = null,
    Object? poReferenceLength = null,
    Object? referenceNoteLength = null,
    Object? showEZCSTickets = null,
  }) {
    return _then(_value.copyWith(
      disableProcessingStatus: null == disableProcessingStatus
          ? _value.disableProcessingStatus
          : disableProcessingStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      hideCustomer: null == hideCustomer
          ? _value.hideCustomer
          : hideCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      enableGimmickMaterial: null == enableGimmickMaterial
          ? _value.enableGimmickMaterial
          : enableGimmickMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      disablePrincipals: null == disablePrincipals
          ? _value.disablePrincipals
          : disablePrincipals // ignore: cast_nullable_to_non_nullable
              as bool,
      principalList: null == principalList
          ? _value.principalList
          : principalList // ignore: cast_nullable_to_non_nullable
              as List<SalesOrganisationConfigsPrincipalDto>,
      disableOrderType: null == disableOrderType
          ? _value.disableOrderType
          : disableOrderType // ignore: cast_nullable_to_non_nullable
              as bool,
      enableBatchNumber: null == enableBatchNumber
          ? _value.enableBatchNumber
          : enableBatchNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      disableBundles: null == disableBundles
          ? _value.disableBundles
          : disableBundles // ignore: cast_nullable_to_non_nullable
              as bool,
      enableZDP5: null == enableZDP5
          ? _value.enableZDP5
          : enableZDP5 // ignore: cast_nullable_to_non_nullable
              as bool,
      enableTaxClassification: null == enableTaxClassification
          ? _value.enableTaxClassification
          : enableTaxClassification // ignore: cast_nullable_to_non_nullable
              as bool,
      enableVat: null == enableVat
          ? _value.enableVat
          : enableVat // ignore: cast_nullable_to_non_nullable
              as bool,
      vatValue: null == vatValue
          ? _value.vatValue
          : vatValue // ignore: cast_nullable_to_non_nullable
              as int,
      materialWithoutPrice: null == materialWithoutPrice
          ? _value.materialWithoutPrice
          : materialWithoutPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      enableSpecialInstructions: null == enableSpecialInstructions
          ? _value.enableSpecialInstructions
          : enableSpecialInstructions // ignore: cast_nullable_to_non_nullable
              as bool,
      enableReferenceNote: null == enableReferenceNote
          ? _value.enableReferenceNote
          : enableReferenceNote // ignore: cast_nullable_to_non_nullable
              as bool,
      enableCollectiveNumber: null == enableCollectiveNumber
          ? _value.enableCollectiveNumber
          : enableCollectiveNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      enableMobileNumber: null == enableMobileNumber
          ? _value.enableMobileNumber
          : enableMobileNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      enableFutureDeliveryDay: null == enableFutureDeliveryDay
          ? _value.enableFutureDeliveryDay
          : enableFutureDeliveryDay // ignore: cast_nullable_to_non_nullable
              as bool,
      enablePOAttachmentRequired: null == enablePOAttachmentRequired
          ? _value.enablePOAttachmentRequired
          : enablePOAttachmentRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      enablePaymentTerms: null == enablePaymentTerms
          ? _value.enablePaymentTerms
          : enablePaymentTerms // ignore: cast_nullable_to_non_nullable
              as bool,
      futureDeliveryDay: null == futureDeliveryDay
          ? _value.futureDeliveryDay
          : futureDeliveryDay // ignore: cast_nullable_to_non_nullable
              as String,
      enableGMC: null == enableGMC
          ? _value.enableGMC
          : enableGMC // ignore: cast_nullable_to_non_nullable
              as bool,
      enableListPrice: null == enableListPrice
          ? _value.enableListPrice
          : enableListPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      enableDefaultMD: null == enableDefaultMD
          ? _value.enableDefaultMD
          : enableDefaultMD // ignore: cast_nullable_to_non_nullable
              as bool,
      priceOverride: null == priceOverride
          ? _value.priceOverride
          : priceOverride // ignore: cast_nullable_to_non_nullable
              as bool,
      disablePaymentTermsDisplay: null == disablePaymentTermsDisplay
          ? _value.disablePaymentTermsDisplay
          : disablePaymentTermsDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
      disableDeliveryDate: null == disableDeliveryDate
          ? _value.disableDeliveryDate
          : disableDeliveryDate // ignore: cast_nullable_to_non_nullable
              as bool,
      enableBillTo: null == enableBillTo
          ? _value.enableBillTo
          : enableBillTo // ignore: cast_nullable_to_non_nullable
              as bool,
      showPOAttachment: null == showPOAttachment
          ? _value.showPOAttachment
          : showPOAttachment // ignore: cast_nullable_to_non_nullable
              as bool,
      expiryDateDisplay: null == expiryDateDisplay
          ? _value.expiryDateDisplay
          : expiryDateDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
      hideStockDisplay: null == hideStockDisplay
          ? _value.hideStockDisplay
          : hideStockDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
      addOosMaterials: null == addOosMaterials
          ? _value.addOosMaterials
          : addOosMaterials // ignore: cast_nullable_to_non_nullable
              as bool,
      oosValue: null == oosValue
          ? _value.oosValue
          : oosValue // ignore: cast_nullable_to_non_nullable
              as int,
      enableRemarks: null == enableRemarks
          ? _value.enableRemarks
          : enableRemarks // ignore: cast_nullable_to_non_nullable
              as bool,
      enableOHPrice: null == enableOHPrice
          ? _value.enableOHPrice
          : enableOHPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      poNumberRequired: null == poNumberRequired
          ? _value.poNumberRequired
          : poNumberRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      enableIRN: null == enableIRN
          ? _value.enableIRN
          : enableIRN // ignore: cast_nullable_to_non_nullable
              as bool,
      enableTaxDisplay: null == enableTaxDisplay
          ? _value.enableTaxDisplay
          : enableTaxDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
      enableTenderOrders: null == enableTenderOrders
          ? _value.enableTenderOrders
          : enableTenderOrders // ignore: cast_nullable_to_non_nullable
              as bool,
      enableTaxAtTotalLevelOnly: null == enableTaxAtTotalLevelOnly
          ? _value.enableTaxAtTotalLevelOnly
          : enableTaxAtTotalLevelOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      netPriceOverride: null == netPriceOverride
          ? _value.netPriceOverride
          : netPriceOverride // ignore: cast_nullable_to_non_nullable
              as bool,
      batchNumDisplay: null == batchNumDisplay
          ? _value.batchNumDisplay
          : batchNumDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
      displayOrderDiscount: null == displayOrderDiscount
          ? _value.displayOrderDiscount
          : displayOrderDiscount // ignore: cast_nullable_to_non_nullable
              as bool,
      minOrderAmount: null == minOrderAmount
          ? _value.minOrderAmount
          : minOrderAmount // ignore: cast_nullable_to_non_nullable
              as double,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      enableZDP8Override: null == enableZDP8Override
          ? _value.enableZDP8Override
          : enableZDP8Override // ignore: cast_nullable_to_non_nullable
              as bool,
      disableReturnsAccessSR: null == disableReturnsAccessSR
          ? _value.disableReturnsAccessSR
          : disableReturnsAccessSR // ignore: cast_nullable_to_non_nullable
              as bool,
      disableReturnsAccess: null == disableReturnsAccess
          ? _value.disableReturnsAccess
          : disableReturnsAccess // ignore: cast_nullable_to_non_nullable
              as bool,
      disableOverrideFieldCustomer: null == disableOverrideFieldCustomer
          ? _value.disableOverrideFieldCustomer
          : disableOverrideFieldCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      disableOverrideFieldSR: null == disableOverrideFieldSR
          ? _value.disableOverrideFieldSR
          : disableOverrideFieldSR // ignore: cast_nullable_to_non_nullable
              as bool,
      enableGreenDelivery: null == enableGreenDelivery
          ? _value.enableGreenDelivery
          : enableGreenDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      greenDeliveryDelayInDays: null == greenDeliveryDelayInDays
          ? _value.greenDeliveryDelayInDays
          : greenDeliveryDelayInDays // ignore: cast_nullable_to_non_nullable
              as int,
      enableComboDeals: null == enableComboDeals
          ? _value.enableComboDeals
          : enableComboDeals // ignore: cast_nullable_to_non_nullable
              as bool,
      greenDeliveryUserRole: null == greenDeliveryUserRole
          ? _value.greenDeliveryUserRole
          : greenDeliveryUserRole // ignore: cast_nullable_to_non_nullable
              as int,
      comboDealsUserRole: null == comboDealsUserRole
          ? _value.comboDealsUserRole
          : comboDealsUserRole // ignore: cast_nullable_to_non_nullable
              as int,
      enableGMN: null == enableGMN
          ? _value.enableGMN
          : enableGMN // ignore: cast_nullable_to_non_nullable
              as bool,
      displayItemTaxBreakdown: null == displayItemTaxBreakdown
          ? _value.displayItemTaxBreakdown
          : displayItemTaxBreakdown // ignore: cast_nullable_to_non_nullable
              as bool,
      displaySubtotalTaxBreakdown: null == displaySubtotalTaxBreakdown
          ? _value.displaySubtotalTaxBreakdown
          : displaySubtotalTaxBreakdown // ignore: cast_nullable_to_non_nullable
              as bool,
      disablePayment: null == disablePayment
          ? _value.disablePayment
          : disablePayment // ignore: cast_nullable_to_non_nullable
              as bool,
      hideCredit: null == hideCredit
          ? _value.hideCredit
          : hideCredit // ignore: cast_nullable_to_non_nullable
              as bool,
      allowReturnsOutsidePolicy: null == allowReturnsOutsidePolicy
          ? _value.allowReturnsOutsidePolicy
          : allowReturnsOutsidePolicy // ignore: cast_nullable_to_non_nullable
              as bool,
      enableMarketPlace: null == enableMarketPlace
          ? _value.enableMarketPlace
          : enableMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
      mpMinOrderAmount: null == mpMinOrderAmount
          ? _value.mpMinOrderAmount
          : mpMinOrderAmount // ignore: cast_nullable_to_non_nullable
              as double,
      statementOfAccountEnabled: null == statementOfAccountEnabled
          ? _value.statementOfAccountEnabled
          : statementOfAccountEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      enableSmallOrderFee: null == enableSmallOrderFee
          ? _value.enableSmallOrderFee
          : enableSmallOrderFee // ignore: cast_nullable_to_non_nullable
              as bool,
      smallOrderFeeUserRoles: null == smallOrderFeeUserRoles
          ? _value.smallOrderFeeUserRoles
          : smallOrderFeeUserRoles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      smallOrderFee: null == smallOrderFee
          ? _value.smallOrderFee
          : smallOrderFee // ignore: cast_nullable_to_non_nullable
              as double,
      movThreshold: null == movThreshold
          ? _value.movThreshold
          : movThreshold // ignore: cast_nullable_to_non_nullable
              as double,
      enableMPSmallOrderFee: null == enableMPSmallOrderFee
          ? _value.enableMPSmallOrderFee
          : enableMPSmallOrderFee // ignore: cast_nullable_to_non_nullable
              as bool,
      mpSmallOrderFeeUserRoles: null == mpSmallOrderFeeUserRoles
          ? _value.mpSmallOrderFeeUserRoles
          : mpSmallOrderFeeUserRoles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mpSmallOrderFee: null == mpSmallOrderFee
          ? _value.mpSmallOrderFee
          : mpSmallOrderFee // ignore: cast_nullable_to_non_nullable
              as double,
      mpMovThreshold: null == mpMovThreshold
          ? _value.mpMovThreshold
          : mpMovThreshold // ignore: cast_nullable_to_non_nullable
              as double,
      orderTypes: null == orderTypes
          ? _value.orderTypes
          : orderTypes // ignore: cast_nullable_to_non_nullable
              as List<SalesOrganisationConfigsOrderTypeDto>,
      authorizedExtSalesRep: null == authorizedExtSalesRep
          ? _value.authorizedExtSalesRep
          : authorizedExtSalesRep // ignore: cast_nullable_to_non_nullable
              as List<ExternalSalesRepresentativeInfoDto>,
      disclaimer: null == disclaimer
          ? _value.disclaimer
          : disclaimer // ignore: cast_nullable_to_non_nullable
              as String,
      enableDeliveryOptions: null == enableDeliveryOptions
          ? _value.enableDeliveryOptions
          : enableDeliveryOptions // ignore: cast_nullable_to_non_nullable
              as bool,
      enableRequestDeliveryDate: null == enableRequestDeliveryDate
          ? _value.enableRequestDeliveryDate
          : enableRequestDeliveryDate // ignore: cast_nullable_to_non_nullable
              as bool,
      enableSaturdayUrgentDelivery: null == enableSaturdayUrgentDelivery
          ? _value.enableSaturdayUrgentDelivery
          : enableSaturdayUrgentDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      enableStandardDelivery: null == enableStandardDelivery
          ? _value.enableStandardDelivery
          : enableStandardDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      enableTodayUrgentDelivery: null == enableTodayUrgentDelivery
          ? _value.enableTodayUrgentDelivery
          : enableTodayUrgentDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      enableTomorrowUrgentDelivery: null == enableTomorrowUrgentDelivery
          ? _value.enableTomorrowUrgentDelivery
          : enableTomorrowUrgentDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      enableUrgentDelivery: null == enableUrgentDelivery
          ? _value.enableUrgentDelivery
          : enableUrgentDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      saturdayDeliveryFee: null == saturdayDeliveryFee
          ? _value.saturdayDeliveryFee
          : saturdayDeliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      selectableDeliveryDays: null == selectableDeliveryDays
          ? _value.selectableDeliveryDays
          : selectableDeliveryDays // ignore: cast_nullable_to_non_nullable
              as int,
      standardDeliveryDays: null == standardDeliveryDays
          ? _value.standardDeliveryDays
          : standardDeliveryDays // ignore: cast_nullable_to_non_nullable
              as int,
      todayDeliveryFee: null == todayDeliveryFee
          ? _value.todayDeliveryFee
          : todayDeliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      tomorrowDeliveryFee: null == tomorrowDeliveryFee
          ? _value.tomorrowDeliveryFee
          : tomorrowDeliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      poReferenceLength: null == poReferenceLength
          ? _value.poReferenceLength
          : poReferenceLength // ignore: cast_nullable_to_non_nullable
              as int,
      referenceNoteLength: null == referenceNoteLength
          ? _value.referenceNoteLength
          : referenceNoteLength // ignore: cast_nullable_to_non_nullable
              as int,
      showEZCSTickets: null == showEZCSTickets
          ? _value.showEZCSTickets
          : showEZCSTickets // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesOrganisationConfigsDtoImplCopyWith<$Res>
    implements $SalesOrganisationConfigsDtoCopyWith<$Res> {
  factory _$$SalesOrganisationConfigsDtoImplCopyWith(
          _$SalesOrganisationConfigsDtoImpl value,
          $Res Function(_$SalesOrganisationConfigsDtoImpl) then) =
      __$$SalesOrganisationConfigsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'disableProcessingStatus') bool disableProcessingStatus,
      @JsonKey(name: 'currency') String currency,
      @JsonKey(name: 'hideCustomer', defaultValue: false) bool hideCustomer,
      @JsonKey(name: 'enableGimmickMaterial', defaultValue: false)
      bool enableGimmickMaterial,
      @JsonKey(name: 'disablePrincipals', defaultValue: false)
      bool disablePrincipals,
      @JsonKey(name: 'principalList')
      @_PrincipalListConverter()
      List<SalesOrganisationConfigsPrincipalDto> principalList,
      @JsonKey(name: 'disableOrderType', defaultValue: false)
      bool disableOrderType,
      @JsonKey(name: 'enableBatchNumber', defaultValue: false)
      bool enableBatchNumber,
      @JsonKey(name: 'disableBundles', defaultValue: false) bool disableBundles,
      @JsonKey(name: 'enableZDP5', defaultValue: false) bool enableZDP5,
      @JsonKey(name: 'enableTaxClassification', defaultValue: false)
      bool enableTaxClassification,
      @JsonKey(name: 'enableVat', defaultValue: false) bool enableVat,
      @JsonKey(name: 'vatValue', defaultValue: 0) int vatValue,
      @JsonKey(name: 'materialWithoutPrice', defaultValue: false)
      bool materialWithoutPrice,
      @JsonKey(name: 'enableSpecialInstructions', defaultValue: false)
      bool enableSpecialInstructions,
      @JsonKey(name: 'enableReferenceNote', defaultValue: false)
      bool enableReferenceNote,
      @JsonKey(name: 'enableCollectiveNumber', defaultValue: false)
      bool enableCollectiveNumber,
      @JsonKey(name: 'enableMobileNumber', defaultValue: false)
      bool enableMobileNumber,
      @JsonKey(name: 'enableFutureDeliveryDay', defaultValue: false)
      bool enableFutureDeliveryDay,
      @JsonKey(name: 'enablePOAttachmentRequired', defaultValue: false)
      bool enablePOAttachmentRequired,
      @JsonKey(name: 'enablePaymentTerms', defaultValue: false)
      bool enablePaymentTerms,
      @JsonKey(name: 'futureDeliveryDay', defaultValue: '')
      String futureDeliveryDay,
      @JsonKey(name: 'enableGMC', defaultValue: false) bool enableGMC,
      @JsonKey(name: 'enableListPrice', defaultValue: false)
      bool enableListPrice,
      @JsonKey(name: 'enableDefaultMD', defaultValue: false)
      bool enableDefaultMD,
      @JsonKey(name: 'priceOverride', defaultValue: false) bool priceOverride,
      @JsonKey(name: 'disablePaymentTermsDisplay', defaultValue: false)
      bool disablePaymentTermsDisplay,
      @JsonKey(name: 'disableDeliveryDate', defaultValue: false)
      bool disableDeliveryDate,
      @JsonKey(name: 'enableBillTo', defaultValue: false) bool enableBillTo,
      @JsonKey(name: 'showPOAttachment', defaultValue: false)
      bool showPOAttachment,
      @JsonKey(name: 'expiryDateDisplay', defaultValue: false)
      bool expiryDateDisplay,
      @JsonKey(name: 'hideStockDisplay', defaultValue: false)
      bool hideStockDisplay,
      @JsonKey(name: 'addOosMaterials', defaultValue: false)
      bool addOosMaterials,
      @JsonKey(name: 'oosValue', defaultValue: 0) int oosValue,
      @JsonKey(name: 'enableRemarks', defaultValue: false) bool enableRemarks,
      @JsonKey(name: 'enableOHPrice', defaultValue: true) bool enableOHPrice,
      @JsonKey(name: 'ponRequired', defaultValue: false) bool poNumberRequired,
      @JsonKey(name: 'enableIRN', defaultValue: false) bool enableIRN,
      @JsonKey(name: 'enableTaxDisplay', defaultValue: false)
      bool enableTaxDisplay,
      @JsonKey(name: 'enableTenderOrders', defaultValue: false)
      bool enableTenderOrders,
      @JsonKey(name: 'enableTaxAtTotalLevelOnly', defaultValue: false)
      bool enableTaxAtTotalLevelOnly,
      @JsonKey(name: 'netPriceOverride', defaultValue: false)
      bool netPriceOverride,
      @JsonKey(name: 'batchNumDisplay', defaultValue: false)
      bool batchNumDisplay,
      @JsonKey(name: 'displayOrderDiscount', defaultValue: false)
      bool displayOrderDiscount,
      @StringToDoubleConverter()
      @JsonKey(name: 'minOrderAmount', defaultValue: 0.0)
      double minOrderAmount,
      @JsonKey(name: 'salesOrgCode', defaultValue: '0') String salesOrg,
      @JsonKey(name: 'enableZDP8Override', defaultValue: false)
      bool enableZDP8Override,
      @JsonKey(name: 'disableReturnsAccessSR', defaultValue: false)
      bool disableReturnsAccessSR,
      @JsonKey(name: 'disableReturnsAccess', defaultValue: false)
      bool disableReturnsAccess,
      @JsonKey(name: 'disableOverrideFieldCustomer', defaultValue: false)
      bool disableOverrideFieldCustomer,
      @JsonKey(name: 'disableOverrideFieldSR', defaultValue: false)
      bool disableOverrideFieldSR,
      @JsonKey(name: 'enableGreenDelivery', defaultValue: false)
      bool enableGreenDelivery,
      @JsonKey(name: 'greenDeliveryDelayInDays', defaultValue: 2)
      int greenDeliveryDelayInDays,
      @JsonKey(name: 'enableComboDeals', defaultValue: false)
      bool enableComboDeals,
      @JsonKey(name: 'greenDeliveryUserRole', defaultValue: 0)
      int greenDeliveryUserRole,
      @JsonKey(name: 'comboDealsUserRole', defaultValue: 0)
      int comboDealsUserRole,
      @JsonKey(name: 'enableGMN', defaultValue: false) bool enableGMN,
      @JsonKey(name: 'displayItemTaxBreakdown', defaultValue: false)
      bool displayItemTaxBreakdown,
      @JsonKey(name: 'displaySubtotalTaxBreakdown', defaultValue: false)
      bool displaySubtotalTaxBreakdown,
      @JsonKey(name: 'disablePayment', defaultValue: false) bool disablePayment,
      @JsonKey(name: 'hideCredit', defaultValue: false) bool hideCredit,
      @JsonKey(name: 'allowReturnsOutsidePolicy', defaultValue: false)
      bool allowReturnsOutsidePolicy,
      @JsonKey(name: 'enableMarketPlace', defaultValue: false)
      bool enableMarketPlace,
      @StringToDoubleConverter()
      @JsonKey(name: 'mpMinOrderAmount', defaultValue: 0.0)
      double mpMinOrderAmount,
      @JsonKey(name: 'statementOfAccountEnabled', defaultValue: false)
      bool statementOfAccountEnabled,
      @JsonKey(name: 'enableSmallOrderFee', defaultValue: false)
      bool enableSmallOrderFee,
      @JsonKey(name: 'smallOrderFeeUserRoles', defaultValue: <String>[])
      List<String> smallOrderFeeUserRoles,
      @JsonKey(name: 'smallOrderFee', defaultValue: 0.0) double smallOrderFee,
      @JsonKey(name: 'movThreshold', defaultValue: 0.0) double movThreshold,
      @JsonKey(name: 'enableMPSmallOrderFee', defaultValue: false)
      bool enableMPSmallOrderFee,
      @JsonKey(name: 'mpSmallOrderFeeUserRoles', defaultValue: <String>[])
      List<String> mpSmallOrderFeeUserRoles,
      @JsonKey(name: 'mpSmallOrderFee', defaultValue: 0.0)
      double mpSmallOrderFee,
      @JsonKey(name: 'mpMovThreshold', defaultValue: 0.0) double mpMovThreshold,
      @JsonKey(name: 'orderTypes', defaultValue: [])
      List<SalesOrganisationConfigsOrderTypeDto> orderTypes,
      @JsonKey(
          name: 'authorizedExtSalesRep',
          defaultValue: <ExternalSalesRepresentativeInfoDto>[])
      List<ExternalSalesRepresentativeInfoDto> authorizedExtSalesRep,
      @JsonKey(name: 'disclaimer', defaultValue: '') String disclaimer,
      @JsonKey(name: 'enableDeliveryOptions', defaultValue: false)
      bool enableDeliveryOptions,
      @JsonKey(name: 'enableRequestDeliveryDate', defaultValue: false)
      bool enableRequestDeliveryDate,
      @JsonKey(name: 'enableSaturdayUrgentDelivery', defaultValue: false)
      bool enableSaturdayUrgentDelivery,
      @JsonKey(name: 'enableStandardDelivery', defaultValue: false)
      bool enableStandardDelivery,
      @JsonKey(name: 'enableTodayUrgentDelivery', defaultValue: false)
      bool enableTodayUrgentDelivery,
      @JsonKey(name: 'enableTomorrowUrgentDelivery', defaultValue: false)
      bool enableTomorrowUrgentDelivery,
      @JsonKey(name: 'enableUrgentDelivery', defaultValue: false)
      bool enableUrgentDelivery,
      @JsonKey(name: 'saturdayDeliveryFee', defaultValue: 0.0)
      double saturdayDeliveryFee,
      @JsonKey(name: 'selectableDeliveryDays', defaultValue: 0)
      int selectableDeliveryDays,
      @JsonKey(name: 'standardDeliveryDays', defaultValue: 0)
      int standardDeliveryDays,
      @JsonKey(name: 'todayDeliveryFee', defaultValue: 0.0)
      double todayDeliveryFee,
      @JsonKey(name: 'tomorrowDeliveryFee', defaultValue: 0.0)
      double tomorrowDeliveryFee,
      @JsonKey(name: 'poReferenceLength', defaultValue: 0)
      int poReferenceLength,
      @JsonKey(name: 'referenceNoteLength', defaultValue: 0)
      int referenceNoteLength,
      @JsonKey(name: 'showEZCSTickets', defaultValue: false)
      bool showEZCSTickets});
}

/// @nodoc
class __$$SalesOrganisationConfigsDtoImplCopyWithImpl<$Res>
    extends _$SalesOrganisationConfigsDtoCopyWithImpl<$Res,
        _$SalesOrganisationConfigsDtoImpl>
    implements _$$SalesOrganisationConfigsDtoImplCopyWith<$Res> {
  __$$SalesOrganisationConfigsDtoImplCopyWithImpl(
      _$SalesOrganisationConfigsDtoImpl _value,
      $Res Function(_$SalesOrganisationConfigsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? disableProcessingStatus = null,
    Object? currency = null,
    Object? hideCustomer = null,
    Object? enableGimmickMaterial = null,
    Object? disablePrincipals = null,
    Object? principalList = null,
    Object? disableOrderType = null,
    Object? enableBatchNumber = null,
    Object? disableBundles = null,
    Object? enableZDP5 = null,
    Object? enableTaxClassification = null,
    Object? enableVat = null,
    Object? vatValue = null,
    Object? materialWithoutPrice = null,
    Object? enableSpecialInstructions = null,
    Object? enableReferenceNote = null,
    Object? enableCollectiveNumber = null,
    Object? enableMobileNumber = null,
    Object? enableFutureDeliveryDay = null,
    Object? enablePOAttachmentRequired = null,
    Object? enablePaymentTerms = null,
    Object? futureDeliveryDay = null,
    Object? enableGMC = null,
    Object? enableListPrice = null,
    Object? enableDefaultMD = null,
    Object? priceOverride = null,
    Object? disablePaymentTermsDisplay = null,
    Object? disableDeliveryDate = null,
    Object? enableBillTo = null,
    Object? showPOAttachment = null,
    Object? expiryDateDisplay = null,
    Object? hideStockDisplay = null,
    Object? addOosMaterials = null,
    Object? oosValue = null,
    Object? enableRemarks = null,
    Object? enableOHPrice = null,
    Object? poNumberRequired = null,
    Object? enableIRN = null,
    Object? enableTaxDisplay = null,
    Object? enableTenderOrders = null,
    Object? enableTaxAtTotalLevelOnly = null,
    Object? netPriceOverride = null,
    Object? batchNumDisplay = null,
    Object? displayOrderDiscount = null,
    Object? minOrderAmount = null,
    Object? salesOrg = null,
    Object? enableZDP8Override = null,
    Object? disableReturnsAccessSR = null,
    Object? disableReturnsAccess = null,
    Object? disableOverrideFieldCustomer = null,
    Object? disableOverrideFieldSR = null,
    Object? enableGreenDelivery = null,
    Object? greenDeliveryDelayInDays = null,
    Object? enableComboDeals = null,
    Object? greenDeliveryUserRole = null,
    Object? comboDealsUserRole = null,
    Object? enableGMN = null,
    Object? displayItemTaxBreakdown = null,
    Object? displaySubtotalTaxBreakdown = null,
    Object? disablePayment = null,
    Object? hideCredit = null,
    Object? allowReturnsOutsidePolicy = null,
    Object? enableMarketPlace = null,
    Object? mpMinOrderAmount = null,
    Object? statementOfAccountEnabled = null,
    Object? enableSmallOrderFee = null,
    Object? smallOrderFeeUserRoles = null,
    Object? smallOrderFee = null,
    Object? movThreshold = null,
    Object? enableMPSmallOrderFee = null,
    Object? mpSmallOrderFeeUserRoles = null,
    Object? mpSmallOrderFee = null,
    Object? mpMovThreshold = null,
    Object? orderTypes = null,
    Object? authorizedExtSalesRep = null,
    Object? disclaimer = null,
    Object? enableDeliveryOptions = null,
    Object? enableRequestDeliveryDate = null,
    Object? enableSaturdayUrgentDelivery = null,
    Object? enableStandardDelivery = null,
    Object? enableTodayUrgentDelivery = null,
    Object? enableTomorrowUrgentDelivery = null,
    Object? enableUrgentDelivery = null,
    Object? saturdayDeliveryFee = null,
    Object? selectableDeliveryDays = null,
    Object? standardDeliveryDays = null,
    Object? todayDeliveryFee = null,
    Object? tomorrowDeliveryFee = null,
    Object? poReferenceLength = null,
    Object? referenceNoteLength = null,
    Object? showEZCSTickets = null,
  }) {
    return _then(_$SalesOrganisationConfigsDtoImpl(
      disableProcessingStatus: null == disableProcessingStatus
          ? _value.disableProcessingStatus
          : disableProcessingStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      hideCustomer: null == hideCustomer
          ? _value.hideCustomer
          : hideCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      enableGimmickMaterial: null == enableGimmickMaterial
          ? _value.enableGimmickMaterial
          : enableGimmickMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      disablePrincipals: null == disablePrincipals
          ? _value.disablePrincipals
          : disablePrincipals // ignore: cast_nullable_to_non_nullable
              as bool,
      principalList: null == principalList
          ? _value._principalList
          : principalList // ignore: cast_nullable_to_non_nullable
              as List<SalesOrganisationConfigsPrincipalDto>,
      disableOrderType: null == disableOrderType
          ? _value.disableOrderType
          : disableOrderType // ignore: cast_nullable_to_non_nullable
              as bool,
      enableBatchNumber: null == enableBatchNumber
          ? _value.enableBatchNumber
          : enableBatchNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      disableBundles: null == disableBundles
          ? _value.disableBundles
          : disableBundles // ignore: cast_nullable_to_non_nullable
              as bool,
      enableZDP5: null == enableZDP5
          ? _value.enableZDP5
          : enableZDP5 // ignore: cast_nullable_to_non_nullable
              as bool,
      enableTaxClassification: null == enableTaxClassification
          ? _value.enableTaxClassification
          : enableTaxClassification // ignore: cast_nullable_to_non_nullable
              as bool,
      enableVat: null == enableVat
          ? _value.enableVat
          : enableVat // ignore: cast_nullable_to_non_nullable
              as bool,
      vatValue: null == vatValue
          ? _value.vatValue
          : vatValue // ignore: cast_nullable_to_non_nullable
              as int,
      materialWithoutPrice: null == materialWithoutPrice
          ? _value.materialWithoutPrice
          : materialWithoutPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      enableSpecialInstructions: null == enableSpecialInstructions
          ? _value.enableSpecialInstructions
          : enableSpecialInstructions // ignore: cast_nullable_to_non_nullable
              as bool,
      enableReferenceNote: null == enableReferenceNote
          ? _value.enableReferenceNote
          : enableReferenceNote // ignore: cast_nullable_to_non_nullable
              as bool,
      enableCollectiveNumber: null == enableCollectiveNumber
          ? _value.enableCollectiveNumber
          : enableCollectiveNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      enableMobileNumber: null == enableMobileNumber
          ? _value.enableMobileNumber
          : enableMobileNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      enableFutureDeliveryDay: null == enableFutureDeliveryDay
          ? _value.enableFutureDeliveryDay
          : enableFutureDeliveryDay // ignore: cast_nullable_to_non_nullable
              as bool,
      enablePOAttachmentRequired: null == enablePOAttachmentRequired
          ? _value.enablePOAttachmentRequired
          : enablePOAttachmentRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      enablePaymentTerms: null == enablePaymentTerms
          ? _value.enablePaymentTerms
          : enablePaymentTerms // ignore: cast_nullable_to_non_nullable
              as bool,
      futureDeliveryDay: null == futureDeliveryDay
          ? _value.futureDeliveryDay
          : futureDeliveryDay // ignore: cast_nullable_to_non_nullable
              as String,
      enableGMC: null == enableGMC
          ? _value.enableGMC
          : enableGMC // ignore: cast_nullable_to_non_nullable
              as bool,
      enableListPrice: null == enableListPrice
          ? _value.enableListPrice
          : enableListPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      enableDefaultMD: null == enableDefaultMD
          ? _value.enableDefaultMD
          : enableDefaultMD // ignore: cast_nullable_to_non_nullable
              as bool,
      priceOverride: null == priceOverride
          ? _value.priceOverride
          : priceOverride // ignore: cast_nullable_to_non_nullable
              as bool,
      disablePaymentTermsDisplay: null == disablePaymentTermsDisplay
          ? _value.disablePaymentTermsDisplay
          : disablePaymentTermsDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
      disableDeliveryDate: null == disableDeliveryDate
          ? _value.disableDeliveryDate
          : disableDeliveryDate // ignore: cast_nullable_to_non_nullable
              as bool,
      enableBillTo: null == enableBillTo
          ? _value.enableBillTo
          : enableBillTo // ignore: cast_nullable_to_non_nullable
              as bool,
      showPOAttachment: null == showPOAttachment
          ? _value.showPOAttachment
          : showPOAttachment // ignore: cast_nullable_to_non_nullable
              as bool,
      expiryDateDisplay: null == expiryDateDisplay
          ? _value.expiryDateDisplay
          : expiryDateDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
      hideStockDisplay: null == hideStockDisplay
          ? _value.hideStockDisplay
          : hideStockDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
      addOosMaterials: null == addOosMaterials
          ? _value.addOosMaterials
          : addOosMaterials // ignore: cast_nullable_to_non_nullable
              as bool,
      oosValue: null == oosValue
          ? _value.oosValue
          : oosValue // ignore: cast_nullable_to_non_nullable
              as int,
      enableRemarks: null == enableRemarks
          ? _value.enableRemarks
          : enableRemarks // ignore: cast_nullable_to_non_nullable
              as bool,
      enableOHPrice: null == enableOHPrice
          ? _value.enableOHPrice
          : enableOHPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      poNumberRequired: null == poNumberRequired
          ? _value.poNumberRequired
          : poNumberRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      enableIRN: null == enableIRN
          ? _value.enableIRN
          : enableIRN // ignore: cast_nullable_to_non_nullable
              as bool,
      enableTaxDisplay: null == enableTaxDisplay
          ? _value.enableTaxDisplay
          : enableTaxDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
      enableTenderOrders: null == enableTenderOrders
          ? _value.enableTenderOrders
          : enableTenderOrders // ignore: cast_nullable_to_non_nullable
              as bool,
      enableTaxAtTotalLevelOnly: null == enableTaxAtTotalLevelOnly
          ? _value.enableTaxAtTotalLevelOnly
          : enableTaxAtTotalLevelOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      netPriceOverride: null == netPriceOverride
          ? _value.netPriceOverride
          : netPriceOverride // ignore: cast_nullable_to_non_nullable
              as bool,
      batchNumDisplay: null == batchNumDisplay
          ? _value.batchNumDisplay
          : batchNumDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
      displayOrderDiscount: null == displayOrderDiscount
          ? _value.displayOrderDiscount
          : displayOrderDiscount // ignore: cast_nullable_to_non_nullable
              as bool,
      minOrderAmount: null == minOrderAmount
          ? _value.minOrderAmount
          : minOrderAmount // ignore: cast_nullable_to_non_nullable
              as double,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      enableZDP8Override: null == enableZDP8Override
          ? _value.enableZDP8Override
          : enableZDP8Override // ignore: cast_nullable_to_non_nullable
              as bool,
      disableReturnsAccessSR: null == disableReturnsAccessSR
          ? _value.disableReturnsAccessSR
          : disableReturnsAccessSR // ignore: cast_nullable_to_non_nullable
              as bool,
      disableReturnsAccess: null == disableReturnsAccess
          ? _value.disableReturnsAccess
          : disableReturnsAccess // ignore: cast_nullable_to_non_nullable
              as bool,
      disableOverrideFieldCustomer: null == disableOverrideFieldCustomer
          ? _value.disableOverrideFieldCustomer
          : disableOverrideFieldCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      disableOverrideFieldSR: null == disableOverrideFieldSR
          ? _value.disableOverrideFieldSR
          : disableOverrideFieldSR // ignore: cast_nullable_to_non_nullable
              as bool,
      enableGreenDelivery: null == enableGreenDelivery
          ? _value.enableGreenDelivery
          : enableGreenDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      greenDeliveryDelayInDays: null == greenDeliveryDelayInDays
          ? _value.greenDeliveryDelayInDays
          : greenDeliveryDelayInDays // ignore: cast_nullable_to_non_nullable
              as int,
      enableComboDeals: null == enableComboDeals
          ? _value.enableComboDeals
          : enableComboDeals // ignore: cast_nullable_to_non_nullable
              as bool,
      greenDeliveryUserRole: null == greenDeliveryUserRole
          ? _value.greenDeliveryUserRole
          : greenDeliveryUserRole // ignore: cast_nullable_to_non_nullable
              as int,
      comboDealsUserRole: null == comboDealsUserRole
          ? _value.comboDealsUserRole
          : comboDealsUserRole // ignore: cast_nullable_to_non_nullable
              as int,
      enableGMN: null == enableGMN
          ? _value.enableGMN
          : enableGMN // ignore: cast_nullable_to_non_nullable
              as bool,
      displayItemTaxBreakdown: null == displayItemTaxBreakdown
          ? _value.displayItemTaxBreakdown
          : displayItemTaxBreakdown // ignore: cast_nullable_to_non_nullable
              as bool,
      displaySubtotalTaxBreakdown: null == displaySubtotalTaxBreakdown
          ? _value.displaySubtotalTaxBreakdown
          : displaySubtotalTaxBreakdown // ignore: cast_nullable_to_non_nullable
              as bool,
      disablePayment: null == disablePayment
          ? _value.disablePayment
          : disablePayment // ignore: cast_nullable_to_non_nullable
              as bool,
      hideCredit: null == hideCredit
          ? _value.hideCredit
          : hideCredit // ignore: cast_nullable_to_non_nullable
              as bool,
      allowReturnsOutsidePolicy: null == allowReturnsOutsidePolicy
          ? _value.allowReturnsOutsidePolicy
          : allowReturnsOutsidePolicy // ignore: cast_nullable_to_non_nullable
              as bool,
      enableMarketPlace: null == enableMarketPlace
          ? _value.enableMarketPlace
          : enableMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
      mpMinOrderAmount: null == mpMinOrderAmount
          ? _value.mpMinOrderAmount
          : mpMinOrderAmount // ignore: cast_nullable_to_non_nullable
              as double,
      statementOfAccountEnabled: null == statementOfAccountEnabled
          ? _value.statementOfAccountEnabled
          : statementOfAccountEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      enableSmallOrderFee: null == enableSmallOrderFee
          ? _value.enableSmallOrderFee
          : enableSmallOrderFee // ignore: cast_nullable_to_non_nullable
              as bool,
      smallOrderFeeUserRoles: null == smallOrderFeeUserRoles
          ? _value._smallOrderFeeUserRoles
          : smallOrderFeeUserRoles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      smallOrderFee: null == smallOrderFee
          ? _value.smallOrderFee
          : smallOrderFee // ignore: cast_nullable_to_non_nullable
              as double,
      movThreshold: null == movThreshold
          ? _value.movThreshold
          : movThreshold // ignore: cast_nullable_to_non_nullable
              as double,
      enableMPSmallOrderFee: null == enableMPSmallOrderFee
          ? _value.enableMPSmallOrderFee
          : enableMPSmallOrderFee // ignore: cast_nullable_to_non_nullable
              as bool,
      mpSmallOrderFeeUserRoles: null == mpSmallOrderFeeUserRoles
          ? _value._mpSmallOrderFeeUserRoles
          : mpSmallOrderFeeUserRoles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mpSmallOrderFee: null == mpSmallOrderFee
          ? _value.mpSmallOrderFee
          : mpSmallOrderFee // ignore: cast_nullable_to_non_nullable
              as double,
      mpMovThreshold: null == mpMovThreshold
          ? _value.mpMovThreshold
          : mpMovThreshold // ignore: cast_nullable_to_non_nullable
              as double,
      orderTypes: null == orderTypes
          ? _value._orderTypes
          : orderTypes // ignore: cast_nullable_to_non_nullable
              as List<SalesOrganisationConfigsOrderTypeDto>,
      authorizedExtSalesRep: null == authorizedExtSalesRep
          ? _value._authorizedExtSalesRep
          : authorizedExtSalesRep // ignore: cast_nullable_to_non_nullable
              as List<ExternalSalesRepresentativeInfoDto>,
      disclaimer: null == disclaimer
          ? _value.disclaimer
          : disclaimer // ignore: cast_nullable_to_non_nullable
              as String,
      enableDeliveryOptions: null == enableDeliveryOptions
          ? _value.enableDeliveryOptions
          : enableDeliveryOptions // ignore: cast_nullable_to_non_nullable
              as bool,
      enableRequestDeliveryDate: null == enableRequestDeliveryDate
          ? _value.enableRequestDeliveryDate
          : enableRequestDeliveryDate // ignore: cast_nullable_to_non_nullable
              as bool,
      enableSaturdayUrgentDelivery: null == enableSaturdayUrgentDelivery
          ? _value.enableSaturdayUrgentDelivery
          : enableSaturdayUrgentDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      enableStandardDelivery: null == enableStandardDelivery
          ? _value.enableStandardDelivery
          : enableStandardDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      enableTodayUrgentDelivery: null == enableTodayUrgentDelivery
          ? _value.enableTodayUrgentDelivery
          : enableTodayUrgentDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      enableTomorrowUrgentDelivery: null == enableTomorrowUrgentDelivery
          ? _value.enableTomorrowUrgentDelivery
          : enableTomorrowUrgentDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      enableUrgentDelivery: null == enableUrgentDelivery
          ? _value.enableUrgentDelivery
          : enableUrgentDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      saturdayDeliveryFee: null == saturdayDeliveryFee
          ? _value.saturdayDeliveryFee
          : saturdayDeliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      selectableDeliveryDays: null == selectableDeliveryDays
          ? _value.selectableDeliveryDays
          : selectableDeliveryDays // ignore: cast_nullable_to_non_nullable
              as int,
      standardDeliveryDays: null == standardDeliveryDays
          ? _value.standardDeliveryDays
          : standardDeliveryDays // ignore: cast_nullable_to_non_nullable
              as int,
      todayDeliveryFee: null == todayDeliveryFee
          ? _value.todayDeliveryFee
          : todayDeliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      tomorrowDeliveryFee: null == tomorrowDeliveryFee
          ? _value.tomorrowDeliveryFee
          : tomorrowDeliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      poReferenceLength: null == poReferenceLength
          ? _value.poReferenceLength
          : poReferenceLength // ignore: cast_nullable_to_non_nullable
              as int,
      referenceNoteLength: null == referenceNoteLength
          ? _value.referenceNoteLength
          : referenceNoteLength // ignore: cast_nullable_to_non_nullable
              as int,
      showEZCSTickets: null == showEZCSTickets
          ? _value.showEZCSTickets
          : showEZCSTickets // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesOrganisationConfigsDtoImpl extends _SalesOrganisationConfigsDto {
  const _$SalesOrganisationConfigsDtoImpl(
      {@JsonKey(name: 'disableProcessingStatus')
      required this.disableProcessingStatus,
      @JsonKey(name: 'currency') required this.currency,
      @JsonKey(name: 'hideCustomer', defaultValue: false)
      required this.hideCustomer,
      @JsonKey(name: 'enableGimmickMaterial', defaultValue: false)
      required this.enableGimmickMaterial,
      @JsonKey(name: 'disablePrincipals', defaultValue: false)
      required this.disablePrincipals,
      @JsonKey(name: 'principalList')
      @_PrincipalListConverter()
      required final List<SalesOrganisationConfigsPrincipalDto> principalList,
      @JsonKey(name: 'disableOrderType', defaultValue: false)
      required this.disableOrderType,
      @JsonKey(name: 'enableBatchNumber', defaultValue: false)
      required this.enableBatchNumber,
      @JsonKey(name: 'disableBundles', defaultValue: false)
      required this.disableBundles,
      @JsonKey(name: 'enableZDP5', defaultValue: false)
      required this.enableZDP5,
      @JsonKey(name: 'enableTaxClassification', defaultValue: false)
      required this.enableTaxClassification,
      @JsonKey(name: 'enableVat', defaultValue: false) required this.enableVat,
      @JsonKey(name: 'vatValue', defaultValue: 0) required this.vatValue,
      @JsonKey(name: 'materialWithoutPrice', defaultValue: false)
      required this.materialWithoutPrice,
      @JsonKey(name: 'enableSpecialInstructions', defaultValue: false)
      required this.enableSpecialInstructions,
      @JsonKey(name: 'enableReferenceNote', defaultValue: false)
      required this.enableReferenceNote,
      @JsonKey(name: 'enableCollectiveNumber', defaultValue: false)
      required this.enableCollectiveNumber,
      @JsonKey(name: 'enableMobileNumber', defaultValue: false)
      required this.enableMobileNumber,
      @JsonKey(name: 'enableFutureDeliveryDay', defaultValue: false)
      required this.enableFutureDeliveryDay,
      @JsonKey(name: 'enablePOAttachmentRequired', defaultValue: false)
      required this.enablePOAttachmentRequired,
      @JsonKey(name: 'enablePaymentTerms', defaultValue: false)
      required this.enablePaymentTerms,
      @JsonKey(name: 'futureDeliveryDay', defaultValue: '')
      required this.futureDeliveryDay,
      @JsonKey(name: 'enableGMC', defaultValue: false) required this.enableGMC,
      @JsonKey(name: 'enableListPrice', defaultValue: false)
      required this.enableListPrice,
      @JsonKey(name: 'enableDefaultMD', defaultValue: false)
      required this.enableDefaultMD,
      @JsonKey(name: 'priceOverride', defaultValue: false)
      required this.priceOverride,
      @JsonKey(name: 'disablePaymentTermsDisplay', defaultValue: false)
      required this.disablePaymentTermsDisplay,
      @JsonKey(name: 'disableDeliveryDate', defaultValue: false)
      required this.disableDeliveryDate,
      @JsonKey(name: 'enableBillTo', defaultValue: false)
      required this.enableBillTo,
      @JsonKey(name: 'showPOAttachment', defaultValue: false)
      required this.showPOAttachment,
      @JsonKey(name: 'expiryDateDisplay', defaultValue: false)
      required this.expiryDateDisplay,
      @JsonKey(name: 'hideStockDisplay', defaultValue: false)
      required this.hideStockDisplay,
      @JsonKey(name: 'addOosMaterials', defaultValue: false)
      required this.addOosMaterials,
      @JsonKey(name: 'oosValue', defaultValue: 0) required this.oosValue,
      @JsonKey(name: 'enableRemarks', defaultValue: false)
      required this.enableRemarks,
      @JsonKey(name: 'enableOHPrice', defaultValue: true)
      required this.enableOHPrice,
      @JsonKey(name: 'ponRequired', defaultValue: false)
      required this.poNumberRequired,
      @JsonKey(name: 'enableIRN', defaultValue: false) required this.enableIRN,
      @JsonKey(name: 'enableTaxDisplay', defaultValue: false)
      required this.enableTaxDisplay,
      @JsonKey(name: 'enableTenderOrders', defaultValue: false)
      required this.enableTenderOrders,
      @JsonKey(name: 'enableTaxAtTotalLevelOnly', defaultValue: false)
      required this.enableTaxAtTotalLevelOnly,
      @JsonKey(name: 'netPriceOverride', defaultValue: false)
      required this.netPriceOverride,
      @JsonKey(name: 'batchNumDisplay', defaultValue: false)
      required this.batchNumDisplay,
      @JsonKey(name: 'displayOrderDiscount', defaultValue: false)
      required this.displayOrderDiscount,
      @StringToDoubleConverter()
      @JsonKey(name: 'minOrderAmount', defaultValue: 0.0)
      required this.minOrderAmount,
      @JsonKey(name: 'salesOrgCode', defaultValue: '0') required this.salesOrg,
      @JsonKey(name: 'enableZDP8Override', defaultValue: false)
      required this.enableZDP8Override,
      @JsonKey(name: 'disableReturnsAccessSR', defaultValue: false)
      required this.disableReturnsAccessSR,
      @JsonKey(name: 'disableReturnsAccess', defaultValue: false)
      required this.disableReturnsAccess,
      @JsonKey(name: 'disableOverrideFieldCustomer', defaultValue: false)
      required this.disableOverrideFieldCustomer,
      @JsonKey(name: 'disableOverrideFieldSR', defaultValue: false)
      required this.disableOverrideFieldSR,
      @JsonKey(name: 'enableGreenDelivery', defaultValue: false)
      required this.enableGreenDelivery,
      @JsonKey(name: 'greenDeliveryDelayInDays', defaultValue: 2)
      required this.greenDeliveryDelayInDays,
      @JsonKey(name: 'enableComboDeals', defaultValue: false)
      required this.enableComboDeals,
      @JsonKey(name: 'greenDeliveryUserRole', defaultValue: 0)
      required this.greenDeliveryUserRole,
      @JsonKey(name: 'comboDealsUserRole', defaultValue: 0)
      required this.comboDealsUserRole,
      @JsonKey(name: 'enableGMN', defaultValue: false) required this.enableGMN,
      @JsonKey(name: 'displayItemTaxBreakdown', defaultValue: false)
      required this.displayItemTaxBreakdown,
      @JsonKey(name: 'displaySubtotalTaxBreakdown', defaultValue: false)
      required this.displaySubtotalTaxBreakdown,
      @JsonKey(name: 'disablePayment', defaultValue: false)
      required this.disablePayment,
      @JsonKey(name: 'hideCredit', defaultValue: false)
      required this.hideCredit,
      @JsonKey(name: 'allowReturnsOutsidePolicy', defaultValue: false)
      required this.allowReturnsOutsidePolicy,
      @JsonKey(name: 'enableMarketPlace', defaultValue: false)
      required this.enableMarketPlace,
      @StringToDoubleConverter()
      @JsonKey(name: 'mpMinOrderAmount', defaultValue: 0.0)
      required this.mpMinOrderAmount,
      @JsonKey(name: 'statementOfAccountEnabled', defaultValue: false)
      required this.statementOfAccountEnabled,
      @JsonKey(name: 'enableSmallOrderFee', defaultValue: false)
      required this.enableSmallOrderFee,
      @JsonKey(name: 'smallOrderFeeUserRoles', defaultValue: <String>[])
      required final List<String> smallOrderFeeUserRoles,
      @JsonKey(name: 'smallOrderFee', defaultValue: 0.0)
      required this.smallOrderFee,
      @JsonKey(name: 'movThreshold', defaultValue: 0.0)
      required this.movThreshold,
      @JsonKey(name: 'enableMPSmallOrderFee', defaultValue: false)
      required this.enableMPSmallOrderFee,
      @JsonKey(name: 'mpSmallOrderFeeUserRoles', defaultValue: <String>[])
      required final List<String> mpSmallOrderFeeUserRoles,
      @JsonKey(name: 'mpSmallOrderFee', defaultValue: 0.0)
      required this.mpSmallOrderFee,
      @JsonKey(name: 'mpMovThreshold', defaultValue: 0.0)
      required this.mpMovThreshold,
      @JsonKey(name: 'orderTypes', defaultValue: [])
      required final List<SalesOrganisationConfigsOrderTypeDto> orderTypes,
      @JsonKey(
          name: 'authorizedExtSalesRep',
          defaultValue: <ExternalSalesRepresentativeInfoDto>[])
      required final List<ExternalSalesRepresentativeInfoDto>
          authorizedExtSalesRep,
      @JsonKey(name: 'disclaimer', defaultValue: '') required this.disclaimer,
      @JsonKey(name: 'enableDeliveryOptions', defaultValue: false)
      required this.enableDeliveryOptions,
      @JsonKey(name: 'enableRequestDeliveryDate', defaultValue: false)
      required this.enableRequestDeliveryDate,
      @JsonKey(name: 'enableSaturdayUrgentDelivery', defaultValue: false)
      required this.enableSaturdayUrgentDelivery,
      @JsonKey(name: 'enableStandardDelivery', defaultValue: false)
      required this.enableStandardDelivery,
      @JsonKey(name: 'enableTodayUrgentDelivery', defaultValue: false)
      required this.enableTodayUrgentDelivery,
      @JsonKey(name: 'enableTomorrowUrgentDelivery', defaultValue: false)
      required this.enableTomorrowUrgentDelivery,
      @JsonKey(name: 'enableUrgentDelivery', defaultValue: false)
      required this.enableUrgentDelivery,
      @JsonKey(name: 'saturdayDeliveryFee', defaultValue: 0.0)
      required this.saturdayDeliveryFee,
      @JsonKey(name: 'selectableDeliveryDays', defaultValue: 0)
      required this.selectableDeliveryDays,
      @JsonKey(name: 'standardDeliveryDays', defaultValue: 0)
      required this.standardDeliveryDays,
      @JsonKey(name: 'todayDeliveryFee', defaultValue: 0.0)
      required this.todayDeliveryFee,
      @JsonKey(name: 'tomorrowDeliveryFee', defaultValue: 0.0)
      required this.tomorrowDeliveryFee,
      @JsonKey(name: 'poReferenceLength', defaultValue: 0)
      required this.poReferenceLength,
      @JsonKey(name: 'referenceNoteLength', defaultValue: 0)
      required this.referenceNoteLength,
      @JsonKey(name: 'showEZCSTickets', defaultValue: false)
      required this.showEZCSTickets})
      : _principalList = principalList,
        _smallOrderFeeUserRoles = smallOrderFeeUserRoles,
        _mpSmallOrderFeeUserRoles = mpSmallOrderFeeUserRoles,
        _orderTypes = orderTypes,
        _authorizedExtSalesRep = authorizedExtSalesRep,
        super._();

  factory _$SalesOrganisationConfigsDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SalesOrganisationConfigsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'disableProcessingStatus')
  final bool disableProcessingStatus;
  @override
  @JsonKey(name: 'currency')
  final String currency;
  @override
  @JsonKey(name: 'hideCustomer', defaultValue: false)
  final bool hideCustomer;
  @override
  @JsonKey(name: 'enableGimmickMaterial', defaultValue: false)
  final bool enableGimmickMaterial;
  @override
  @JsonKey(name: 'disablePrincipals', defaultValue: false)
  final bool disablePrincipals;
  final List<SalesOrganisationConfigsPrincipalDto> _principalList;
  @override
  @JsonKey(name: 'principalList')
  @_PrincipalListConverter()
  List<SalesOrganisationConfigsPrincipalDto> get principalList {
    if (_principalList is EqualUnmodifiableListView) return _principalList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_principalList);
  }

  @override
  @JsonKey(name: 'disableOrderType', defaultValue: false)
  final bool disableOrderType;
  @override
  @JsonKey(name: 'enableBatchNumber', defaultValue: false)
  final bool enableBatchNumber;
  @override
  @JsonKey(name: 'disableBundles', defaultValue: false)
  final bool disableBundles;
  @override
  @JsonKey(name: 'enableZDP5', defaultValue: false)
  final bool enableZDP5;
  @override
  @JsonKey(name: 'enableTaxClassification', defaultValue: false)
  final bool enableTaxClassification;
  @override
  @JsonKey(name: 'enableVat', defaultValue: false)
  final bool enableVat;
  @override
  @JsonKey(name: 'vatValue', defaultValue: 0)
  final int vatValue;
  @override
  @JsonKey(name: 'materialWithoutPrice', defaultValue: false)
  final bool materialWithoutPrice;
  @override
  @JsonKey(name: 'enableSpecialInstructions', defaultValue: false)
  final bool enableSpecialInstructions;
  @override
  @JsonKey(name: 'enableReferenceNote', defaultValue: false)
  final bool enableReferenceNote;
  @override
  @JsonKey(name: 'enableCollectiveNumber', defaultValue: false)
  final bool enableCollectiveNumber;
  @override
  @JsonKey(name: 'enableMobileNumber', defaultValue: false)
  final bool enableMobileNumber;
  @override
  @JsonKey(name: 'enableFutureDeliveryDay', defaultValue: false)
  final bool enableFutureDeliveryDay;
  @override
  @JsonKey(name: 'enablePOAttachmentRequired', defaultValue: false)
  final bool enablePOAttachmentRequired;
  @override
  @JsonKey(name: 'enablePaymentTerms', defaultValue: false)
  final bool enablePaymentTerms;
  @override
  @JsonKey(name: 'futureDeliveryDay', defaultValue: '')
  final String futureDeliveryDay;
  @override
  @JsonKey(name: 'enableGMC', defaultValue: false)
  final bool enableGMC;
  @override
  @JsonKey(name: 'enableListPrice', defaultValue: false)
  final bool enableListPrice;
  @override
  @JsonKey(name: 'enableDefaultMD', defaultValue: false)
  final bool enableDefaultMD;
  @override
  @JsonKey(name: 'priceOverride', defaultValue: false)
  final bool priceOverride;
  @override
  @JsonKey(name: 'disablePaymentTermsDisplay', defaultValue: false)
  final bool disablePaymentTermsDisplay;
  @override
  @JsonKey(name: 'disableDeliveryDate', defaultValue: false)
  final bool disableDeliveryDate;
  @override
  @JsonKey(name: 'enableBillTo', defaultValue: false)
  final bool enableBillTo;
  @override
  @JsonKey(name: 'showPOAttachment', defaultValue: false)
  final bool showPOAttachment;
  @override
  @JsonKey(name: 'expiryDateDisplay', defaultValue: false)
  final bool expiryDateDisplay;
  @override
  @JsonKey(name: 'hideStockDisplay', defaultValue: false)
  final bool hideStockDisplay;
  @override
  @JsonKey(name: 'addOosMaterials', defaultValue: false)
  final bool addOosMaterials;
  @override
  @JsonKey(name: 'oosValue', defaultValue: 0)
  final int oosValue;
  @override
  @JsonKey(name: 'enableRemarks', defaultValue: false)
  final bool enableRemarks;
  @override
  @JsonKey(name: 'enableOHPrice', defaultValue: true)
  final bool enableOHPrice;
  @override
  @JsonKey(name: 'ponRequired', defaultValue: false)
  final bool poNumberRequired;
  @override
  @JsonKey(name: 'enableIRN', defaultValue: false)
  final bool enableIRN;
  @override
  @JsonKey(name: 'enableTaxDisplay', defaultValue: false)
  final bool enableTaxDisplay;
  @override
  @JsonKey(name: 'enableTenderOrders', defaultValue: false)
  final bool enableTenderOrders;
  @override
  @JsonKey(name: 'enableTaxAtTotalLevelOnly', defaultValue: false)
  final bool enableTaxAtTotalLevelOnly;
  @override
  @JsonKey(name: 'netPriceOverride', defaultValue: false)
  final bool netPriceOverride;
  @override
  @JsonKey(name: 'batchNumDisplay', defaultValue: false)
  final bool batchNumDisplay;
  @override
  @JsonKey(name: 'displayOrderDiscount', defaultValue: false)
  final bool displayOrderDiscount;
  @override
  @StringToDoubleConverter()
  @JsonKey(name: 'minOrderAmount', defaultValue: 0.0)
  final double minOrderAmount;
  @override
  @JsonKey(name: 'salesOrgCode', defaultValue: '0')
  final String salesOrg;
  @override
  @JsonKey(name: 'enableZDP8Override', defaultValue: false)
  final bool enableZDP8Override;
  @override
  @JsonKey(name: 'disableReturnsAccessSR', defaultValue: false)
  final bool disableReturnsAccessSR;
  @override
  @JsonKey(name: 'disableReturnsAccess', defaultValue: false)
  final bool disableReturnsAccess;
  @override
  @JsonKey(name: 'disableOverrideFieldCustomer', defaultValue: false)
  final bool disableOverrideFieldCustomer;
  @override
  @JsonKey(name: 'disableOverrideFieldSR', defaultValue: false)
  final bool disableOverrideFieldSR;
  @override
  @JsonKey(name: 'enableGreenDelivery', defaultValue: false)
  final bool enableGreenDelivery;
  @override
  @JsonKey(name: 'greenDeliveryDelayInDays', defaultValue: 2)
  final int greenDeliveryDelayInDays;
  @override
  @JsonKey(name: 'enableComboDeals', defaultValue: false)
  final bool enableComboDeals;
  @override
  @JsonKey(name: 'greenDeliveryUserRole', defaultValue: 0)
  final int greenDeliveryUserRole;
  @override
  @JsonKey(name: 'comboDealsUserRole', defaultValue: 0)
  final int comboDealsUserRole;
  @override
  @JsonKey(name: 'enableGMN', defaultValue: false)
  final bool enableGMN;
  @override
  @JsonKey(name: 'displayItemTaxBreakdown', defaultValue: false)
  final bool displayItemTaxBreakdown;
  @override
  @JsonKey(name: 'displaySubtotalTaxBreakdown', defaultValue: false)
  final bool displaySubtotalTaxBreakdown;
  @override
  @JsonKey(name: 'disablePayment', defaultValue: false)
  final bool disablePayment;
  @override
  @JsonKey(name: 'hideCredit', defaultValue: false)
  final bool hideCredit;
  @override
  @JsonKey(name: 'allowReturnsOutsidePolicy', defaultValue: false)
  final bool allowReturnsOutsidePolicy;
  @override
  @JsonKey(name: 'enableMarketPlace', defaultValue: false)
  final bool enableMarketPlace;
  @override
  @StringToDoubleConverter()
  @JsonKey(name: 'mpMinOrderAmount', defaultValue: 0.0)
  final double mpMinOrderAmount;
  @override
  @JsonKey(name: 'statementOfAccountEnabled', defaultValue: false)
  final bool statementOfAccountEnabled;
  @override
  @JsonKey(name: 'enableSmallOrderFee', defaultValue: false)
  final bool enableSmallOrderFee;
  final List<String> _smallOrderFeeUserRoles;
  @override
  @JsonKey(name: 'smallOrderFeeUserRoles', defaultValue: <String>[])
  List<String> get smallOrderFeeUserRoles {
    if (_smallOrderFeeUserRoles is EqualUnmodifiableListView)
      return _smallOrderFeeUserRoles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_smallOrderFeeUserRoles);
  }

  @override
  @JsonKey(name: 'smallOrderFee', defaultValue: 0.0)
  final double smallOrderFee;
  @override
  @JsonKey(name: 'movThreshold', defaultValue: 0.0)
  final double movThreshold;
  @override
  @JsonKey(name: 'enableMPSmallOrderFee', defaultValue: false)
  final bool enableMPSmallOrderFee;
  final List<String> _mpSmallOrderFeeUserRoles;
  @override
  @JsonKey(name: 'mpSmallOrderFeeUserRoles', defaultValue: <String>[])
  List<String> get mpSmallOrderFeeUserRoles {
    if (_mpSmallOrderFeeUserRoles is EqualUnmodifiableListView)
      return _mpSmallOrderFeeUserRoles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mpSmallOrderFeeUserRoles);
  }

  @override
  @JsonKey(name: 'mpSmallOrderFee', defaultValue: 0.0)
  final double mpSmallOrderFee;
  @override
  @JsonKey(name: 'mpMovThreshold', defaultValue: 0.0)
  final double mpMovThreshold;
  final List<SalesOrganisationConfigsOrderTypeDto> _orderTypes;
  @override
  @JsonKey(name: 'orderTypes', defaultValue: [])
  List<SalesOrganisationConfigsOrderTypeDto> get orderTypes {
    if (_orderTypes is EqualUnmodifiableListView) return _orderTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderTypes);
  }

  final List<ExternalSalesRepresentativeInfoDto> _authorizedExtSalesRep;
  @override
  @JsonKey(
      name: 'authorizedExtSalesRep',
      defaultValue: <ExternalSalesRepresentativeInfoDto>[])
  List<ExternalSalesRepresentativeInfoDto> get authorizedExtSalesRep {
    if (_authorizedExtSalesRep is EqualUnmodifiableListView)
      return _authorizedExtSalesRep;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authorizedExtSalesRep);
  }

  @override
  @JsonKey(name: 'disclaimer', defaultValue: '')
  final String disclaimer;
  @override
  @JsonKey(name: 'enableDeliveryOptions', defaultValue: false)
  final bool enableDeliveryOptions;
  @override
  @JsonKey(name: 'enableRequestDeliveryDate', defaultValue: false)
  final bool enableRequestDeliveryDate;
  @override
  @JsonKey(name: 'enableSaturdayUrgentDelivery', defaultValue: false)
  final bool enableSaturdayUrgentDelivery;
  @override
  @JsonKey(name: 'enableStandardDelivery', defaultValue: false)
  final bool enableStandardDelivery;
  @override
  @JsonKey(name: 'enableTodayUrgentDelivery', defaultValue: false)
  final bool enableTodayUrgentDelivery;
  @override
  @JsonKey(name: 'enableTomorrowUrgentDelivery', defaultValue: false)
  final bool enableTomorrowUrgentDelivery;
  @override
  @JsonKey(name: 'enableUrgentDelivery', defaultValue: false)
  final bool enableUrgentDelivery;
  @override
  @JsonKey(name: 'saturdayDeliveryFee', defaultValue: 0.0)
  final double saturdayDeliveryFee;
  @override
  @JsonKey(name: 'selectableDeliveryDays', defaultValue: 0)
  final int selectableDeliveryDays;
  @override
  @JsonKey(name: 'standardDeliveryDays', defaultValue: 0)
  final int standardDeliveryDays;
  @override
  @JsonKey(name: 'todayDeliveryFee', defaultValue: 0.0)
  final double todayDeliveryFee;
  @override
  @JsonKey(name: 'tomorrowDeliveryFee', defaultValue: 0.0)
  final double tomorrowDeliveryFee;
  @override
  @JsonKey(name: 'poReferenceLength', defaultValue: 0)
  final int poReferenceLength;
  @override
  @JsonKey(name: 'referenceNoteLength', defaultValue: 0)
  final int referenceNoteLength;
  @override
  @JsonKey(name: 'showEZCSTickets', defaultValue: false)
  final bool showEZCSTickets;

  @override
  String toString() {
    return 'SalesOrganisationConfigsDto(disableProcessingStatus: $disableProcessingStatus, currency: $currency, hideCustomer: $hideCustomer, enableGimmickMaterial: $enableGimmickMaterial, disablePrincipals: $disablePrincipals, principalList: $principalList, disableOrderType: $disableOrderType, enableBatchNumber: $enableBatchNumber, disableBundles: $disableBundles, enableZDP5: $enableZDP5, enableTaxClassification: $enableTaxClassification, enableVat: $enableVat, vatValue: $vatValue, materialWithoutPrice: $materialWithoutPrice, enableSpecialInstructions: $enableSpecialInstructions, enableReferenceNote: $enableReferenceNote, enableCollectiveNumber: $enableCollectiveNumber, enableMobileNumber: $enableMobileNumber, enableFutureDeliveryDay: $enableFutureDeliveryDay, enablePOAttachmentRequired: $enablePOAttachmentRequired, enablePaymentTerms: $enablePaymentTerms, futureDeliveryDay: $futureDeliveryDay, enableGMC: $enableGMC, enableListPrice: $enableListPrice, enableDefaultMD: $enableDefaultMD, priceOverride: $priceOverride, disablePaymentTermsDisplay: $disablePaymentTermsDisplay, disableDeliveryDate: $disableDeliveryDate, enableBillTo: $enableBillTo, showPOAttachment: $showPOAttachment, expiryDateDisplay: $expiryDateDisplay, hideStockDisplay: $hideStockDisplay, addOosMaterials: $addOosMaterials, oosValue: $oosValue, enableRemarks: $enableRemarks, enableOHPrice: $enableOHPrice, poNumberRequired: $poNumberRequired, enableIRN: $enableIRN, enableTaxDisplay: $enableTaxDisplay, enableTenderOrders: $enableTenderOrders, enableTaxAtTotalLevelOnly: $enableTaxAtTotalLevelOnly, netPriceOverride: $netPriceOverride, batchNumDisplay: $batchNumDisplay, displayOrderDiscount: $displayOrderDiscount, minOrderAmount: $minOrderAmount, salesOrg: $salesOrg, enableZDP8Override: $enableZDP8Override, disableReturnsAccessSR: $disableReturnsAccessSR, disableReturnsAccess: $disableReturnsAccess, disableOverrideFieldCustomer: $disableOverrideFieldCustomer, disableOverrideFieldSR: $disableOverrideFieldSR, enableGreenDelivery: $enableGreenDelivery, greenDeliveryDelayInDays: $greenDeliveryDelayInDays, enableComboDeals: $enableComboDeals, greenDeliveryUserRole: $greenDeliveryUserRole, comboDealsUserRole: $comboDealsUserRole, enableGMN: $enableGMN, displayItemTaxBreakdown: $displayItemTaxBreakdown, displaySubtotalTaxBreakdown: $displaySubtotalTaxBreakdown, disablePayment: $disablePayment, hideCredit: $hideCredit, allowReturnsOutsidePolicy: $allowReturnsOutsidePolicy, enableMarketPlace: $enableMarketPlace, mpMinOrderAmount: $mpMinOrderAmount, statementOfAccountEnabled: $statementOfAccountEnabled, enableSmallOrderFee: $enableSmallOrderFee, smallOrderFeeUserRoles: $smallOrderFeeUserRoles, smallOrderFee: $smallOrderFee, movThreshold: $movThreshold, enableMPSmallOrderFee: $enableMPSmallOrderFee, mpSmallOrderFeeUserRoles: $mpSmallOrderFeeUserRoles, mpSmallOrderFee: $mpSmallOrderFee, mpMovThreshold: $mpMovThreshold, orderTypes: $orderTypes, authorizedExtSalesRep: $authorizedExtSalesRep, disclaimer: $disclaimer, enableDeliveryOptions: $enableDeliveryOptions, enableRequestDeliveryDate: $enableRequestDeliveryDate, enableSaturdayUrgentDelivery: $enableSaturdayUrgentDelivery, enableStandardDelivery: $enableStandardDelivery, enableTodayUrgentDelivery: $enableTodayUrgentDelivery, enableTomorrowUrgentDelivery: $enableTomorrowUrgentDelivery, enableUrgentDelivery: $enableUrgentDelivery, saturdayDeliveryFee: $saturdayDeliveryFee, selectableDeliveryDays: $selectableDeliveryDays, standardDeliveryDays: $standardDeliveryDays, todayDeliveryFee: $todayDeliveryFee, tomorrowDeliveryFee: $tomorrowDeliveryFee, poReferenceLength: $poReferenceLength, referenceNoteLength: $referenceNoteLength, showEZCSTickets: $showEZCSTickets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesOrganisationConfigsDtoImpl &&
            (identical(other.disableProcessingStatus, disableProcessingStatus) ||
                other.disableProcessingStatus == disableProcessingStatus) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.hideCustomer, hideCustomer) ||
                other.hideCustomer == hideCustomer) &&
            (identical(other.enableGimmickMaterial, enableGimmickMaterial) ||
                other.enableGimmickMaterial == enableGimmickMaterial) &&
            (identical(other.disablePrincipals, disablePrincipals) ||
                other.disablePrincipals == disablePrincipals) &&
            const DeepCollectionEquality()
                .equals(other._principalList, _principalList) &&
            (identical(other.disableOrderType, disableOrderType) ||
                other.disableOrderType == disableOrderType) &&
            (identical(other.enableBatchNumber, enableBatchNumber) ||
                other.enableBatchNumber == enableBatchNumber) &&
            (identical(other.disableBundles, disableBundles) ||
                other.disableBundles == disableBundles) &&
            (identical(other.enableZDP5, enableZDP5) ||
                other.enableZDP5 == enableZDP5) &&
            (identical(other.enableTaxClassification, enableTaxClassification) ||
                other.enableTaxClassification == enableTaxClassification) &&
            (identical(other.enableVat, enableVat) ||
                other.enableVat == enableVat) &&
            (identical(other.vatValue, vatValue) ||
                other.vatValue == vatValue) &&
            (identical(other.materialWithoutPrice, materialWithoutPrice) ||
                other.materialWithoutPrice == materialWithoutPrice) &&
            (identical(other.enableSpecialInstructions, enableSpecialInstructions) ||
                other.enableSpecialInstructions == enableSpecialInstructions) &&
            (identical(other.enableReferenceNote, enableReferenceNote) ||
                other.enableReferenceNote == enableReferenceNote) &&
            (identical(other.enableCollectiveNumber, enableCollectiveNumber) ||
                other.enableCollectiveNumber == enableCollectiveNumber) &&
            (identical(other.enableMobileNumber, enableMobileNumber) ||
                other.enableMobileNumber == enableMobileNumber) &&
            (identical(other.enableFutureDeliveryDay, enableFutureDeliveryDay) ||
                other.enableFutureDeliveryDay == enableFutureDeliveryDay) &&
            (identical(other.enablePOAttachmentRequired, enablePOAttachmentRequired) ||
                other.enablePOAttachmentRequired ==
                    enablePOAttachmentRequired) &&
            (identical(other.enablePaymentTerms, enablePaymentTerms) ||
                other.enablePaymentTerms == enablePaymentTerms) &&
            (identical(other.futureDeliveryDay, futureDeliveryDay) ||
                other.futureDeliveryDay == futureDeliveryDay) &&
            (identical(other.enableGMC, enableGMC) ||
                other.enableGMC == enableGMC) &&
            (identical(other.enableListPrice, enableListPrice) ||
                other.enableListPrice == enableListPrice) &&
            (identical(other.enableDefaultMD, enableDefaultMD) ||
                other.enableDefaultMD == enableDefaultMD) &&
            (identical(other.priceOverride, priceOverride) ||
                other.priceOverride == priceOverride) &&
            (identical(other.disablePaymentTermsDisplay, disablePaymentTermsDisplay) ||
                other.disablePaymentTermsDisplay == disablePaymentTermsDisplay) &&
            (identical(other.disableDeliveryDate, disableDeliveryDate) || other.disableDeliveryDate == disableDeliveryDate) &&
            (identical(other.enableBillTo, enableBillTo) || other.enableBillTo == enableBillTo) &&
            (identical(other.showPOAttachment, showPOAttachment) || other.showPOAttachment == showPOAttachment) &&
            (identical(other.expiryDateDisplay, expiryDateDisplay) || other.expiryDateDisplay == expiryDateDisplay) &&
            (identical(other.hideStockDisplay, hideStockDisplay) || other.hideStockDisplay == hideStockDisplay) &&
            (identical(other.addOosMaterials, addOosMaterials) || other.addOosMaterials == addOosMaterials) &&
            (identical(other.oosValue, oosValue) || other.oosValue == oosValue) &&
            (identical(other.enableRemarks, enableRemarks) || other.enableRemarks == enableRemarks) &&
            (identical(other.enableOHPrice, enableOHPrice) || other.enableOHPrice == enableOHPrice) &&
            (identical(other.poNumberRequired, poNumberRequired) || other.poNumberRequired == poNumberRequired) &&
            (identical(other.enableIRN, enableIRN) || other.enableIRN == enableIRN) &&
            (identical(other.enableTaxDisplay, enableTaxDisplay) || other.enableTaxDisplay == enableTaxDisplay) &&
            (identical(other.enableTenderOrders, enableTenderOrders) || other.enableTenderOrders == enableTenderOrders) &&
            (identical(other.enableTaxAtTotalLevelOnly, enableTaxAtTotalLevelOnly) || other.enableTaxAtTotalLevelOnly == enableTaxAtTotalLevelOnly) &&
            (identical(other.netPriceOverride, netPriceOverride) || other.netPriceOverride == netPriceOverride) &&
            (identical(other.batchNumDisplay, batchNumDisplay) || other.batchNumDisplay == batchNumDisplay) &&
            (identical(other.displayOrderDiscount, displayOrderDiscount) || other.displayOrderDiscount == displayOrderDiscount) &&
            (identical(other.minOrderAmount, minOrderAmount) || other.minOrderAmount == minOrderAmount) &&
            (identical(other.salesOrg, salesOrg) || other.salesOrg == salesOrg) &&
            (identical(other.enableZDP8Override, enableZDP8Override) || other.enableZDP8Override == enableZDP8Override) &&
            (identical(other.disableReturnsAccessSR, disableReturnsAccessSR) || other.disableReturnsAccessSR == disableReturnsAccessSR) &&
            (identical(other.disableReturnsAccess, disableReturnsAccess) || other.disableReturnsAccess == disableReturnsAccess) &&
            (identical(other.disableOverrideFieldCustomer, disableOverrideFieldCustomer) || other.disableOverrideFieldCustomer == disableOverrideFieldCustomer) &&
            (identical(other.disableOverrideFieldSR, disableOverrideFieldSR) || other.disableOverrideFieldSR == disableOverrideFieldSR) &&
            (identical(other.enableGreenDelivery, enableGreenDelivery) || other.enableGreenDelivery == enableGreenDelivery) &&
            (identical(other.greenDeliveryDelayInDays, greenDeliveryDelayInDays) || other.greenDeliveryDelayInDays == greenDeliveryDelayInDays) &&
            (identical(other.enableComboDeals, enableComboDeals) || other.enableComboDeals == enableComboDeals) &&
            (identical(other.greenDeliveryUserRole, greenDeliveryUserRole) || other.greenDeliveryUserRole == greenDeliveryUserRole) &&
            (identical(other.comboDealsUserRole, comboDealsUserRole) || other.comboDealsUserRole == comboDealsUserRole) &&
            (identical(other.enableGMN, enableGMN) || other.enableGMN == enableGMN) &&
            (identical(other.displayItemTaxBreakdown, displayItemTaxBreakdown) || other.displayItemTaxBreakdown == displayItemTaxBreakdown) &&
            (identical(other.displaySubtotalTaxBreakdown, displaySubtotalTaxBreakdown) || other.displaySubtotalTaxBreakdown == displaySubtotalTaxBreakdown) &&
            (identical(other.disablePayment, disablePayment) || other.disablePayment == disablePayment) &&
            (identical(other.hideCredit, hideCredit) || other.hideCredit == hideCredit) &&
            (identical(other.allowReturnsOutsidePolicy, allowReturnsOutsidePolicy) || other.allowReturnsOutsidePolicy == allowReturnsOutsidePolicy) &&
            (identical(other.enableMarketPlace, enableMarketPlace) || other.enableMarketPlace == enableMarketPlace) &&
            (identical(other.mpMinOrderAmount, mpMinOrderAmount) || other.mpMinOrderAmount == mpMinOrderAmount) &&
            (identical(other.statementOfAccountEnabled, statementOfAccountEnabled) || other.statementOfAccountEnabled == statementOfAccountEnabled) &&
            (identical(other.enableSmallOrderFee, enableSmallOrderFee) || other.enableSmallOrderFee == enableSmallOrderFee) &&
            const DeepCollectionEquality().equals(other._smallOrderFeeUserRoles, _smallOrderFeeUserRoles) &&
            (identical(other.smallOrderFee, smallOrderFee) || other.smallOrderFee == smallOrderFee) &&
            (identical(other.movThreshold, movThreshold) || other.movThreshold == movThreshold) &&
            (identical(other.enableMPSmallOrderFee, enableMPSmallOrderFee) || other.enableMPSmallOrderFee == enableMPSmallOrderFee) &&
            const DeepCollectionEquality().equals(other._mpSmallOrderFeeUserRoles, _mpSmallOrderFeeUserRoles) &&
            (identical(other.mpSmallOrderFee, mpSmallOrderFee) || other.mpSmallOrderFee == mpSmallOrderFee) &&
            (identical(other.mpMovThreshold, mpMovThreshold) || other.mpMovThreshold == mpMovThreshold) &&
            const DeepCollectionEquality().equals(other._orderTypes, _orderTypes) &&
            const DeepCollectionEquality().equals(other._authorizedExtSalesRep, _authorizedExtSalesRep) &&
            (identical(other.disclaimer, disclaimer) || other.disclaimer == disclaimer) &&
            (identical(other.enableDeliveryOptions, enableDeliveryOptions) || other.enableDeliveryOptions == enableDeliveryOptions) &&
            (identical(other.enableRequestDeliveryDate, enableRequestDeliveryDate) || other.enableRequestDeliveryDate == enableRequestDeliveryDate) &&
            (identical(other.enableSaturdayUrgentDelivery, enableSaturdayUrgentDelivery) || other.enableSaturdayUrgentDelivery == enableSaturdayUrgentDelivery) &&
            (identical(other.enableStandardDelivery, enableStandardDelivery) || other.enableStandardDelivery == enableStandardDelivery) &&
            (identical(other.enableTodayUrgentDelivery, enableTodayUrgentDelivery) || other.enableTodayUrgentDelivery == enableTodayUrgentDelivery) &&
            (identical(other.enableTomorrowUrgentDelivery, enableTomorrowUrgentDelivery) || other.enableTomorrowUrgentDelivery == enableTomorrowUrgentDelivery) &&
            (identical(other.enableUrgentDelivery, enableUrgentDelivery) || other.enableUrgentDelivery == enableUrgentDelivery) &&
            (identical(other.saturdayDeliveryFee, saturdayDeliveryFee) || other.saturdayDeliveryFee == saturdayDeliveryFee) &&
            (identical(other.selectableDeliveryDays, selectableDeliveryDays) || other.selectableDeliveryDays == selectableDeliveryDays) &&
            (identical(other.standardDeliveryDays, standardDeliveryDays) || other.standardDeliveryDays == standardDeliveryDays) &&
            (identical(other.todayDeliveryFee, todayDeliveryFee) || other.todayDeliveryFee == todayDeliveryFee) &&
            (identical(other.tomorrowDeliveryFee, tomorrowDeliveryFee) || other.tomorrowDeliveryFee == tomorrowDeliveryFee) &&
            (identical(other.poReferenceLength, poReferenceLength) || other.poReferenceLength == poReferenceLength) &&
            (identical(other.referenceNoteLength, referenceNoteLength) || other.referenceNoteLength == referenceNoteLength) &&
            (identical(other.showEZCSTickets, showEZCSTickets) || other.showEZCSTickets == showEZCSTickets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        disableProcessingStatus,
        currency,
        hideCustomer,
        enableGimmickMaterial,
        disablePrincipals,
        const DeepCollectionEquality().hash(_principalList),
        disableOrderType,
        enableBatchNumber,
        disableBundles,
        enableZDP5,
        enableTaxClassification,
        enableVat,
        vatValue,
        materialWithoutPrice,
        enableSpecialInstructions,
        enableReferenceNote,
        enableCollectiveNumber,
        enableMobileNumber,
        enableFutureDeliveryDay,
        enablePOAttachmentRequired,
        enablePaymentTerms,
        futureDeliveryDay,
        enableGMC,
        enableListPrice,
        enableDefaultMD,
        priceOverride,
        disablePaymentTermsDisplay,
        disableDeliveryDate,
        enableBillTo,
        showPOAttachment,
        expiryDateDisplay,
        hideStockDisplay,
        addOosMaterials,
        oosValue,
        enableRemarks,
        enableOHPrice,
        poNumberRequired,
        enableIRN,
        enableTaxDisplay,
        enableTenderOrders,
        enableTaxAtTotalLevelOnly,
        netPriceOverride,
        batchNumDisplay,
        displayOrderDiscount,
        minOrderAmount,
        salesOrg,
        enableZDP8Override,
        disableReturnsAccessSR,
        disableReturnsAccess,
        disableOverrideFieldCustomer,
        disableOverrideFieldSR,
        enableGreenDelivery,
        greenDeliveryDelayInDays,
        enableComboDeals,
        greenDeliveryUserRole,
        comboDealsUserRole,
        enableGMN,
        displayItemTaxBreakdown,
        displaySubtotalTaxBreakdown,
        disablePayment,
        hideCredit,
        allowReturnsOutsidePolicy,
        enableMarketPlace,
        mpMinOrderAmount,
        statementOfAccountEnabled,
        enableSmallOrderFee,
        const DeepCollectionEquality().hash(_smallOrderFeeUserRoles),
        smallOrderFee,
        movThreshold,
        enableMPSmallOrderFee,
        const DeepCollectionEquality().hash(_mpSmallOrderFeeUserRoles),
        mpSmallOrderFee,
        mpMovThreshold,
        const DeepCollectionEquality().hash(_orderTypes),
        const DeepCollectionEquality().hash(_authorizedExtSalesRep),
        disclaimer,
        enableDeliveryOptions,
        enableRequestDeliveryDate,
        enableSaturdayUrgentDelivery,
        enableStandardDelivery,
        enableTodayUrgentDelivery,
        enableTomorrowUrgentDelivery,
        enableUrgentDelivery,
        saturdayDeliveryFee,
        selectableDeliveryDays,
        standardDeliveryDays,
        todayDeliveryFee,
        tomorrowDeliveryFee,
        poReferenceLength,
        referenceNoteLength,
        showEZCSTickets
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesOrganisationConfigsDtoImplCopyWith<_$SalesOrganisationConfigsDtoImpl>
      get copyWith => __$$SalesOrganisationConfigsDtoImplCopyWithImpl<
          _$SalesOrganisationConfigsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesOrganisationConfigsDtoImplToJson(
      this,
    );
  }
}

abstract class _SalesOrganisationConfigsDto
    extends SalesOrganisationConfigsDto {
  const factory _SalesOrganisationConfigsDto(
      {@JsonKey(name: 'disableProcessingStatus')
      required final bool disableProcessingStatus,
      @JsonKey(name: 'currency') required final String currency,
      @JsonKey(name: 'hideCustomer', defaultValue: false)
      required final bool hideCustomer,
      @JsonKey(name: 'enableGimmickMaterial', defaultValue: false)
      required final bool enableGimmickMaterial,
      @JsonKey(name: 'disablePrincipals', defaultValue: false)
      required final bool disablePrincipals,
      @JsonKey(name: 'principalList')
      @_PrincipalListConverter()
      required final List<SalesOrganisationConfigsPrincipalDto> principalList,
      @JsonKey(name: 'disableOrderType', defaultValue: false)
      required final bool disableOrderType,
      @JsonKey(name: 'enableBatchNumber', defaultValue: false)
      required final bool enableBatchNumber,
      @JsonKey(name: 'disableBundles', defaultValue: false)
      required final bool disableBundles,
      @JsonKey(name: 'enableZDP5', defaultValue: false)
      required final bool enableZDP5,
      @JsonKey(name: 'enableTaxClassification', defaultValue: false)
      required final bool enableTaxClassification,
      @JsonKey(name: 'enableVat', defaultValue: false)
      required final bool enableVat,
      @JsonKey(name: 'vatValue', defaultValue: 0) required final int vatValue,
      @JsonKey(name: 'materialWithoutPrice', defaultValue: false)
      required final bool materialWithoutPrice,
      @JsonKey(name: 'enableSpecialInstructions', defaultValue: false)
      required final bool enableSpecialInstructions,
      @JsonKey(name: 'enableReferenceNote', defaultValue: false)
      required final bool enableReferenceNote,
      @JsonKey(name: 'enableCollectiveNumber', defaultValue: false)
      required final bool enableCollectiveNumber,
      @JsonKey(name: 'enableMobileNumber', defaultValue: false)
      required final bool enableMobileNumber,
      @JsonKey(name: 'enableFutureDeliveryDay', defaultValue: false)
      required final bool enableFutureDeliveryDay,
      @JsonKey(name: 'enablePOAttachmentRequired', defaultValue: false)
      required final bool enablePOAttachmentRequired,
      @JsonKey(name: 'enablePaymentTerms', defaultValue: false)
      required final bool enablePaymentTerms,
      @JsonKey(name: 'futureDeliveryDay', defaultValue: '')
      required final String futureDeliveryDay,
      @JsonKey(name: 'enableGMC', defaultValue: false)
      required final bool enableGMC,
      @JsonKey(name: 'enableListPrice', defaultValue: false)
      required final bool enableListPrice,
      @JsonKey(name: 'enableDefaultMD', defaultValue: false)
      required final bool enableDefaultMD,
      @JsonKey(name: 'priceOverride', defaultValue: false)
      required final bool priceOverride,
      @JsonKey(name: 'disablePaymentTermsDisplay', defaultValue: false)
      required final bool disablePaymentTermsDisplay,
      @JsonKey(name: 'disableDeliveryDate', defaultValue: false)
      required final bool disableDeliveryDate,
      @JsonKey(name: 'enableBillTo', defaultValue: false)
      required final bool enableBillTo,
      @JsonKey(name: 'showPOAttachment', defaultValue: false)
      required final bool showPOAttachment,
      @JsonKey(name: 'expiryDateDisplay', defaultValue: false)
      required final bool expiryDateDisplay,
      @JsonKey(name: 'hideStockDisplay', defaultValue: false)
      required final bool hideStockDisplay,
      @JsonKey(name: 'addOosMaterials', defaultValue: false)
      required final bool addOosMaterials,
      @JsonKey(name: 'oosValue', defaultValue: 0) required final int oosValue,
      @JsonKey(name: 'enableRemarks', defaultValue: false)
      required final bool enableRemarks,
      @JsonKey(name: 'enableOHPrice', defaultValue: true)
      required final bool enableOHPrice,
      @JsonKey(name: 'ponRequired', defaultValue: false)
      required final bool poNumberRequired,
      @JsonKey(name: 'enableIRN', defaultValue: false)
      required final bool enableIRN,
      @JsonKey(name: 'enableTaxDisplay', defaultValue: false)
      required final bool enableTaxDisplay,
      @JsonKey(name: 'enableTenderOrders', defaultValue: false)
      required final bool enableTenderOrders,
      @JsonKey(name: 'enableTaxAtTotalLevelOnly', defaultValue: false)
      required final bool enableTaxAtTotalLevelOnly,
      @JsonKey(name: 'netPriceOverride', defaultValue: false)
      required final bool netPriceOverride,
      @JsonKey(name: 'batchNumDisplay', defaultValue: false)
      required final bool batchNumDisplay,
      @JsonKey(name: 'displayOrderDiscount', defaultValue: false)
      required final bool displayOrderDiscount,
      @StringToDoubleConverter()
      @JsonKey(name: 'minOrderAmount', defaultValue: 0.0)
      required final double minOrderAmount,
      @JsonKey(name: 'salesOrgCode', defaultValue: '0')
      required final String salesOrg,
      @JsonKey(name: 'enableZDP8Override', defaultValue: false)
      required final bool enableZDP8Override,
      @JsonKey(name: 'disableReturnsAccessSR', defaultValue: false)
      required final bool disableReturnsAccessSR,
      @JsonKey(name: 'disableReturnsAccess', defaultValue: false)
      required final bool disableReturnsAccess,
      @JsonKey(name: 'disableOverrideFieldCustomer', defaultValue: false)
      required final bool disableOverrideFieldCustomer,
      @JsonKey(name: 'disableOverrideFieldSR', defaultValue: false)
      required final bool disableOverrideFieldSR,
      @JsonKey(name: 'enableGreenDelivery', defaultValue: false)
      required final bool enableGreenDelivery,
      @JsonKey(name: 'greenDeliveryDelayInDays', defaultValue: 2)
      required final int greenDeliveryDelayInDays,
      @JsonKey(name: 'enableComboDeals', defaultValue: false)
      required final bool enableComboDeals,
      @JsonKey(name: 'greenDeliveryUserRole', defaultValue: 0)
      required final int greenDeliveryUserRole,
      @JsonKey(name: 'comboDealsUserRole', defaultValue: 0)
      required final int comboDealsUserRole,
      @JsonKey(name: 'enableGMN', defaultValue: false)
      required final bool enableGMN,
      @JsonKey(name: 'displayItemTaxBreakdown', defaultValue: false)
      required final bool displayItemTaxBreakdown,
      @JsonKey(name: 'displaySubtotalTaxBreakdown', defaultValue: false)
      required final bool displaySubtotalTaxBreakdown,
      @JsonKey(name: 'disablePayment', defaultValue: false)
      required final bool disablePayment,
      @JsonKey(name: 'hideCredit', defaultValue: false)
      required final bool hideCredit,
      @JsonKey(name: 'allowReturnsOutsidePolicy', defaultValue: false)
      required final bool allowReturnsOutsidePolicy,
      @JsonKey(name: 'enableMarketPlace', defaultValue: false)
      required final bool enableMarketPlace,
      @StringToDoubleConverter()
      @JsonKey(name: 'mpMinOrderAmount', defaultValue: 0.0)
      required final double mpMinOrderAmount,
      @JsonKey(name: 'statementOfAccountEnabled', defaultValue: false)
      required final bool statementOfAccountEnabled,
      @JsonKey(name: 'enableSmallOrderFee', defaultValue: false)
      required final bool enableSmallOrderFee,
      @JsonKey(name: 'smallOrderFeeUserRoles', defaultValue: <String>[])
      required final List<String> smallOrderFeeUserRoles,
      @JsonKey(name: 'smallOrderFee', defaultValue: 0.0)
      required final double smallOrderFee,
      @JsonKey(name: 'movThreshold', defaultValue: 0.0)
      required final double movThreshold,
      @JsonKey(name: 'enableMPSmallOrderFee', defaultValue: false)
      required final bool enableMPSmallOrderFee,
      @JsonKey(name: 'mpSmallOrderFeeUserRoles', defaultValue: <String>[])
      required final List<String> mpSmallOrderFeeUserRoles,
      @JsonKey(name: 'mpSmallOrderFee', defaultValue: 0.0)
      required final double mpSmallOrderFee,
      @JsonKey(name: 'mpMovThreshold', defaultValue: 0.0)
      required final double mpMovThreshold,
      @JsonKey(name: 'orderTypes', defaultValue: [])
      required final List<SalesOrganisationConfigsOrderTypeDto> orderTypes,
      @JsonKey(
          name: 'authorizedExtSalesRep',
          defaultValue: <ExternalSalesRepresentativeInfoDto>[])
      required final List<ExternalSalesRepresentativeInfoDto>
          authorizedExtSalesRep,
      @JsonKey(name: 'disclaimer', defaultValue: '')
      required final String disclaimer,
      @JsonKey(name: 'enableDeliveryOptions', defaultValue: false)
      required final bool enableDeliveryOptions,
      @JsonKey(name: 'enableRequestDeliveryDate', defaultValue: false)
      required final bool enableRequestDeliveryDate,
      @JsonKey(name: 'enableSaturdayUrgentDelivery', defaultValue: false)
      required final bool enableSaturdayUrgentDelivery,
      @JsonKey(name: 'enableStandardDelivery', defaultValue: false)
      required final bool enableStandardDelivery,
      @JsonKey(name: 'enableTodayUrgentDelivery', defaultValue: false)
      required final bool enableTodayUrgentDelivery,
      @JsonKey(name: 'enableTomorrowUrgentDelivery', defaultValue: false)
      required final bool enableTomorrowUrgentDelivery,
      @JsonKey(name: 'enableUrgentDelivery', defaultValue: false)
      required final bool enableUrgentDelivery,
      @JsonKey(name: 'saturdayDeliveryFee', defaultValue: 0.0)
      required final double saturdayDeliveryFee,
      @JsonKey(name: 'selectableDeliveryDays', defaultValue: 0)
      required final int selectableDeliveryDays,
      @JsonKey(name: 'standardDeliveryDays', defaultValue: 0)
      required final int standardDeliveryDays,
      @JsonKey(name: 'todayDeliveryFee', defaultValue: 0.0)
      required final double todayDeliveryFee,
      @JsonKey(name: 'tomorrowDeliveryFee', defaultValue: 0.0)
      required final double tomorrowDeliveryFee,
      @JsonKey(name: 'poReferenceLength', defaultValue: 0)
      required final int poReferenceLength,
      @JsonKey(name: 'referenceNoteLength', defaultValue: 0)
      required final int referenceNoteLength,
      @JsonKey(name: 'showEZCSTickets', defaultValue: false)
      required final bool showEZCSTickets}) = _$SalesOrganisationConfigsDtoImpl;
  const _SalesOrganisationConfigsDto._() : super._();

  factory _SalesOrganisationConfigsDto.fromJson(Map<String, dynamic> json) =
      _$SalesOrganisationConfigsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'disableProcessingStatus')
  bool get disableProcessingStatus;
  @override
  @JsonKey(name: 'currency')
  String get currency;
  @override
  @JsonKey(name: 'hideCustomer', defaultValue: false)
  bool get hideCustomer;
  @override
  @JsonKey(name: 'enableGimmickMaterial', defaultValue: false)
  bool get enableGimmickMaterial;
  @override
  @JsonKey(name: 'disablePrincipals', defaultValue: false)
  bool get disablePrincipals;
  @override
  @JsonKey(name: 'principalList')
  @_PrincipalListConverter()
  List<SalesOrganisationConfigsPrincipalDto> get principalList;
  @override
  @JsonKey(name: 'disableOrderType', defaultValue: false)
  bool get disableOrderType;
  @override
  @JsonKey(name: 'enableBatchNumber', defaultValue: false)
  bool get enableBatchNumber;
  @override
  @JsonKey(name: 'disableBundles', defaultValue: false)
  bool get disableBundles;
  @override
  @JsonKey(name: 'enableZDP5', defaultValue: false)
  bool get enableZDP5;
  @override
  @JsonKey(name: 'enableTaxClassification', defaultValue: false)
  bool get enableTaxClassification;
  @override
  @JsonKey(name: 'enableVat', defaultValue: false)
  bool get enableVat;
  @override
  @JsonKey(name: 'vatValue', defaultValue: 0)
  int get vatValue;
  @override
  @JsonKey(name: 'materialWithoutPrice', defaultValue: false)
  bool get materialWithoutPrice;
  @override
  @JsonKey(name: 'enableSpecialInstructions', defaultValue: false)
  bool get enableSpecialInstructions;
  @override
  @JsonKey(name: 'enableReferenceNote', defaultValue: false)
  bool get enableReferenceNote;
  @override
  @JsonKey(name: 'enableCollectiveNumber', defaultValue: false)
  bool get enableCollectiveNumber;
  @override
  @JsonKey(name: 'enableMobileNumber', defaultValue: false)
  bool get enableMobileNumber;
  @override
  @JsonKey(name: 'enableFutureDeliveryDay', defaultValue: false)
  bool get enableFutureDeliveryDay;
  @override
  @JsonKey(name: 'enablePOAttachmentRequired', defaultValue: false)
  bool get enablePOAttachmentRequired;
  @override
  @JsonKey(name: 'enablePaymentTerms', defaultValue: false)
  bool get enablePaymentTerms;
  @override
  @JsonKey(name: 'futureDeliveryDay', defaultValue: '')
  String get futureDeliveryDay;
  @override
  @JsonKey(name: 'enableGMC', defaultValue: false)
  bool get enableGMC;
  @override
  @JsonKey(name: 'enableListPrice', defaultValue: false)
  bool get enableListPrice;
  @override
  @JsonKey(name: 'enableDefaultMD', defaultValue: false)
  bool get enableDefaultMD;
  @override
  @JsonKey(name: 'priceOverride', defaultValue: false)
  bool get priceOverride;
  @override
  @JsonKey(name: 'disablePaymentTermsDisplay', defaultValue: false)
  bool get disablePaymentTermsDisplay;
  @override
  @JsonKey(name: 'disableDeliveryDate', defaultValue: false)
  bool get disableDeliveryDate;
  @override
  @JsonKey(name: 'enableBillTo', defaultValue: false)
  bool get enableBillTo;
  @override
  @JsonKey(name: 'showPOAttachment', defaultValue: false)
  bool get showPOAttachment;
  @override
  @JsonKey(name: 'expiryDateDisplay', defaultValue: false)
  bool get expiryDateDisplay;
  @override
  @JsonKey(name: 'hideStockDisplay', defaultValue: false)
  bool get hideStockDisplay;
  @override
  @JsonKey(name: 'addOosMaterials', defaultValue: false)
  bool get addOosMaterials;
  @override
  @JsonKey(name: 'oosValue', defaultValue: 0)
  int get oosValue;
  @override
  @JsonKey(name: 'enableRemarks', defaultValue: false)
  bool get enableRemarks;
  @override
  @JsonKey(name: 'enableOHPrice', defaultValue: true)
  bool get enableOHPrice;
  @override
  @JsonKey(name: 'ponRequired', defaultValue: false)
  bool get poNumberRequired;
  @override
  @JsonKey(name: 'enableIRN', defaultValue: false)
  bool get enableIRN;
  @override
  @JsonKey(name: 'enableTaxDisplay', defaultValue: false)
  bool get enableTaxDisplay;
  @override
  @JsonKey(name: 'enableTenderOrders', defaultValue: false)
  bool get enableTenderOrders;
  @override
  @JsonKey(name: 'enableTaxAtTotalLevelOnly', defaultValue: false)
  bool get enableTaxAtTotalLevelOnly;
  @override
  @JsonKey(name: 'netPriceOverride', defaultValue: false)
  bool get netPriceOverride;
  @override
  @JsonKey(name: 'batchNumDisplay', defaultValue: false)
  bool get batchNumDisplay;
  @override
  @JsonKey(name: 'displayOrderDiscount', defaultValue: false)
  bool get displayOrderDiscount;
  @override
  @StringToDoubleConverter()
  @JsonKey(name: 'minOrderAmount', defaultValue: 0.0)
  double get minOrderAmount;
  @override
  @JsonKey(name: 'salesOrgCode', defaultValue: '0')
  String get salesOrg;
  @override
  @JsonKey(name: 'enableZDP8Override', defaultValue: false)
  bool get enableZDP8Override;
  @override
  @JsonKey(name: 'disableReturnsAccessSR', defaultValue: false)
  bool get disableReturnsAccessSR;
  @override
  @JsonKey(name: 'disableReturnsAccess', defaultValue: false)
  bool get disableReturnsAccess;
  @override
  @JsonKey(name: 'disableOverrideFieldCustomer', defaultValue: false)
  bool get disableOverrideFieldCustomer;
  @override
  @JsonKey(name: 'disableOverrideFieldSR', defaultValue: false)
  bool get disableOverrideFieldSR;
  @override
  @JsonKey(name: 'enableGreenDelivery', defaultValue: false)
  bool get enableGreenDelivery;
  @override
  @JsonKey(name: 'greenDeliveryDelayInDays', defaultValue: 2)
  int get greenDeliveryDelayInDays;
  @override
  @JsonKey(name: 'enableComboDeals', defaultValue: false)
  bool get enableComboDeals;
  @override
  @JsonKey(name: 'greenDeliveryUserRole', defaultValue: 0)
  int get greenDeliveryUserRole;
  @override
  @JsonKey(name: 'comboDealsUserRole', defaultValue: 0)
  int get comboDealsUserRole;
  @override
  @JsonKey(name: 'enableGMN', defaultValue: false)
  bool get enableGMN;
  @override
  @JsonKey(name: 'displayItemTaxBreakdown', defaultValue: false)
  bool get displayItemTaxBreakdown;
  @override
  @JsonKey(name: 'displaySubtotalTaxBreakdown', defaultValue: false)
  bool get displaySubtotalTaxBreakdown;
  @override
  @JsonKey(name: 'disablePayment', defaultValue: false)
  bool get disablePayment;
  @override
  @JsonKey(name: 'hideCredit', defaultValue: false)
  bool get hideCredit;
  @override
  @JsonKey(name: 'allowReturnsOutsidePolicy', defaultValue: false)
  bool get allowReturnsOutsidePolicy;
  @override
  @JsonKey(name: 'enableMarketPlace', defaultValue: false)
  bool get enableMarketPlace;
  @override
  @StringToDoubleConverter()
  @JsonKey(name: 'mpMinOrderAmount', defaultValue: 0.0)
  double get mpMinOrderAmount;
  @override
  @JsonKey(name: 'statementOfAccountEnabled', defaultValue: false)
  bool get statementOfAccountEnabled;
  @override
  @JsonKey(name: 'enableSmallOrderFee', defaultValue: false)
  bool get enableSmallOrderFee;
  @override
  @JsonKey(name: 'smallOrderFeeUserRoles', defaultValue: <String>[])
  List<String> get smallOrderFeeUserRoles;
  @override
  @JsonKey(name: 'smallOrderFee', defaultValue: 0.0)
  double get smallOrderFee;
  @override
  @JsonKey(name: 'movThreshold', defaultValue: 0.0)
  double get movThreshold;
  @override
  @JsonKey(name: 'enableMPSmallOrderFee', defaultValue: false)
  bool get enableMPSmallOrderFee;
  @override
  @JsonKey(name: 'mpSmallOrderFeeUserRoles', defaultValue: <String>[])
  List<String> get mpSmallOrderFeeUserRoles;
  @override
  @JsonKey(name: 'mpSmallOrderFee', defaultValue: 0.0)
  double get mpSmallOrderFee;
  @override
  @JsonKey(name: 'mpMovThreshold', defaultValue: 0.0)
  double get mpMovThreshold;
  @override
  @JsonKey(name: 'orderTypes', defaultValue: [])
  List<SalesOrganisationConfigsOrderTypeDto> get orderTypes;
  @override
  @JsonKey(
      name: 'authorizedExtSalesRep',
      defaultValue: <ExternalSalesRepresentativeInfoDto>[])
  List<ExternalSalesRepresentativeInfoDto> get authorizedExtSalesRep;
  @override
  @JsonKey(name: 'disclaimer', defaultValue: '')
  String get disclaimer;
  @override
  @JsonKey(name: 'enableDeliveryOptions', defaultValue: false)
  bool get enableDeliveryOptions;
  @override
  @JsonKey(name: 'enableRequestDeliveryDate', defaultValue: false)
  bool get enableRequestDeliveryDate;
  @override
  @JsonKey(name: 'enableSaturdayUrgentDelivery', defaultValue: false)
  bool get enableSaturdayUrgentDelivery;
  @override
  @JsonKey(name: 'enableStandardDelivery', defaultValue: false)
  bool get enableStandardDelivery;
  @override
  @JsonKey(name: 'enableTodayUrgentDelivery', defaultValue: false)
  bool get enableTodayUrgentDelivery;
  @override
  @JsonKey(name: 'enableTomorrowUrgentDelivery', defaultValue: false)
  bool get enableTomorrowUrgentDelivery;
  @override
  @JsonKey(name: 'enableUrgentDelivery', defaultValue: false)
  bool get enableUrgentDelivery;
  @override
  @JsonKey(name: 'saturdayDeliveryFee', defaultValue: 0.0)
  double get saturdayDeliveryFee;
  @override
  @JsonKey(name: 'selectableDeliveryDays', defaultValue: 0)
  int get selectableDeliveryDays;
  @override
  @JsonKey(name: 'standardDeliveryDays', defaultValue: 0)
  int get standardDeliveryDays;
  @override
  @JsonKey(name: 'todayDeliveryFee', defaultValue: 0.0)
  double get todayDeliveryFee;
  @override
  @JsonKey(name: 'tomorrowDeliveryFee', defaultValue: 0.0)
  double get tomorrowDeliveryFee;
  @override
  @JsonKey(name: 'poReferenceLength', defaultValue: 0)
  int get poReferenceLength;
  @override
  @JsonKey(name: 'referenceNoteLength', defaultValue: 0)
  int get referenceNoteLength;
  @override
  @JsonKey(name: 'showEZCSTickets', defaultValue: false)
  bool get showEZCSTickets;
  @override
  @JsonKey(ignore: true)
  _$$SalesOrganisationConfigsDtoImplCopyWith<_$SalesOrganisationConfigsDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
