// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_by_item_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ViewByItemRequestDto _$ViewByItemRequestDtoFromJson(Map<String, dynamic> json) {
  return _ViewByItemRequestDto.fromJson(json);
}

/// @nodoc
mixin _$ViewByItemRequestDto {
  @JsonKey(name: 'salesOrg', defaultValue: <String>[])
  List<String> get salesOrg => throw _privateConstructorUsedError;
  @JsonKey(name: 'soldTo', defaultValue: '')
  String get soldTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipTo', defaultValue: <String>[])
  List<String> get shipTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'first', defaultValue: 0)
  int get pageSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'after', defaultValue: 0)
  int get offset => throw _privateConstructorUsedError;
  @JsonKey(name: 'language', defaultValue: '')
  String get language => throw _privateConstructorUsedError;
  @JsonKey(name: 'searchKey', defaultValue: '')
  String get searchKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderNumber', defaultValue: '')
  String get orderNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderStatus', defaultValue: <String>[])
  List<String> get orderStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'toDate', defaultValue: '')
  String get dateTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'fromDate', defaultValue: '')
  String get dateFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'isOptimised', defaultValue: true)
  bool get isOptimised => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderType', includeIfNull: false)
  int? get orderType => throw _privateConstructorUsedError;
  @JsonKey(name: 'isDetailsPage', defaultValue: false)
  bool get isDetailsPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ViewByItemRequestDtoCopyWith<ViewByItemRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByItemRequestDtoCopyWith<$Res> {
  factory $ViewByItemRequestDtoCopyWith(ViewByItemRequestDto value,
          $Res Function(ViewByItemRequestDto) then) =
      _$ViewByItemRequestDtoCopyWithImpl<$Res, ViewByItemRequestDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'salesOrg', defaultValue: <String>[])
      List<String> salesOrg,
      @JsonKey(name: 'soldTo', defaultValue: '') String soldTo,
      @JsonKey(name: 'shipTo', defaultValue: <String>[]) List<String> shipTo,
      @JsonKey(name: 'first', defaultValue: 0) int pageSize,
      @JsonKey(name: 'after', defaultValue: 0) int offset,
      @JsonKey(name: 'language', defaultValue: '') String language,
      @JsonKey(name: 'searchKey', defaultValue: '') String searchKey,
      @JsonKey(name: 'orderNumber', defaultValue: '') String orderNumber,
      @JsonKey(name: 'orderStatus', defaultValue: <String>[])
      List<String> orderStatus,
      @JsonKey(name: 'toDate', defaultValue: '') String dateTo,
      @JsonKey(name: 'fromDate', defaultValue: '') String dateFrom,
      @JsonKey(name: 'isOptimised', defaultValue: true) bool isOptimised,
      @JsonKey(name: 'orderType', includeIfNull: false) int? orderType,
      @JsonKey(name: 'isDetailsPage', defaultValue: false) bool isDetailsPage});
}

