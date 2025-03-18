// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_rep_authorized_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalesRepAuthorizedDetailsDto _$SalesRepAuthorizedDetailsDtoFromJson(
    Map<String, dynamic> json) {
  return _SalesRepAuthorizedDetailsDto.fromJson(json);
}

/// @nodoc
mixin _$SalesRepAuthorizedDetailsDto {
  @JsonKey(name: 'movApproval', defaultValue: '')
  String get movApproval => throw _privateConstructorUsedError;
  @JsonKey(name: 'movReason', defaultValue: '')
  String get movReason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalesRepAuthorizedDetailsDtoCopyWith<SalesRepAuthorizedDetailsDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesRepAuthorizedDetailsDtoCopyWith<$Res> {
  factory $SalesRepAuthorizedDetailsDtoCopyWith(
          SalesRepAuthorizedDetailsDto value,
          $Res Function(SalesRepAuthorizedDetailsDto) then) =
      _$SalesRepAuthorizedDetailsDtoCopyWithImpl<$Res,
          SalesRepAuthorizedDetailsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'movApproval', defaultValue: '') String movApproval,
      @JsonKey(name: 'movReason', defaultValue: '') String movReason});
}

/// @nodoc
class _$SalesRepAuthorizedDetailsDtoCopyWithImpl<$Res,
        $Val extends SalesRepAuthorizedDetailsDto>
    implements $SalesRepAuthorizedDetailsDtoCopyWith<$Res> {
  _$SalesRepAuthorizedDetailsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movApproval = null,
    Object? movReason = null,
  }) {
    return _then(_value.copyWith(
      movApproval: null == movApproval
          ? _value.movApproval
          : movApproval // ignore: cast_nullable_to_non_nullable
              as String,
      movReason: null == movReason
          ? _value.movReason
          : movReason // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesRepAuthorizedDetailsDtoImplCopyWith<$Res>
    implements $SalesRepAuthorizedDetailsDtoCopyWith<$Res> {
  factory _$$SalesRepAuthorizedDetailsDtoImplCopyWith(
          _$SalesRepAuthorizedDetailsDtoImpl value,
          $Res Function(_$SalesRepAuthorizedDetailsDtoImpl) then) =
      __$$SalesRepAuthorizedDetailsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'movApproval', defaultValue: '') String movApproval,
      @JsonKey(name: 'movReason', defaultValue: '') String movReason});
}

/// @nodoc
class __$$SalesRepAuthorizedDetailsDtoImplCopyWithImpl<$Res>
    extends _$SalesRepAuthorizedDetailsDtoCopyWithImpl<$Res,
        _$SalesRepAuthorizedDetailsDtoImpl>
    implements _$$SalesRepAuthorizedDetailsDtoImplCopyWith<$Res> {
  __$$SalesRepAuthorizedDetailsDtoImplCopyWithImpl(
      _$SalesRepAuthorizedDetailsDtoImpl _value,
      $Res Function(_$SalesRepAuthorizedDetailsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movApproval = null,
    Object? movReason = null,
  }) {
    return _then(_$SalesRepAuthorizedDetailsDtoImpl(
      movApproval: null == movApproval
          ? _value.movApproval
          : movApproval // ignore: cast_nullable_to_non_nullable
              as String,
      movReason: null == movReason
          ? _value.movReason
          : movReason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesRepAuthorizedDetailsDtoImpl extends _SalesRepAuthorizedDetailsDto {
  const _$SalesRepAuthorizedDetailsDtoImpl(
      {@JsonKey(name: 'movApproval', defaultValue: '')
      required this.movApproval,
      @JsonKey(name: 'movReason', defaultValue: '') required this.movReason})
      : super._();

  factory _$SalesRepAuthorizedDetailsDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SalesRepAuthorizedDetailsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'movApproval', defaultValue: '')
  final String movApproval;
  @override
  @JsonKey(name: 'movReason', defaultValue: '')
  final String movReason;

  @override
  String toString() {
    return 'SalesRepAuthorizedDetailsDto(movApproval: $movApproval, movReason: $movReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesRepAuthorizedDetailsDtoImpl &&
            (identical(other.movApproval, movApproval) ||
                other.movApproval == movApproval) &&
            (identical(other.movReason, movReason) ||
                other.movReason == movReason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, movApproval, movReason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesRepAuthorizedDetailsDtoImplCopyWith<
          _$SalesRepAuthorizedDetailsDtoImpl>
      get copyWith => __$$SalesRepAuthorizedDetailsDtoImplCopyWithImpl<
          _$SalesRepAuthorizedDetailsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesRepAuthorizedDetailsDtoImplToJson(
      this,
    );
  }
}

abstract class _SalesRepAuthorizedDetailsDto
    extends SalesRepAuthorizedDetailsDto {
  const factory _SalesRepAuthorizedDetailsDto(
      {@JsonKey(name: 'movApproval', defaultValue: '')
      required final String movApproval,
      @JsonKey(name: 'movReason', defaultValue: '')
      required final String movReason}) = _$SalesRepAuthorizedDetailsDtoImpl;
  const _SalesRepAuthorizedDetailsDto._() : super._();

  factory _SalesRepAuthorizedDetailsDto.fromJson(Map<String, dynamic> json) =
      _$SalesRepAuthorizedDetailsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'movApproval', defaultValue: '')
  String get movApproval;
  @override
  @JsonKey(name: 'movReason', defaultValue: '')
  String get movReason;
  @override
  @JsonKey(ignore: true)
  _$$SalesRepAuthorizedDetailsDtoImplCopyWith<
          _$SalesRepAuthorizedDetailsDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
