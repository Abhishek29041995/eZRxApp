// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_ticket_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubmitTicketDto _$SubmitTicketDtoFromJson(Map<String, dynamic> json) {
  return _SubmitTicketDto.fromJson(json);
}

/// @nodoc
mixin _$SubmitTicketDto {
  @JsonKey(name: 'email', defaultValue: '')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'EZCSTicketDetail', defaultValue: '')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'priority', defaultValue: 0)
  int get priority => throw _privateConstructorUsedError;
  @JsonKey(name: 'subject', defaultValue: '')
  String get subject => throw _privateConstructorUsedError;
  @JsonKey(name: 'customField')
  SubmitTicketCustomFields get customFields =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubmitTicketDtoCopyWith<SubmitTicketDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitTicketDtoCopyWith<$Res> {
  factory $SubmitTicketDtoCopyWith(
          SubmitTicketDto value, $Res Function(SubmitTicketDto) then) =
      _$SubmitTicketDtoCopyWithImpl<$Res, SubmitTicketDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'email', defaultValue: '') String email,
      @JsonKey(name: 'EZCSTicketDetail', defaultValue: '') String description,
      @JsonKey(name: 'priority', defaultValue: 0) int priority,
      @JsonKey(name: 'subject', defaultValue: '') String subject,
      @JsonKey(name: 'customField') SubmitTicketCustomFields customFields});

  $SubmitTicketCustomFieldsCopyWith<$Res> get customFields;
}