/// @nodoc
class _$ViewByItemRequestDtoCopyWithImpl<$Res,
        $Val extends ViewByItemRequestDto>
    implements $ViewByItemRequestDtoCopyWith<$Res> {
  _$ViewByItemRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? soldTo = null,
    Object? shipTo = null,
    Object? pageSize = null,
    Object? offset = null,
    Object? language = null,
    Object? searchKey = null,
    Object? orderNumber = null,
    Object? orderStatus = null,
    Object? dateTo = null,
    Object? dateFrom = null,
    Object? isOptimised = null,
    Object? orderType = freezed,
    Object? isDetailsPage = null,
  }) {
    return _then(_value.copyWith(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as List<String>,
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      shipTo: null == shipTo
          ? _value.shipTo
          : shipTo // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dateTo: null == dateTo
          ? _value.dateTo
          : dateTo // ignore: cast_nullable_to_non_nullable
              as String,
      dateFrom: null == dateFrom
          ? _value.dateFrom
          : dateFrom // ignore: cast_nullable_to_non_nullable
              as String,
      isOptimised: null == isOptimised
          ? _value.isOptimised
          : isOptimised // ignore: cast_nullable_to_non_nullable
              as bool,
      orderType: freezed == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as int?,
      isDetailsPage: null == isDetailsPage
          ? _value.isDetailsPage
          : isDetailsPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ViewByItemRequestDtoImplCopyWith<$Res>
    implements $ViewByItemRequestDtoCopyWith<$Res> {
  factory _$$ViewByItemRequestDtoImplCopyWith(_$ViewByItemRequestDtoImpl value,
          $Res Function(_$ViewByItemRequestDtoImpl) then) =
      __$$ViewByItemRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'salesOrg', defaultValue: <String>[])
      List<String> salesOrg,
      @JsonKey(name: 'soldTo', defaultValue: '') String soldTo,
      @JsonKey(name: 'shipTo', defaultValue: <String>[]) List<String> shipTo,
      @JsonKey(name: 'first', defaultValue: 0) int pageSize,
      @JsonKey(name: 'after', defaultValue: 0) int offset,
      @JsonKey(name: 'language', defaultValue: '') String language,
      @JsonKey(name: 'searchKey', defaultValue: '') String searchKey,
      @JsonKey(name: 'orderNumber', defaultValue: '') String orderNumber,
      @JsonKey(name: 'orderStatus', defaultValue: <String>[])
      List<String> orderStatus,
      @JsonKey(name: 'toDate', defaultValue: '') String dateTo,
      @JsonKey(name: 'fromDate', defaultValue: '') String dateFrom,
      @JsonKey(name: 'isOptimised', defaultValue: true) bool isOptimised,
      @JsonKey(name: 'orderType', includeIfNull: false) int? orderType,
      @JsonKey(name: 'isDetailsPage', defaultValue: false) bool isDetailsPage});
}

