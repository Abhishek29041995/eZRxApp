// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_code_information.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomerInformation {
  int get shipToCount => throw _privateConstructorUsedError;
  List<CustomerCodeInfo> get soldToInformation =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerInformationCopyWith<CustomerInformation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerInformationCopyWith<$Res> {
  factory $CustomerInformationCopyWith(
          CustomerInformation value, $Res Function(CustomerInformation) then) =
      _$CustomerInformationCopyWithImpl<$Res, CustomerInformation>;
  @useResult
  $Res call({int shipToCount, List<CustomerCodeInfo> soldToInformation});
}

/// @nodoc
class _$CustomerInformationCopyWithImpl<$Res, $Val extends CustomerInformation>
    implements $CustomerInformationCopyWith<$Res> {
  _$CustomerInformationCopyWithImpl(this._value, this._then);

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
              as List<CustomerCodeInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerInformationImplCopyWith<$Res>
    implements $CustomerInformationCopyWith<$Res> {
  factory _$$CustomerInformationImplCopyWith(_$CustomerInformationImpl value,
          $Res Function(_$CustomerInformationImpl) then) =
      __$$CustomerInformationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int shipToCount, List<CustomerCodeInfo> soldToInformation});
}

/// @nodoc
class __$$CustomerInformationImplCopyWithImpl<$Res>
    extends _$CustomerInformationCopyWithImpl<$Res, _$CustomerInformationImpl>
    implements _$$CustomerInformationImplCopyWith<$Res> {
  __$$CustomerInformationImplCopyWithImpl(_$CustomerInformationImpl _value,
      $Res Function(_$CustomerInformationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shipToCount = null,
    Object? soldToInformation = null,
  }) {
    return _then(_$CustomerInformationImpl(
      shipToCount: null == shipToCount
          ? _value.shipToCount
          : shipToCount // ignore: cast_nullable_to_non_nullable
              as int,
      soldToInformation: null == soldToInformation
          ? _value._soldToInformation
          : soldToInformation // ignore: cast_nullable_to_non_nullable
              as List<CustomerCodeInfo>,
    ));
  }
}

/// @nodoc

class _$CustomerInformationImpl extends _CustomerInformation {
  const _$CustomerInformationImpl(
      {required this.shipToCount,
      required final List<CustomerCodeInfo> soldToInformation})
      : _soldToInformation = soldToInformation,
        super._();

  @override
  final int shipToCount;
  final List<CustomerCodeInfo> _soldToInformation;
  @override
  List<CustomerCodeInfo> get soldToInformation {
    if (_soldToInformation is EqualUnmodifiableListView)
      return _soldToInformation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_soldToInformation);
  }

  @override
  String toString() {
    return 'CustomerInformation(shipToCount: $shipToCount, soldToInformation: $soldToInformation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerInformationImpl &&
            (identical(other.shipToCount, shipToCount) ||
                other.shipToCount == shipToCount) &&
            const DeepCollectionEquality()
                .equals(other._soldToInformation, _soldToInformation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shipToCount,
      const DeepCollectionEquality().hash(_soldToInformation));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerInformationImplCopyWith<_$CustomerInformationImpl> get copyWith =>
      __$$CustomerInformationImplCopyWithImpl<_$CustomerInformationImpl>(
          this, _$identity);
}

abstract class _CustomerInformation extends CustomerInformation {
  const factory _CustomerInformation(
          {required final int shipToCount,
          required final List<CustomerCodeInfo> soldToInformation}) =
      _$CustomerInformationImpl;
  const _CustomerInformation._() : super._();

  @override
  int get shipToCount;
  @override
  List<CustomerCodeInfo> get soldToInformation;
  @override
  @JsonKey(ignore: true)
  _$$CustomerInformationImplCopyWith<_$CustomerInformationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
