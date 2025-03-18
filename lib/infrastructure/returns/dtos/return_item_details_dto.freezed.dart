// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_item_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReturnItemDetailsDto _$ReturnItemDetailsDtoFromJson(Map<String, dynamic> json) {
  return _ReturnItemDetailsDto.fromJson(json);
}

/// @nodoc
mixin _$ReturnItemDetailsDto {
  @JsonKey(name: 'returnQuantity', defaultValue: 0)
  int get returnQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'lineNumber', defaultValue: '')
  String get lineNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch', defaultValue: '')
  String get batch => throw _privateConstructorUsedError;
  @JsonKey(name: 'returnReason', defaultValue: '')
  String get returnReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'url', defaultValue: [])
  List<String> get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'returnType', defaultValue: '')
  String get returnType => throw _privateConstructorUsedError;
  @JsonKey(name: 'remarks', defaultValue: '')
  String get remarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'outsidePolicy', defaultValue: false)
  bool get outsidePolicy => throw _privateConstructorUsedError;
  @JsonKey(name: 'priceOverride', defaultValue: '')
  String get priceOverride => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReturnItemDetailsDtoCopyWith<ReturnItemDetailsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnItemDetailsDtoCopyWith<$Res> {
  factory $ReturnItemDetailsDtoCopyWith(ReturnItemDetailsDto value,
          $Res Function(ReturnItemDetailsDto) then) =
      _$ReturnItemDetailsDtoCopyWithImpl<$Res, ReturnItemDetailsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'returnQuantity', defaultValue: 0) int returnQuantity,
      @JsonKey(name: 'materialNumber', defaultValue: '') String materialNumber,
      @JsonKey(name: 'lineNumber', defaultValue: '') String lineNumber,
      @JsonKey(name: 'batch', defaultValue: '') String batch,
      @JsonKey(name: 'returnReason', defaultValue: '') String returnReason,
      @JsonKey(name: 'url', defaultValue: []) List<String> url,
      @JsonKey(name: 'returnType', defaultValue: '') String returnType,
      @JsonKey(name: 'remarks', defaultValue: '') String remarks,
      @JsonKey(name: 'outsidePolicy', defaultValue: false) bool outsidePolicy,
      @JsonKey(name: 'priceOverride', defaultValue: '') String priceOverride});
}

/// @nodoc
class _$ReturnItemDetailsDtoCopyWithImpl<$Res,
        $Val extends ReturnItemDetailsDto>
    implements $ReturnItemDetailsDtoCopyWith<$Res> {
  _$ReturnItemDetailsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnQuantity = null,
    Object? materialNumber = null,
    Object? lineNumber = null,
    Object? batch = null,
    Object? returnReason = null,
    Object? url = null,
    Object? returnType = null,
    Object? remarks = null,
    Object? outsidePolicy = null,
    Object? priceOverride = null,
  }) {
    return _then(_value.copyWith(
      returnQuantity: null == returnQuantity
          ? _value.returnQuantity
          : returnQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      returnReason: null == returnReason
          ? _value.returnReason
          : returnReason // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as List<String>,
      returnType: null == returnType
          ? _value.returnType
          : returnType // ignore: cast_nullable_to_non_nullable
              as String,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      outsidePolicy: null == outsidePolicy
          ? _value.outsidePolicy
          : outsidePolicy // ignore: cast_nullable_to_non_nullable
              as bool,
      priceOverride: null == priceOverride
          ? _value.priceOverride
          : priceOverride // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReturnItemDetailsDtoImplCopyWith<$Res>
    implements $ReturnItemDetailsDtoCopyWith<$Res> {
  factory _$$ReturnItemDetailsDtoImplCopyWith(_$ReturnItemDetailsDtoImpl value,
          $Res Function(_$ReturnItemDetailsDtoImpl) then) =
      __$$ReturnItemDetailsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'returnQuantity', defaultValue: 0) int returnQuantity,
      @JsonKey(name: 'materialNumber', defaultValue: '') String materialNumber,
      @JsonKey(name: 'lineNumber', defaultValue: '') String lineNumber,
      @JsonKey(name: 'batch', defaultValue: '') String batch,
      @JsonKey(name: 'returnReason', defaultValue: '') String returnReason,
      @JsonKey(name: 'url', defaultValue: []) List<String> url,
      @JsonKey(name: 'returnType', defaultValue: '') String returnType,
      @JsonKey(name: 'remarks', defaultValue: '') String remarks,
      @JsonKey(name: 'outsidePolicy', defaultValue: false) bool outsidePolicy,
      @JsonKey(name: 'priceOverride', defaultValue: '') String priceOverride});
}