/// @nodoc
class __$$ViewByItemRequestDtoImplCopyWithImpl<$Res>
    extends _$ViewByItemRequestDtoCopyWithImpl<$Res, _$ViewByItemRequestDtoImpl>
    implements _$$ViewByItemRequestDtoImplCopyWith<$Res> {
  __$$ViewByItemRequestDtoImplCopyWithImpl(_$ViewByItemRequestDtoImpl _value,
      $Res Function(_$ViewByItemRequestDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? soldTo = null,
    Object? shipTo = null,
    Object? pageSize = null,
    Object? offset = null,
    Object? language = null,
    Object? searchKey = null,
    Object? orderNumber = null,
    Object? orderStatus = null,
    Object? dateTo = null,
    Object? dateFrom = null,
    Object? isOptimised = null,
    Object? orderType = freezed,
    Object? isDetailsPage = null,
  }) {
    return _then(_$ViewByItemRequestDtoImpl(
      salesOrg: null == salesOrg
          ? _value._salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as List<String>,
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      shipTo: null == shipTo
          ? _value._shipTo
          : shipTo // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: null == orderStatus
          ? _value._orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dateTo: null == dateTo
          ? _value.dateTo
          : dateTo // ignore: cast_nullable_to_non_nullable
              as String,
      dateFrom: null == dateFrom
          ? _value.dateFrom
          : dateFrom // ignore: cast_nullable_to_non_nullable
              as String,
      isOptimised: null == isOptimised
          ? _value.isOptimised
          : isOptimised // ignore: cast_nullable_to_non_nullable
              as bool,
      orderType: freezed == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as int?,
      isDetailsPage: null == isDetailsPage
          ? _value.isDetailsPage
          : isDetailsPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ViewByItemRequestDtoImpl extends _ViewByItemRequestDto {
  const _$ViewByItemRequestDtoImpl(
      {@JsonKey(name: 'salesOrg', defaultValue: <String>[])
      required final List<String> salesOrg,
      @JsonKey(name: 'soldTo', defaultValue: '') required this.soldTo,
      @JsonKey(name: 'shipTo', defaultValue: <String>[])
      required final List<String> shipTo,
      @JsonKey(name: 'first', defaultValue: 0) required this.pageSize,
      @JsonKey(name: 'after', defaultValue: 0) required this.offset,
      @JsonKey(name: 'language', defaultValue: '') required this.language,
      @JsonKey(name: 'searchKey', defaultValue: '') required this.searchKey,
      @JsonKey(name: 'orderNumber', defaultValue: '') required this.orderNumber,
      @JsonKey(name: 'orderStatus', defaultValue: <String>[])
      required final List<String> orderStatus,
      @JsonKey(name: 'toDate', defaultValue: '') required this.dateTo,
      @JsonKey(name: 'fromDate', defaultValue: '') required this.dateFrom,
      @JsonKey(name: 'isOptimised', defaultValue: true)
      required this.isOptimised,
      @JsonKey(name: 'orderType', includeIfNull: false) this.orderType,
      @JsonKey(name: 'isDetailsPage', defaultValue: false)
      required this.isDetailsPage})
      : _salesOrg = salesOrg,
        _shipTo = shipTo,
        _orderStatus = orderStatus,
        super._();

  factory _$ViewByItemRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ViewByItemRequestDtoImplFromJson(json);

  final List<String> _salesOrg;
  @override
  @JsonKey(name: 'salesOrg', defaultValue: <String>[])
  List<String> get salesOrg {
    if (_salesOrg is EqualUnmodifiableListView) return _salesOrg;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_salesOrg);
  }

  @override
  @JsonKey(name: 'soldTo', defaultValue: '')
  final String soldTo;
  final List<String> _shipTo;
  @override
  @JsonKey(name: 'shipTo', defaultValue: <String>[])
  List<String> get shipTo {
    if (_shipTo is EqualUnmodifiableListView) return _shipTo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shipTo);
  }

  @override
  @JsonKey(name: 'first', defaultValue: 0)
  final int pageSize;
  @override
  @JsonKey(name: 'after', defaultValue: 0)
  final int offset;
  @override
  @JsonKey(name: 'language', defaultValue: '')
  final String language;
  @override
  @JsonKey(name: 'searchKey', defaultValue: '')
  final String searchKey;
  @override
  @JsonKey(name: 'orderNumber', defaultValue: '')
  final String orderNumber;
  final List<String> _orderStatus;
  @override
  @JsonKey(name: 'orderStatus', defaultValue: <String>[])
  List<String> get orderStatus {
    if (_orderStatus is EqualUnmodifiableListView) return _orderStatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderStatus);
  }

  @override
  @JsonKey(name: 'toDate', defaultValue: '')
  final String dateTo;
  @override
  @JsonKey(name: 'fromDate', defaultValue: '')
  final String dateFrom;
  @override
  @JsonKey(name: 'isOptimised', defaultValue: true)
  final bool isOptimised;
  @override
  @JsonKey(name: 'orderType', includeIfNull: false)
  final int? orderType;
  @override
  @JsonKey(name: 'isDetailsPage', defaultValue: false)
  final bool isDetailsPage;

  @override
  String toString() {
    return 'ViewByItemRequestDto(salesOrg: $salesOrg, soldTo: $soldTo, shipTo: $shipTo, pageSize: $pageSize, offset: $offset, language: $language, searchKey: $searchKey, orderNumber: $orderNumber, orderStatus: $orderStatus, dateTo: $dateTo, dateFrom: $dateFrom, isOptimised: $isOptimised, orderType: $orderType, isDetailsPage: $isDetailsPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewByItemRequestDtoImpl &&
            const DeepCollectionEquality().equals(other._salesOrg, _salesOrg) &&
            (identical(other.soldTo, soldTo) || other.soldTo == soldTo) &&
            const DeepCollectionEquality().equals(other._shipTo, _shipTo) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            const DeepCollectionEquality()
                .equals(other._orderStatus, _orderStatus) &&
            (identical(other.dateTo, dateTo) || other.dateTo == dateTo) &&
            (identical(other.dateFrom, dateFrom) ||
                other.dateFrom == dateFrom) &&
            (identical(other.isOptimised, isOptimised) ||
                other.isOptimised == isOptimised) &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType) &&
            (identical(other.isDetailsPage, isDetailsPage) ||
                other.isDetailsPage == isDetailsPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_salesOrg),
      soldTo,
      const DeepCollectionEquality().hash(_shipTo),
      pageSize,
      offset,
      language,
      searchKey,
      orderNumber,
      const DeepCollectionEquality().hash(_orderStatus),
      dateTo,
      dateFrom,
      isOptimised,
      orderType,
      isDetailsPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewByItemRequestDtoImplCopyWith<_$ViewByItemRequestDtoImpl>
      get copyWith =>
          __$$ViewByItemRequestDtoImplCopyWithImpl<_$ViewByItemRequestDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ViewByItemRequestDtoImplToJson(
      this,
    );
  }
}