/// @nodoc
class _$SubmitTicketDtoCopyWithImpl<$Res, $Val extends SubmitTicketDto>
    implements $SubmitTicketDtoCopyWith<$Res> {
  _$SubmitTicketDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? description = null,
    Object? priority = null,
    Object? subject = null,
    Object? customFields = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      customFields: null == customFields
          ? _value.customFields
          : customFields // ignore: cast_nullable_to_non_nullable
              as SubmitTicketCustomFields,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SubmitTicketCustomFieldsCopyWith<$Res> get customFields {
    return $SubmitTicketCustomFieldsCopyWith<$Res>(_value.customFields,
        (value) {
      return _then(_value.copyWith(customFields: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubmitTicketDtoImplCopyWith<$Res>
    implements $SubmitTicketDtoCopyWith<$Res> {
  factory _$$SubmitTicketDtoImplCopyWith(_$SubmitTicketDtoImpl value,
          $Res Function(_$SubmitTicketDtoImpl) then) =
      __$$SubmitTicketDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'email', defaultValue: '') String email,
      @JsonKey(name: 'EZCSTicketDetail', defaultValue: '') String description,
      @JsonKey(name: 'priority', defaultValue: 0) int priority,
      @JsonKey(name: 'subject', defaultValue: '') String subject,
      @JsonKey(name: 'customField') SubmitTicketCustomFields customFields});

  @override
  $SubmitTicketCustomFieldsCopyWith<$Res> get customFields;
}

/// @nodoc
class __$$SubmitTicketDtoImplCopyWithImpl<$Res>
    extends _$SubmitTicketDtoCopyWithImpl<$Res, _$SubmitTicketDtoImpl>
    implements _$$SubmitTicketDtoImplCopyWith<$Res> {
  __$$SubmitTicketDtoImplCopyWithImpl(
      _$SubmitTicketDtoImpl _value, $Res Function(_$SubmitTicketDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? description = null,
    Object? priority = null,
    Object? subject = null,
    Object? customFields = null,
  }) {
    return _then(_$SubmitTicketDtoImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      customFields: null == customFields
          ? _value.customFields
          : customFields // ignore: cast_nullable_to_non_nullable
              as SubmitTicketCustomFields,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubmitTicketDtoImpl extends _SubmitTicketDto {
  const _$SubmitTicketDtoImpl(
      {@JsonKey(name: 'email', defaultValue: '') required this.email,
      @JsonKey(name: 'EZCSTicketDetail', defaultValue: '')
      required this.description,
      @JsonKey(name: 'priority', defaultValue: 0) required this.priority,
      @JsonKey(name: 'subject', defaultValue: '') required this.subject,
      @JsonKey(name: 'customField')
      this.customFields = SubmitTicketCustomFields.empty})
      : super._();

  factory _$SubmitTicketDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubmitTicketDtoImplFromJson(json);

  @override
  @JsonKey(name: 'email', defaultValue: '')
  final String email;
  @override
  @JsonKey(name: 'EZCSTicketDetail', defaultValue: '')
  final String description;
  @override
  @JsonKey(name: 'priority', defaultValue: 0)
  final int priority;
  @override
  @JsonKey(name: 'subject', defaultValue: '')
  final String subject;
  @override
  @JsonKey(name: 'customField')
  final SubmitTicketCustomFields customFields;

  @override
  String toString() {
    return 'SubmitTicketDto(email: $email, description: $description, priority: $priority, subject: $subject, customFields: $customFields)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitTicketDtoImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.customFields, customFields) ||
                other.customFields == customFields));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, email, description, priority, subject, customFields);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitTicketDtoImplCopyWith<_$SubmitTicketDtoImpl> get copyWith =>
      __$$SubmitTicketDtoImplCopyWithImpl<_$SubmitTicketDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubmitTicketDtoImplToJson(
      this,
    );
  }
}

abstract class _SubmitTicketDto extends SubmitTicketDto {
  const factory _SubmitTicketDto(
      {@JsonKey(name: 'email', defaultValue: '') required final String email,
      @JsonKey(name: 'EZCSTicketDetail', defaultValue: '')
      required final String description,
      @JsonKey(name: 'priority', defaultValue: 0) required final int priority,
      @JsonKey(name: 'subject', defaultValue: '') required final String subject,
      @JsonKey(name: 'customField')
      final SubmitTicketCustomFields customFields}) = _$SubmitTicketDtoImpl;
  const _SubmitTicketDto._() : super._();

  factory _SubmitTicketDto.fromJson(Map<String, dynamic> json) =
      _$SubmitTicketDtoImpl.fromJson;

  @override
  @JsonKey(name: 'email', defaultValue: '')
  String get email;
  @override
  @JsonKey(name: 'EZCSTicketDetail', defaultValue: '')
  String get description;
  @override
  @JsonKey(name: 'priority', defaultValue: 0)
  int get priority;
  @override
  @JsonKey(name: 'subject', defaultValue: '')
  String get subject;
  @override
  @JsonKey(name: 'customField')
  SubmitTicketCustomFields get customFields;
  @override
  @JsonKey(ignore: true)
  _$$SubmitTicketDtoImplCopyWith<_$SubmitTicketDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubmitTicketCustomFields _$SubmitTicketCustomFieldsFromJson(
    Map<String, dynamic> json) {
  return _SubmitTicketCustomFields.fromJson(json);
}

/// @nodoc
mixin _$SubmitTicketCustomFields {
  @JsonKey(name: 'cf_customer_sold_to_account', defaultValue: '')
  String get soldTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'cf_customer_sold_to_account_name', defaultValue: '')
  String get soldToName => throw _privateConstructorUsedError;
  @JsonKey(name: 'cf_customer_ship_to_account', defaultValue: '')
  String get shipTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'cf_customer_ship_to_name', defaultValue: '')
  String get shipToName => throw _privateConstructorUsedError;
  @JsonKey(name: 'cf_cust_category', defaultValue: '')
  String get ticketCategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'cf_customer_ticket_type_sub_category', defaultValue: '')
  String get ticketSubCategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'cf_document_invoice_rcn_cn_1_document_only', defaultValue: '')
  String get orderNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'cf_qty_ordered452506', defaultValue: '')
  String get quantityOrdered => throw _privateConstructorUsedError;
  @JsonKey(name: 'cf_product_ordered_description', defaultValue: '')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'cf_product_sku_codes_must_be_from_same_manufacturer',
      defaultValue: '')
  String get productSku => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubmitTicketCustomFieldsCopyWith<SubmitTicketCustomFields> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitTicketCustomFieldsCopyWith<$Res> {
  factory $SubmitTicketCustomFieldsCopyWith(SubmitTicketCustomFields value,
          $Res Function(SubmitTicketCustomFields) then) =
      _$SubmitTicketCustomFieldsCopyWithImpl<$Res, SubmitTicketCustomFields>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cf_customer_sold_to_account', defaultValue: '')
      String soldTo,
      @JsonKey(name: 'cf_customer_sold_to_account_name', defaultValue: '')
      String soldToName,
      @JsonKey(name: 'cf_customer_ship_to_account', defaultValue: '')
      String shipTo,
      @JsonKey(name: 'cf_customer_ship_to_name', defaultValue: '')
      String shipToName,
      @JsonKey(name: 'cf_cust_category', defaultValue: '')
      String ticketCategory,
      @JsonKey(name: 'cf_customer_ticket_type_sub_category', defaultValue: '')
      String ticketSubCategory,
      @JsonKey(
          name: 'cf_document_invoice_rcn_cn_1_document_only', defaultValue: '')
      String orderNumber,
      @JsonKey(name: 'cf_qty_ordered452506', defaultValue: '')
      String quantityOrdered,
      @JsonKey(name: 'cf_product_ordered_description', defaultValue: '')
      String productName,
      @JsonKey(
          name: 'cf_product_sku_codes_must_be_from_same_manufacturer',
          defaultValue: '')
      String productSku});
}

