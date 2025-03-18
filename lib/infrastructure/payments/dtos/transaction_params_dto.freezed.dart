// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_params_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionParamsDto _$TransactionParamsDtoFromJson(Map<String, dynamic> json) {
  return _TransactionParamsDto.fromJson(json);
}

/// @nodoc
mixin _$TransactionParamsDto {
  @JsonKey(name: 'customer', defaultValue: '')
  String get customer => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdStartDate', defaultValue: '')
  String get createdStartDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdEndDate', defaultValue: '')
  String get createdEndDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'search', defaultValue: '')
  String get search => throw _privateConstructorUsedError;
  @JsonKey(name: 'first', defaultValue: 0)
  int get first => throw _privateConstructorUsedError;
  @JsonKey(name: 'after', defaultValue: 0)
  int get after => throw _privateConstructorUsedError;
  @JsonKey(name: 'amountMin', defaultValue: 0)
  int get amountMin => throw _privateConstructorUsedError;
  @JsonKey(name: 'amountMax', defaultValue: 0)
  int get amountMax => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', defaultValue: <String>[])
  List<String> get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionParamsDtoCopyWith<TransactionParamsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionParamsDtoCopyWith<$Res> {
  factory $TransactionParamsDtoCopyWith(TransactionParamsDto value,
          $Res Function(TransactionParamsDto) then) =
      _$TransactionParamsDtoCopyWithImpl<$Res, TransactionParamsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'customer', defaultValue: '') String customer,
      @JsonKey(name: 'createdStartDate', defaultValue: '')
      String createdStartDate,
      @JsonKey(name: 'createdEndDate', defaultValue: '') String createdEndDate,
      @JsonKey(name: 'search', defaultValue: '') String search,
      @JsonKey(name: 'first', defaultValue: 0) int first,
      @JsonKey(name: 'after', defaultValue: 0) int after,
      @JsonKey(name: 'amountMin', defaultValue: 0) int amountMin,
      @JsonKey(name: 'amountMax', defaultValue: 0) int amountMax,
      @JsonKey(name: 'status', defaultValue: <String>[]) List<String> status});
}

/// @nodoc
class _$TransactionParamsDtoCopyWithImpl<$Res,
        $Val extends TransactionParamsDto>
    implements $TransactionParamsDtoCopyWith<$Res> {
  _$TransactionParamsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? createdStartDate = null,
    Object? createdEndDate = null,
    Object? search = null,
    Object? first = null,
    Object? after = null,
    Object? amountMin = null,
    Object? amountMax = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String,
      createdStartDate: null == createdStartDate
          ? _value.createdStartDate
          : createdStartDate // ignore: cast_nullable_to_non_nullable
              as String,
      createdEndDate: null == createdEndDate
          ? _value.createdEndDate
          : createdEndDate // ignore: cast_nullable_to_non_nullable
              as String,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as int,
      after: null == after
          ? _value.after
          : after // ignore: cast_nullable_to_non_nullable
              as int,
      amountMin: null == amountMin
          ? _value.amountMin
          : amountMin // ignore: cast_nullable_to_non_nullable
              as int,
      amountMax: null == amountMax
          ? _value.amountMax
          : amountMax // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionParamsDtoImplCopyWith<$Res>
    implements $TransactionParamsDtoCopyWith<$Res> {
  factory _$$TransactionParamsDtoImplCopyWith(_$TransactionParamsDtoImpl value,
          $Res Function(_$TransactionParamsDtoImpl) then) =
      __$$TransactionParamsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'customer', defaultValue: '') String customer,
      @JsonKey(name: 'createdStartDate', defaultValue: '')
      String createdStartDate,
      @JsonKey(name: 'createdEndDate', defaultValue: '') String createdEndDate,
      @JsonKey(name: 'search', defaultValue: '') String search,
      @JsonKey(name: 'first', defaultValue: 0) int first,
      @JsonKey(name: 'after', defaultValue: 0) int after,
      @JsonKey(name: 'amountMin', defaultValue: 0) int amountMin,
      @JsonKey(name: 'amountMax', defaultValue: 0) int amountMax,
      @JsonKey(name: 'status', defaultValue: <String>[]) List<String> status});
}