/// @nodoc
class __$$ReturnItemDetailsDtoImplCopyWithImpl<$Res>
    extends _$ReturnItemDetailsDtoCopyWithImpl<$Res, _$ReturnItemDetailsDtoImpl>
    implements _$$ReturnItemDetailsDtoImplCopyWith<$Res> {
  __$$ReturnItemDetailsDtoImplCopyWithImpl(_$ReturnItemDetailsDtoImpl _value,
      $Res Function(_$ReturnItemDetailsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnQuantity = null,
    Object? materialNumber = null,
    Object? lineNumber = null,
    Object? batch = null,
    Object? returnReason = null,
    Object? url = null,
    Object? returnType = null,
    Object? remarks = null,
    Object? outsidePolicy = null,
    Object? priceOverride = null,
  }) {
    return _then(_$ReturnItemDetailsDtoImpl(
      returnQuantity: null == returnQuantity
          ? _value.returnQuantity
          : returnQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      returnReason: null == returnReason
          ? _value.returnReason
          : returnReason // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value._url
          : url // ignore: cast_nullable_to_non_nullable
              as List<String>,
      returnType: null == returnType
          ? _value.returnType
          : returnType // ignore: cast_nullable_to_non_nullable
              as String,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      outsidePolicy: null == outsidePolicy
          ? _value.outsidePolicy
          : outsidePolicy // ignore: cast_nullable_to_non_nullable
              as bool,
      priceOverride: null == priceOverride
          ? _value.priceOverride
          : priceOverride // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReturnItemDetailsDtoImpl extends _ReturnItemDetailsDto {
  const _$ReturnItemDetailsDtoImpl(
      {@JsonKey(name: 'returnQuantity', defaultValue: 0)
      required this.returnQuantity,
      @JsonKey(name: 'materialNumber', defaultValue: '')
      required this.materialNumber,
      @JsonKey(name: 'lineNumber', defaultValue: '') required this.lineNumber,
      @JsonKey(name: 'batch', defaultValue: '') required this.batch,
      @JsonKey(name: 'returnReason', defaultValue: '')
      required this.returnReason,
      @JsonKey(name: 'url', defaultValue: []) required final List<String> url,
      @JsonKey(name: 'returnType', defaultValue: '') required this.returnType,
      @JsonKey(name: 'remarks', defaultValue: '') required this.remarks,
      @JsonKey(name: 'outsidePolicy', defaultValue: false)
      required this.outsidePolicy,
      @JsonKey(name: 'priceOverride', defaultValue: '')
      required this.priceOverride})
      : _url = url,
        super._();

  factory _$ReturnItemDetailsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReturnItemDetailsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'returnQuantity', defaultValue: 0)
  final int returnQuantity;
  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'lineNumber', defaultValue: '')
  final String lineNumber;
  @override
  @JsonKey(name: 'batch', defaultValue: '')
  final String batch;
  @override
  @JsonKey(name: 'returnReason', defaultValue: '')
  final String returnReason;
  final List<String> _url;
  @override
  @JsonKey(name: 'url', defaultValue: [])
  List<String> get url {
    if (_url is EqualUnmodifiableListView) return _url;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_url);
  }

  @override
  @JsonKey(name: 'returnType', defaultValue: '')
  final String returnType;
  @override
  @JsonKey(name: 'remarks', defaultValue: '')
  final String remarks;
  @override
  @JsonKey(name: 'outsidePolicy', defaultValue: false)
  final bool outsidePolicy;
  @override
  @JsonKey(name: 'priceOverride', defaultValue: '')
  final String priceOverride;

  @override
  String toString() {
    return 'ReturnItemDetailsDto(returnQuantity: $returnQuantity, materialNumber: $materialNumber, lineNumber: $lineNumber, batch: $batch, returnReason: $returnReason, url: $url, returnType: $returnType, remarks: $remarks, outsidePolicy: $outsidePolicy, priceOverride: $priceOverride)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnItemDetailsDtoImpl &&
            (identical(other.returnQuantity, returnQuantity) ||
                other.returnQuantity == returnQuantity) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.lineNumber, lineNumber) ||
                other.lineNumber == lineNumber) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.returnReason, returnReason) ||
                other.returnReason == returnReason) &&
            const DeepCollectionEquality().equals(other._url, _url) &&
            (identical(other.returnType, returnType) ||
                other.returnType == returnType) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.outsidePolicy, outsidePolicy) ||
                other.outsidePolicy == outsidePolicy) &&
            (identical(other.priceOverride, priceOverride) ||
                other.priceOverride == priceOverride));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      returnQuantity,
      materialNumber,
      lineNumber,
      batch,
      returnReason,
      const DeepCollectionEquality().hash(_url),
      returnType,
      remarks,
      outsidePolicy,
      priceOverride);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReturnItemDetailsDtoImplCopyWith<_$ReturnItemDetailsDtoImpl>
      get copyWith =>
          __$$ReturnItemDetailsDtoImplCopyWithImpl<_$ReturnItemDetailsDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReturnItemDetailsDtoImplToJson(
      this,
    );
  }
}