/// @nodoc
class _$SubmitTicketCustomFieldsCopyWithImpl<$Res,
        $Val extends SubmitTicketCustomFields>
    implements $SubmitTicketCustomFieldsCopyWith<$Res> {
  _$SubmitTicketCustomFieldsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soldTo = null,
    Object? soldToName = null,
    Object? shipTo = null,
    Object? shipToName = null,
    Object? ticketCategory = null,
    Object? ticketSubCategory = null,
    Object? orderNumber = null,
    Object? quantityOrdered = null,
    Object? productName = null,
    Object? productSku = null,
  }) {
    return _then(_value.copyWith(
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      soldToName: null == soldToName
          ? _value.soldToName
          : soldToName // ignore: cast_nullable_to_non_nullable
              as String,
      shipTo: null == shipTo
          ? _value.shipTo
          : shipTo // ignore: cast_nullable_to_non_nullable
              as String,
      shipToName: null == shipToName
          ? _value.shipToName
          : shipToName // ignore: cast_nullable_to_non_nullable
              as String,
      ticketCategory: null == ticketCategory
          ? _value.ticketCategory
          : ticketCategory // ignore: cast_nullable_to_non_nullable
              as String,
      ticketSubCategory: null == ticketSubCategory
          ? _value.ticketSubCategory
          : ticketSubCategory // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      quantityOrdered: null == quantityOrdered
          ? _value.quantityOrdered
          : quantityOrdered // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productSku: null == productSku
          ? _value.productSku
          : productSku // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubmitTicketCustomFieldsImplCopyWith<$Res>
    implements $SubmitTicketCustomFieldsCopyWith<$Res> {
  factory _$$SubmitTicketCustomFieldsImplCopyWith(
          _$SubmitTicketCustomFieldsImpl value,
          $Res Function(_$SubmitTicketCustomFieldsImpl) then) =
      __$$SubmitTicketCustomFieldsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cf_customer_sold_to_account', defaultValue: '')
      String soldTo,
      @JsonKey(name: 'cf_customer_sold_to_account_name', defaultValue: '')
      String soldToName,
      @JsonKey(name: 'cf_customer_ship_to_account', defaultValue: '')
      String shipTo,
      @JsonKey(name: 'cf_customer_ship_to_name', defaultValue: '')
      String shipToName,
      @JsonKey(name: 'cf_cust_category', defaultValue: '')
      String ticketCategory,
      @JsonKey(name: 'cf_customer_ticket_type_sub_category', defaultValue: '')
      String ticketSubCategory,
      @JsonKey(
          name: 'cf_document_invoice_rcn_cn_1_document_only', defaultValue: '')
      String orderNumber,
      @JsonKey(name: 'cf_qty_ordered452506', defaultValue: '')
      String quantityOrdered,
      @JsonKey(name: 'cf_product_ordered_description', defaultValue: '')
      String productName,
      @JsonKey(
          name: 'cf_product_sku_codes_must_be_from_same_manufacturer',
          defaultValue: '')
      String productSku});
}

/// @nodoc
class __$$SubmitTicketCustomFieldsImplCopyWithImpl<$Res>
    extends _$SubmitTicketCustomFieldsCopyWithImpl<$Res,
        _$SubmitTicketCustomFieldsImpl>
    implements _$$SubmitTicketCustomFieldsImplCopyWith<$Res> {
  __$$SubmitTicketCustomFieldsImplCopyWithImpl(
      _$SubmitTicketCustomFieldsImpl _value,
      $Res Function(_$SubmitTicketCustomFieldsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soldTo = null,
    Object? soldToName = null,
    Object? shipTo = null,
    Object? shipToName = null,
    Object? ticketCategory = null,
    Object? ticketSubCategory = null,
    Object? orderNumber = null,
    Object? quantityOrdered = null,
    Object? productName = null,
    Object? productSku = null,
  }) {
    return _then(_$SubmitTicketCustomFieldsImpl(
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      soldToName: null == soldToName
          ? _value.soldToName
          : soldToName // ignore: cast_nullable_to_non_nullable
              as String,
      shipTo: null == shipTo
          ? _value.shipTo
          : shipTo // ignore: cast_nullable_to_non_nullable
              as String,
      shipToName: null == shipToName
          ? _value.shipToName
          : shipToName // ignore: cast_nullable_to_non_nullable
              as String,
      ticketCategory: null == ticketCategory
          ? _value.ticketCategory
          : ticketCategory // ignore: cast_nullable_to_non_nullable
              as String,
      ticketSubCategory: null == ticketSubCategory
          ? _value.ticketSubCategory
          : ticketSubCategory // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      quantityOrdered: null == quantityOrdered
          ? _value.quantityOrdered
          : quantityOrdered // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productSku: null == productSku
          ? _value.productSku
          : productSku // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubmitTicketCustomFieldsImpl extends _SubmitTicketCustomFields {
  const _$SubmitTicketCustomFieldsImpl(
      {@JsonKey(name: 'cf_customer_sold_to_account', defaultValue: '')
      required this.soldTo,
      @JsonKey(name: 'cf_customer_sold_to_account_name', defaultValue: '')
      required this.soldToName,
      @JsonKey(name: 'cf_customer_ship_to_account', defaultValue: '')
      required this.shipTo,
      @JsonKey(name: 'cf_customer_ship_to_name', defaultValue: '')
      required this.shipToName,
      @JsonKey(name: 'cf_cust_category', defaultValue: '')
      required this.ticketCategory,
      @JsonKey(name: 'cf_customer_ticket_type_sub_category', defaultValue: '')
      required this.ticketSubCategory,
      @JsonKey(
          name: 'cf_document_invoice_rcn_cn_1_document_only', defaultValue: '')
      required this.orderNumber,
      @JsonKey(name: 'cf_qty_ordered452506', defaultValue: '')
      required this.quantityOrdered,
      @JsonKey(name: 'cf_product_ordered_description', defaultValue: '')
      required this.productName,
      @JsonKey(
          name: 'cf_product_sku_codes_must_be_from_same_manufacturer',
          defaultValue: '')
      required this.productSku})
      : super._();

  factory _$SubmitTicketCustomFieldsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubmitTicketCustomFieldsImplFromJson(json);

  @override
  @JsonKey(name: 'cf_customer_sold_to_account', defaultValue: '')
  final String soldTo;
  @override
  @JsonKey(name: 'cf_customer_sold_to_account_name', defaultValue: '')
  final String soldToName;
  @override
  @JsonKey(name: 'cf_customer_ship_to_account', defaultValue: '')
  final String shipTo;
  @override
  @JsonKey(name: 'cf_customer_ship_to_name', defaultValue: '')
  final String shipToName;
  @override
  @JsonKey(name: 'cf_cust_category', defaultValue: '')
  final String ticketCategory;
  @override
  @JsonKey(name: 'cf_customer_ticket_type_sub_category', defaultValue: '')
  final String ticketSubCategory;
  @override
  @JsonKey(name: 'cf_document_invoice_rcn_cn_1_document_only', defaultValue: '')
  final String orderNumber;
  @override
  @JsonKey(name: 'cf_qty_ordered452506', defaultValue: '')
  final String quantityOrdered;
  @override
  @JsonKey(name: 'cf_product_ordered_description', defaultValue: '')
  final String productName;
  @override
  @JsonKey(
      name: 'cf_product_sku_codes_must_be_from_same_manufacturer',
      defaultValue: '')
  final String productSku;

  @override
  String toString() {
    return 'SubmitTicketCustomFields(soldTo: $soldTo, soldToName: $soldToName, shipTo: $shipTo, shipToName: $shipToName, ticketCategory: $ticketCategory, ticketSubCategory: $ticketSubCategory, orderNumber: $orderNumber, quantityOrdered: $quantityOrdered, productName: $productName, productSku: $productSku)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitTicketCustomFieldsImpl &&
            (identical(other.soldTo, soldTo) || other.soldTo == soldTo) &&
            (identical(other.soldToName, soldToName) ||
                other.soldToName == soldToName) &&
            (identical(other.shipTo, shipTo) || other.shipTo == shipTo) &&
            (identical(other.shipToName, shipToName) ||
                other.shipToName == shipToName) &&
            (identical(other.ticketCategory, ticketCategory) ||
                other.ticketCategory == ticketCategory) &&
            (identical(other.ticketSubCategory, ticketSubCategory) ||
                other.ticketSubCategory == ticketSubCategory) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.quantityOrdered, quantityOrdered) ||
                other.quantityOrdered == quantityOrdered) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productSku, productSku) ||
                other.productSku == productSku));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      soldTo,
      soldToName,
      shipTo,
      shipToName,
      ticketCategory,
      ticketSubCategory,
      orderNumber,
      quantityOrdered,
      productName,
      productSku);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitTicketCustomFieldsImplCopyWith<_$SubmitTicketCustomFieldsImpl>
      get copyWith => __$$SubmitTicketCustomFieldsImplCopyWithImpl<
          _$SubmitTicketCustomFieldsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubmitTicketCustomFieldsImplToJson(
      this,
    );
  }
}