/// @nodoc
class __$$TransactionParamsDtoImplCopyWithImpl<$Res>
    extends _$TransactionParamsDtoCopyWithImpl<$Res, _$TransactionParamsDtoImpl>
    implements _$$TransactionParamsDtoImplCopyWith<$Res> {
  __$$TransactionParamsDtoImplCopyWithImpl(_$TransactionParamsDtoImpl _value,
      $Res Function(_$TransactionParamsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? createdStartDate = null,
    Object? createdEndDate = null,
    Object? search = null,
    Object? first = null,
    Object? after = null,
    Object? amountMin = null,
    Object? amountMax = null,
    Object? status = null,
  }) {
    return _then(_$TransactionParamsDtoImpl(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String,
      createdStartDate: null == createdStartDate
          ? _value.createdStartDate
          : createdStartDate // ignore: cast_nullable_to_non_nullable
              as String,
      createdEndDate: null == createdEndDate
          ? _value.createdEndDate
          : createdEndDate // ignore: cast_nullable_to_non_nullable
              as String,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as int,
      after: null == after
          ? _value.after
          : after // ignore: cast_nullable_to_non_nullable
              as int,
      amountMin: null == amountMin
          ? _value.amountMin
          : amountMin // ignore: cast_nullable_to_non_nullable
              as int,
      amountMax: null == amountMax
          ? _value.amountMax
          : amountMax // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value._status
          : status // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionParamsDtoImpl extends _TransactionParamsDto {
  const _$TransactionParamsDtoImpl(
      {@JsonKey(name: 'customer', defaultValue: '') required this.customer,
      @JsonKey(name: 'createdStartDate', defaultValue: '')
      required this.createdStartDate,
      @JsonKey(name: 'createdEndDate', defaultValue: '')
      required this.createdEndDate,
      @JsonKey(name: 'search', defaultValue: '') required this.search,
      @JsonKey(name: 'first', defaultValue: 0) required this.first,
      @JsonKey(name: 'after', defaultValue: 0) required this.after,
      @JsonKey(name: 'amountMin', defaultValue: 0) required this.amountMin,
      @JsonKey(name: 'amountMax', defaultValue: 0) required this.amountMax,
      @JsonKey(name: 'status', defaultValue: <String>[])
      required final List<String> status})
      : _status = status,
        super._();

  factory _$TransactionParamsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionParamsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'customer', defaultValue: '')
  final String customer;
  @override
  @JsonKey(name: 'createdStartDate', defaultValue: '')
  final String createdStartDate;
  @override
  @JsonKey(name: 'createdEndDate', defaultValue: '')
  final String createdEndDate;
  @override
  @JsonKey(name: 'search', defaultValue: '')
  final String search;
  @override
  @JsonKey(name: 'first', defaultValue: 0)
  final int first;
  @override
  @JsonKey(name: 'after', defaultValue: 0)
  final int after;
  @override
  @JsonKey(name: 'amountMin', defaultValue: 0)
  final int amountMin;
  @override
  @JsonKey(name: 'amountMax', defaultValue: 0)
  final int amountMax;
  final List<String> _status;
  @override
  @JsonKey(name: 'status', defaultValue: <String>[])
  List<String> get status {
    if (_status is EqualUnmodifiableListView) return _status;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_status);
  }

  @override
  String toString() {
    return 'TransactionParamsDto(customer: $customer, createdStartDate: $createdStartDate, createdEndDate: $createdEndDate, search: $search, first: $first, after: $after, amountMin: $amountMin, amountMax: $amountMax, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionParamsDtoImpl &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.createdStartDate, createdStartDate) ||
                other.createdStartDate == createdStartDate) &&
            (identical(other.createdEndDate, createdEndDate) ||
                other.createdEndDate == createdEndDate) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.after, after) || other.after == after) &&
            (identical(other.amountMin, amountMin) ||
                other.amountMin == amountMin) &&
            (identical(other.amountMax, amountMax) ||
                other.amountMax == amountMax) &&
            const DeepCollectionEquality().equals(other._status, _status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      customer,
      createdStartDate,
      createdEndDate,
      search,
      first,
      after,
      amountMin,
      amountMax,
      const DeepCollectionEquality().hash(_status));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionParamsDtoImplCopyWith<_$TransactionParamsDtoImpl>
      get copyWith =>
          __$$TransactionParamsDtoImplCopyWithImpl<_$TransactionParamsDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionParamsDtoImplToJson(
      this,
    );
  }
}

abstract class _TransactionParamsDto extends TransactionParamsDto {
  const factory _TransactionParamsDto(
      {@JsonKey(name: 'customer', defaultValue: '')
      required final String customer,
      @JsonKey(name: 'createdStartDate', defaultValue: '')
      required final String createdStartDate,
      @JsonKey(name: 'createdEndDate', defaultValue: '')
      required final String createdEndDate,
      @JsonKey(name: 'search', defaultValue: '') required final String search,
      @JsonKey(name: 'first', defaultValue: 0) required final int first,
      @JsonKey(name: 'after', defaultValue: 0) required final int after,
      @JsonKey(name: 'amountMin', defaultValue: 0) required final int amountMin,
      @JsonKey(name: 'amountMax', defaultValue: 0) required final int amountMax,
      @JsonKey(name: 'status', defaultValue: <String>[])
      required final List<String> status}) = _$TransactionParamsDtoImpl;
  const _TransactionParamsDto._() : super._();

  factory _TransactionParamsDto.fromJson(Map<String, dynamic> json) =
      _$TransactionParamsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'customer', defaultValue: '')
  String get customer;
  @override
  @JsonKey(name: 'createdStartDate', defaultValue: '')
  String get createdStartDate;
  @override
  @JsonKey(name: 'createdEndDate', defaultValue: '')
  String get createdEndDate;
  @override
  @JsonKey(name: 'search', defaultValue: '')
  String get search;
  @override
  @JsonKey(name: 'first', defaultValue: 0)
  int get first;
  @override
  @JsonKey(name: 'after', defaultValue: 0)
  int get after;
  @override
  @JsonKey(name: 'amountMin', defaultValue: 0)
  int get amountMin;
  @override
  @JsonKey(name: 'amountMax', defaultValue: 0)
  int get amountMax;
  @override
  @JsonKey(name: 'status', defaultValue: <String>[])
  List<String> get status;
  @override
  @JsonKey(ignore: true)
  _$$TransactionParamsDtoImplCopyWith<_$TransactionParamsDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
