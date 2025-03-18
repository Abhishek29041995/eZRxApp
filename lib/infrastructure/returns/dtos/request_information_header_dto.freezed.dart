// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_information_header_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestInformationHeaderDto _$RequestInformationHeaderDtoFromJson(
    Map<String, dynamic> json) {
  return _RequestInformationHeaderDto.fromJson(json);
}

/// @nodoc
mixin _$RequestInformationHeaderDto {
  @JsonKey(name: 'returnReference', defaultValue: '')
  String get returnReference => throw _privateConstructorUsedError;
  @JsonKey(name: 'specialInstructions', defaultValue: '')
  String get specialInstructions => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdDate', defaultValue: '')
  String get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdTime', defaultValue: '')
  String get createdTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'cName1', defaultValue: '')
  String get cName1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'refundTotal', defaultValue: '')
  String get refundTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'soldTo', defaultValue: '')
  String get soldTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'requestID', defaultValue: '')
  String get requestID => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdBy', defaultValue: '')
  String get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'bapiStatus', defaultValue: '')
  String get bapiStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalItemCount', defaultValue: '')
  String get totalItemCount => throw _privateConstructorUsedError;
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  bool get isMarketPlace => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestInformationHeaderDtoCopyWith<RequestInformationHeaderDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestInformationHeaderDtoCopyWith<$Res> {
  factory $RequestInformationHeaderDtoCopyWith(
          RequestInformationHeaderDto value,
          $Res Function(RequestInformationHeaderDto) then) =
      _$RequestInformationHeaderDtoCopyWithImpl<$Res,
          RequestInformationHeaderDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'returnReference', defaultValue: '')
      String returnReference,
      @JsonKey(name: 'specialInstructions', defaultValue: '')
      String specialInstructions,
      @JsonKey(name: 'createdDate', defaultValue: '') String createdDate,
      @JsonKey(name: 'createdTime', defaultValue: '') String createdTime,
      @JsonKey(name: 'cName1', defaultValue: '') String cName1,
      @JsonKey(name: 'refundTotal', defaultValue: '') String refundTotal,
      @JsonKey(name: 'soldTo', defaultValue: '') String soldTo,
      @JsonKey(name: 'requestID', defaultValue: '') String requestID,
      @JsonKey(name: 'createdBy', defaultValue: '') String createdBy,
      @JsonKey(name: 'bapiStatus', defaultValue: '') String bapiStatus,
      @JsonKey(name: 'totalItemCount', defaultValue: '') String totalItemCount,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      bool isMarketPlace});
}

/// @nodoc
class _$RequestInformationHeaderDtoCopyWithImpl<$Res,
        $Val extends RequestInformationHeaderDto>
    implements $RequestInformationHeaderDtoCopyWith<$Res> {
  _$RequestInformationHeaderDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnReference = null,
    Object? specialInstructions = null,
    Object? createdDate = null,
    Object? createdTime = null,
    Object? cName1 = null,
    Object? refundTotal = null,
    Object? soldTo = null,
    Object? requestID = null,
    Object? createdBy = null,
    Object? bapiStatus = null,
    Object? totalItemCount = null,
    Object? isMarketPlace = null,
  }) {
    return _then(_value.copyWith(
      returnReference: null == returnReference
          ? _value.returnReference
          : returnReference // ignore: cast_nullable_to_non_nullable
              as String,
      specialInstructions: null == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
      cName1: null == cName1
          ? _value.cName1
          : cName1 // ignore: cast_nullable_to_non_nullable
              as String,
      refundTotal: null == refundTotal
          ? _value.refundTotal
          : refundTotal // ignore: cast_nullable_to_non_nullable
              as String,
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      requestID: null == requestID
          ? _value.requestID
          : requestID // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      bapiStatus: null == bapiStatus
          ? _value.bapiStatus
          : bapiStatus // ignore: cast_nullable_to_non_nullable
              as String,
      totalItemCount: null == totalItemCount
          ? _value.totalItemCount
          : totalItemCount // ignore: cast_nullable_to_non_nullable
              as String,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestInformationHeaderDtoImplCopyWith<$Res>
    implements $RequestInformationHeaderDtoCopyWith<$Res> {
  factory _$$RequestInformationHeaderDtoImplCopyWith(
          _$RequestInformationHeaderDtoImpl value,
          $Res Function(_$RequestInformationHeaderDtoImpl) then) =
      __$$RequestInformationHeaderDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'returnReference', defaultValue: '')
      String returnReference,
      @JsonKey(name: 'specialInstructions', defaultValue: '')
      String specialInstructions,
      @JsonKey(name: 'createdDate', defaultValue: '') String createdDate,
      @JsonKey(name: 'createdTime', defaultValue: '') String createdTime,
      @JsonKey(name: 'cName1', defaultValue: '') String cName1,
      @JsonKey(name: 'refundTotal', defaultValue: '') String refundTotal,
      @JsonKey(name: 'soldTo', defaultValue: '') String soldTo,
      @JsonKey(name: 'requestID', defaultValue: '') String requestID,
      @JsonKey(name: 'createdBy', defaultValue: '') String createdBy,
      @JsonKey(name: 'bapiStatus', defaultValue: '') String bapiStatus,
      @JsonKey(name: 'totalItemCount', defaultValue: '') String totalItemCount,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      bool isMarketPlace});
}