abstract class _SubmitTicketCustomFields extends SubmitTicketCustomFields {
  const factory _SubmitTicketCustomFields(
      {@JsonKey(name: 'cf_customer_sold_to_account', defaultValue: '')
      required final String soldTo,
      @JsonKey(name: 'cf_customer_sold_to_account_name', defaultValue: '')
      required final String soldToName,
      @JsonKey(name: 'cf_customer_ship_to_account', defaultValue: '')
      required final String shipTo,
      @JsonKey(name: 'cf_customer_ship_to_name', defaultValue: '')
      required final String shipToName,
      @JsonKey(name: 'cf_cust_category', defaultValue: '')
      required final String ticketCategory,
      @JsonKey(name: 'cf_customer_ticket_type_sub_category', defaultValue: '')
      required final String ticketSubCategory,
      @JsonKey(
          name: 'cf_document_invoice_rcn_cn_1_document_only', defaultValue: '')
      required final String orderNumber,
      @JsonKey(name: 'cf_qty_ordered452506', defaultValue: '')
      required final String quantityOrdered,
      @JsonKey(name: 'cf_product_ordered_description', defaultValue: '')
      required final String productName,
      @JsonKey(
          name: 'cf_product_sku_codes_must_be_from_same_manufacturer',
          defaultValue: '')
      required final String productSku}) = _$SubmitTicketCustomFieldsImpl;
  const _SubmitTicketCustomFields._() : super._();