abstract class _ViewByItemRequestDto extends ViewByItemRequestDto {
  const factory _ViewByItemRequestDto(
      {@JsonKey(name: 'salesOrg', defaultValue: <String>[])
      required final List<String> salesOrg,
      @JsonKey(name: 'soldTo', defaultValue: '') required final String soldTo,
      @JsonKey(name: 'shipTo', defaultValue: <String>[])
      required final List<String> shipTo,
      @JsonKey(name: 'first', defaultValue: 0) required final int pageSize,
      @JsonKey(name: 'after', defaultValue: 0) required final int offset,
      @JsonKey(name: 'language', defaultValue: '')
      required final String language,
      @JsonKey(name: 'searchKey', defaultValue: '')
      required final String searchKey,
      @JsonKey(name: 'orderNumber', defaultValue: '')
      required final String orderNumber,
      @JsonKey(name: 'orderStatus', defaultValue: <String>[])
      required final List<String> orderStatus,
      @JsonKey(name: 'toDate', defaultValue: '') required final String dateTo,
      @JsonKey(name: 'fromDate', defaultValue: '')
      required final String dateFrom,
      @JsonKey(name: 'isOptimised', defaultValue: true)
      required final bool isOptimised,
      @JsonKey(name: 'orderType', includeIfNull: false) final int? orderType,
      @JsonKey(name: 'isDetailsPage', defaultValue: false)
      required final bool isDetailsPage}) = _$ViewByItemRequestDtoImpl;
  const _ViewByItemRequestDto._() : super._();

  factory _ViewByItemRequestDto.fromJson(Map<String, dynamic> json) =
      _$ViewByItemRequestDtoImpl.fromJson;

  @override
  @JsonKey(name: 'salesOrg', defaultValue: <String>[])
  List<String> get salesOrg;
  @override
  @JsonKey(name: 'soldTo', defaultValue: '')
  String get soldTo;
  @override
  @JsonKey(name: 'shipTo', defaultValue: <String>[])
  List<String> get shipTo;
  @override
  @JsonKey(name: 'first', defaultValue: 0)
  int get pageSize;
  @override
  @JsonKey(name: 'after', defaultValue: 0)
  int get offset;
  @override
  @JsonKey(name: 'language', defaultValue: '')
  String get language;
  @override
  @JsonKey(name: 'searchKey', defaultValue: '')
  String get searchKey;
  @override
  @JsonKey(name: 'orderNumber', defaultValue: '')
  String get orderNumber;
  @override
  @JsonKey(name: 'orderStatus', defaultValue: <String>[])
  List<String> get orderStatus;
  @override
  @JsonKey(name: 'toDate', defaultValue: '')
  String get dateTo;
  @override
  @JsonKey(name: 'fromDate', defaultValue: '')
  String get dateFrom;
  @override
  @JsonKey(name: 'isOptimised', defaultValue: true)
  bool get isOptimised;
  @override
  @JsonKey(name: 'orderType', includeIfNull: false)
  int? get orderType;
  @override
  @JsonKey(name: 'isDetailsPage', defaultValue: false)
  bool get isDetailsPage;
  @override
  @JsonKey(ignore: true)
  _$$ViewByItemRequestDtoImplCopyWith<_$ViewByItemRequestDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