/// @nodoc
class __$$RequestInformationHeaderDtoImplCopyWithImpl<$Res>
    extends _$RequestInformationHeaderDtoCopyWithImpl<$Res,
        _$RequestInformationHeaderDtoImpl>
    implements _$$RequestInformationHeaderDtoImplCopyWith<$Res> {
  __$$RequestInformationHeaderDtoImplCopyWithImpl(
      _$RequestInformationHeaderDtoImpl _value,
      $Res Function(_$RequestInformationHeaderDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnReference = null,
    Object? specialInstructions = null,
    Object? createdDate = null,
    Object? createdTime = null,
    Object? cName1 = null,
    Object? refundTotal = null,
    Object? soldTo = null,
    Object? requestID = null,
    Object? createdBy = null,
    Object? bapiStatus = null,
    Object? totalItemCount = null,
    Object? isMarketPlace = null,
  }) {
    return _then(_$RequestInformationHeaderDtoImpl(
      returnReference: null == returnReference
          ? _value.returnReference
          : returnReference // ignore: cast_nullable_to_non_nullable
              as String,
      specialInstructions: null == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
      cName1: null == cName1
          ? _value.cName1
          : cName1 // ignore: cast_nullable_to_non_nullable
              as String,
      refundTotal: null == refundTotal
          ? _value.refundTotal
          : refundTotal // ignore: cast_nullable_to_non_nullable
              as String,
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      requestID: null == requestID
          ? _value.requestID
          : requestID // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      bapiStatus: null == bapiStatus
          ? _value.bapiStatus
          : bapiStatus // ignore: cast_nullable_to_non_nullable
              as String,
      totalItemCount: null == totalItemCount
          ? _value.totalItemCount
          : totalItemCount // ignore: cast_nullable_to_non_nullable
              as String,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestInformationHeaderDtoImpl extends _RequestInformationHeaderDto {
  _$RequestInformationHeaderDtoImpl(
      {@JsonKey(name: 'returnReference', defaultValue: '')
      required this.returnReference,
      @JsonKey(name: 'specialInstructions', defaultValue: '')
      required this.specialInstructions,
      @JsonKey(name: 'createdDate', defaultValue: '') required this.createdDate,
      @JsonKey(name: 'createdTime', defaultValue: '') required this.createdTime,
      @JsonKey(name: 'cName1', defaultValue: '') required this.cName1,
      @JsonKey(name: 'refundTotal', defaultValue: '') required this.refundTotal,
      @JsonKey(name: 'soldTo', defaultValue: '') required this.soldTo,
      @JsonKey(name: 'requestID', defaultValue: '') required this.requestID,
      @JsonKey(name: 'createdBy', defaultValue: '') required this.createdBy,
      @JsonKey(name: 'bapiStatus', defaultValue: '') required this.bapiStatus,
      @JsonKey(name: 'totalItemCount', defaultValue: '')
      required this.totalItemCount,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      required this.isMarketPlace})
      : super._();

  factory _$RequestInformationHeaderDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RequestInformationHeaderDtoImplFromJson(json);

  @override
  @JsonKey(name: 'returnReference', defaultValue: '')
  final String returnReference;
  @override
  @JsonKey(name: 'specialInstructions', defaultValue: '')
  final String specialInstructions;
  @override
  @JsonKey(name: 'createdDate', defaultValue: '')
  final String createdDate;
  @override
  @JsonKey(name: 'createdTime', defaultValue: '')
  final String createdTime;
  @override
  @JsonKey(name: 'cName1', defaultValue: '')
  final String cName1;
  @override
  @JsonKey(name: 'refundTotal', defaultValue: '')
  final String refundTotal;
  @override
  @JsonKey(name: 'soldTo', defaultValue: '')
  final String soldTo;
  @override
  @JsonKey(name: 'requestID', defaultValue: '')
  final String requestID;
  @override
  @JsonKey(name: 'createdBy', defaultValue: '')
  final String createdBy;
  @override
  @JsonKey(name: 'bapiStatus', defaultValue: '')
  final String bapiStatus;
  @override
  @JsonKey(name: 'totalItemCount', defaultValue: '')
  final String totalItemCount;
  @override
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  final bool isMarketPlace;

  @override
  String toString() {
    return 'RequestInformationHeaderDto(returnReference: $returnReference, specialInstructions: $specialInstructions, createdDate: $createdDate, createdTime: $createdTime, cName1: $cName1, refundTotal: $refundTotal, soldTo: $soldTo, requestID: $requestID, createdBy: $createdBy, bapiStatus: $bapiStatus, totalItemCount: $totalItemCount, isMarketPlace: $isMarketPlace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestInformationHeaderDtoImpl &&
            (identical(other.returnReference, returnReference) ||
                other.returnReference == returnReference) &&
            (identical(other.specialInstructions, specialInstructions) ||
                other.specialInstructions == specialInstructions) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime) &&
            (identical(other.cName1, cName1) || other.cName1 == cName1) &&
            (identical(other.refundTotal, refundTotal) ||
                other.refundTotal == refundTotal) &&
            (identical(other.soldTo, soldTo) || other.soldTo == soldTo) &&
            (identical(other.requestID, requestID) ||
                other.requestID == requestID) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.bapiStatus, bapiStatus) ||
                other.bapiStatus == bapiStatus) &&
            (identical(other.totalItemCount, totalItemCount) ||
                other.totalItemCount == totalItemCount) &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      returnReference,
      specialInstructions,
      createdDate,
      createdTime,
      cName1,
      refundTotal,
      soldTo,
      requestID,
      createdBy,
      bapiStatus,
      totalItemCount,
      isMarketPlace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestInformationHeaderDtoImplCopyWith<_$RequestInformationHeaderDtoImpl>
      get copyWith => __$$RequestInformationHeaderDtoImplCopyWithImpl<
          _$RequestInformationHeaderDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestInformationHeaderDtoImplToJson(
      this,
    );
  }
}

abstract class _RequestInformationHeaderDto
    extends RequestInformationHeaderDto {
  factory _RequestInformationHeaderDto(
      {@JsonKey(name: 'returnReference', defaultValue: '')
      required final String returnReference,
      @JsonKey(name: 'specialInstructions', defaultValue: '')
      required final String specialInstructions,
      @JsonKey(name: 'createdDate', defaultValue: '')
      required final String createdDate,
      @JsonKey(name: 'createdTime', defaultValue: '')
      required final String createdTime,
      @JsonKey(name: 'cName1', defaultValue: '') required final String cName1,
      @JsonKey(name: 'refundTotal', defaultValue: '')
      required final String refundTotal,
      @JsonKey(name: 'soldTo', defaultValue: '') required final String soldTo,
      @JsonKey(name: 'requestID', defaultValue: '')
      required final String requestID,
      @JsonKey(name: 'createdBy', defaultValue: '')
      required final String createdBy,
      @JsonKey(name: 'bapiStatus', defaultValue: '')
      required final String bapiStatus,
      @JsonKey(name: 'totalItemCount', defaultValue: '')
      required final String totalItemCount,
      @JsonKey(
          defaultValue: false,
          readValue: JsonReadValueHelper.mappingIsMarketPlace)
      required final bool isMarketPlace}) = _$RequestInformationHeaderDtoImpl;
  _RequestInformationHeaderDto._() : super._();

  factory _RequestInformationHeaderDto.fromJson(Map<String, dynamic> json) =
      _$RequestInformationHeaderDtoImpl.fromJson;

  @override
  @JsonKey(name: 'returnReference', defaultValue: '')
  String get returnReference;
  @override
  @JsonKey(name: 'specialInstructions', defaultValue: '')
  String get specialInstructions;
  @override
  @JsonKey(name: 'createdDate', defaultValue: '')
  String get createdDate;
  @override
  @JsonKey(name: 'createdTime', defaultValue: '')
  String get createdTime;
  @override
  @JsonKey(name: 'cName1', defaultValue: '')
  String get cName1;
  @override
  @JsonKey(name: 'refundTotal', defaultValue: '')
  String get refundTotal;
  @override
  @JsonKey(name: 'soldTo', defaultValue: '')
  String get soldTo;
  @override
  @JsonKey(name: 'requestID', defaultValue: '')
  String get requestID;
  @override
  @JsonKey(name: 'createdBy', defaultValue: '')
  String get createdBy;
  @override
  @JsonKey(name: 'bapiStatus', defaultValue: '')
  String get bapiStatus;
  @override
  @JsonKey(name: 'totalItemCount', defaultValue: '')
  String get totalItemCount;
  @override
  @JsonKey(
      defaultValue: false, readValue: JsonReadValueHelper.mappingIsMarketPlace)
  bool get isMarketPlace;
  @override
  @JsonKey(ignore: true)
  _$$RequestInformationHeaderDtoImplCopyWith<_$RequestInformationHeaderDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