  factory _SubmitTicketCustomFields.fromJson(Map<String, dynamic> json) =
      _$SubmitTicketCustomFieldsImpl.fromJson;

  @override
  @JsonKey(name: 'cf_customer_sold_to_account', defaultValue: '')
  String get soldTo;
  @override
  @JsonKey(name: 'cf_customer_sold_to_account_name', defaultValue: '')
  String get soldToName;
  @override
  @JsonKey(name: 'cf_customer_ship_to_account', defaultValue: '')
  String get shipTo;
  @override
  @JsonKey(name: 'cf_customer_ship_to_name', defaultValue: '')
  String get shipToName;
  @override
  @JsonKey(name: 'cf_cust_category', defaultValue: '')
  String get ticketCategory;
  @override
  @JsonKey(name: 'cf_customer_ticket_type_sub_category', defaultValue: '')
  String get ticketSubCategory;
  @override
  @JsonKey(name: 'cf_document_invoice_rcn_cn_1_document_only', defaultValue: '')
  String get orderNumber;
  @override
  @JsonKey(name: 'cf_qty_ordered452506', defaultValue: '')
  String get quantityOrdered;
  @override
  @JsonKey(name: 'cf_product_ordered_description', defaultValue: '')
  String get productName;
  @override
  @JsonKey(
      name: 'cf_product_sku_codes_must_be_from_same_manufacturer',
      defaultValue: '')
  String get productSku;
  @override
  @JsonKey(ignore: true)
  _$$SubmitTicketCustomFieldsImplCopyWith<_$SubmitTicketCustomFieldsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