abstract class _ReturnItemDetailsDto extends ReturnItemDetailsDto {
  const factory _ReturnItemDetailsDto(
      {@JsonKey(name: 'returnQuantity', defaultValue: 0)
      required final int returnQuantity,
      @JsonKey(name: 'materialNumber', defaultValue: '')
      required final String materialNumber,
      @JsonKey(name: 'lineNumber', defaultValue: '')
      required final String lineNumber,
      @JsonKey(name: 'batch', defaultValue: '') required final String batch,
      @JsonKey(name: 'returnReason', defaultValue: '')
      required final String returnReason,
      @JsonKey(name: 'url', defaultValue: []) required final List<String> url,
      @JsonKey(name: 'returnType', defaultValue: '')
      required final String returnType,
      @JsonKey(name: 'remarks', defaultValue: '') required final String remarks,
      @JsonKey(name: 'outsidePolicy', defaultValue: false)
      required final bool outsidePolicy,
      @JsonKey(name: 'priceOverride', defaultValue: '')
      required final String priceOverride}) = _$ReturnItemDetailsDtoImpl;
  const _ReturnItemDetailsDto._() : super._();

  factory _ReturnItemDetailsDto.fromJson(Map<String, dynamic> json) =
      _$ReturnItemDetailsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'returnQuantity', defaultValue: 0)
  int get returnQuantity;
  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'lineNumber', defaultValue: '')
  String get lineNumber;
  @override
  @JsonKey(name: 'batch', defaultValue: '')
  String get batch;
  @override
  @JsonKey(name: 'returnReason', defaultValue: '')
  String get returnReason;
  @override
  @JsonKey(name: 'url', defaultValue: [])
  List<String> get url;
  @override
  @JsonKey(name: 'returnType', defaultValue: '')
  String get returnType;
  @override
  @JsonKey(name: 'remarks', defaultValue: '')
  String get remarks;
  @override
  @JsonKey(name: 'outsidePolicy', defaultValue: false)
  bool get outsidePolicy;
  @override
  @JsonKey(name: 'priceOverride', defaultValue: '')
  String get priceOverride;
  @override
  @JsonKey(ignore: true)
  _$$ReturnItemDetailsDtoImplCopyWith<_$ReturnItemDetailsDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
