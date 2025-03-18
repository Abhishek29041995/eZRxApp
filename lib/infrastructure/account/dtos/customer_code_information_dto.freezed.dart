// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_code_information_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerInformationDTO _$CustomerInformationDTOFromJson(
    Map<String, dynamic> json) {
  return _CustomerInformationDTO.fromJson(json);
}

/// @nodoc
mixin _$CustomerInformationDTO {
  @JsonKey(name: 'shipToCount', defaultValue: 0)
  int get shipToCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'SoldToInformation', defaultValue: [])
  List<CustomerCodeDto> get soldToInformation =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerInformationDTOCopyWith<CustomerInformationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerInformationDTOCopyWith<$Res> {
  factory $CustomerInformationDTOCopyWith(CustomerInformationDTO value,
          $Res Function(CustomerInformationDTO) then) =
      _$CustomerInformationDTOCopyWithImpl<$Res, CustomerInformationDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'shipToCount', defaultValue: 0) int shipToCount,
      @JsonKey(name: 'SoldToInformation', defaultValue: [])
      List<CustomerCodeDto> soldToInformation});
}

/// @nodoc
class _$CustomerInformationDTOCopyWithImpl<$Res,
        $Val extends CustomerInformationDTO>
    implements $CustomerInformationDTOCopyWith<$Res> {
  _$CustomerInformationDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shipToCount = null,
    Object? soldToInformation = null,
  }) {
    return _then(_value.copyWith(
      shipToCount: null == shipToCount
          ? _value.shipToCount
          : shipToCount // ignore: cast_nullable_to_non_nullable
              as int,
      soldToInformation: null == soldToInformation
          ? _value.soldToInformation
          : soldToInformation // ignore: cast_nullable_to_non_nullable
              as List<CustomerCodeDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerInformationDTOImplCopyWith<$Res>
    implements $CustomerInformationDTOCopyWith<$Res> {
  factory _$$CustomerInformationDTOImplCopyWith(
          _$CustomerInformationDTOImpl value,
          $Res Function(_$CustomerInformationDTOImpl) then) =
      __$$CustomerInformationDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'shipToCount', defaultValue: 0) int shipToCount,
      @JsonKey(name: 'SoldToInformation', defaultValue: [])
      List<CustomerCodeDto> soldToInformation});
}

/// @nodoc
class __$$CustomerInformationDTOImplCopyWithImpl<$Res>
    extends _$CustomerInformationDTOCopyWithImpl<$Res,
        _$CustomerInformationDTOImpl>
    implements _$$CustomerInformationDTOImplCopyWith<$Res> {
  __$$CustomerInformationDTOImplCopyWithImpl(
      _$CustomerInformationDTOImpl _value,
      $Res Function(_$CustomerInformationDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shipToCount = null,
    Object? soldToInformation = null,
  }) {
    return _then(_$CustomerInformationDTOImpl(
      shipToCount: null == shipToCount
          ? _value.shipToCount
          : shipToCount // ignore: cast_nullable_to_non_nullable
              as int,
      soldToInformation: null == soldToInformation
          ? _value._soldToInformation
          : soldToInformation // ignore: cast_nullable_to_non_nullable
              as List<CustomerCodeDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerInformationDTOImpl extends _CustomerInformationDTO {
  const _$CustomerInformationDTOImpl(
      {@JsonKey(name: 'shipToCount', defaultValue: 0) required this.shipToCount,
      @JsonKey(name: 'SoldToInformation', defaultValue: [])
      required final List<CustomerCodeDto> soldToInformation})
      : _soldToInformation = soldToInformation,
        super._();

  factory _$CustomerInformationDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerInformationDTOImplFromJson(json);

  @override
  @JsonKey(name: 'shipToCount', defaultValue: 0)
  final int shipToCount;
  final List<CustomerCodeDto> _soldToInformation;
  @override
  @JsonKey(name: 'SoldToInformation', defaultValue: [])
  List<CustomerCodeDto> get soldToInformation {
    if (_soldToInformation is EqualUnmodifiableListView)
      return _soldToInformation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_soldToInformation);
  }

  @override
  String toString() {
    return 'CustomerInformationDTO(shipToCount: $shipToCount, soldToInformation: $soldToInformation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerInformationDTOImpl &&
            (identical(other.shipToCount, shipToCount) ||
                other.shipToCount == shipToCount) &&
            const DeepCollectionEquality()
                .equals(other._soldToInformation, _soldToInformation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, shipToCount,
      const DeepCollectionEquality().hash(_soldToInformation));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerInformationDTOImplCopyWith<_$CustomerInformationDTOImpl>
      get copyWith => __$$CustomerInformationDTOImplCopyWithImpl<
          _$CustomerInformationDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerInformationDTOImplToJson(
      this,
    );
  }
}

abstract class _CustomerInformationDTO extends CustomerInformationDTO {
  const factory _CustomerInformationDTO(
          {@JsonKey(name: 'shipToCount', defaultValue: 0)
          required final int shipToCount,
          @JsonKey(name: 'SoldToInformation', defaultValue: [])
          required final List<CustomerCodeDto> soldToInformation}) =
      _$CustomerInformationDTOImpl;
  const _CustomerInformationDTO._() : super._();

  factory _CustomerInformationDTO.fromJson(Map<String, dynamic> json) =
      _$CustomerInformationDTOImpl.fromJson;

  @override
  @JsonKey(name: 'shipToCount', defaultValue: 0)
  int get shipToCount;
  @override
  @JsonKey(name: 'SoldToInformation', defaultValue: [])
  List<CustomerCodeDto> get soldToInformation;
  @override
  @JsonKey(ignore: true)
  _$$CustomerInformationDTOImplCopyWith<_$CustomerInformationDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
