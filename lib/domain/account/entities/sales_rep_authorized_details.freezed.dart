// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_rep_authorized_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SalesRepAuthorizedDetails {
  String get movApproval => throw _privateConstructorUsedError;
  String get movReason => throw _privateConstructorUsedError;
  bool get sendPayload => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalesRepAuthorizedDetailsCopyWith<SalesRepAuthorizedDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesRepAuthorizedDetailsCopyWith<$Res> {
  factory $SalesRepAuthorizedDetailsCopyWith(SalesRepAuthorizedDetails value,
          $Res Function(SalesRepAuthorizedDetails) then) =
      _$SalesRepAuthorizedDetailsCopyWithImpl<$Res, SalesRepAuthorizedDetails>;
  @useResult
  $Res call({String movApproval, String movReason, bool sendPayload});
}

/// @nodoc
class _$SalesRepAuthorizedDetailsCopyWithImpl<$Res,
        $Val extends SalesRepAuthorizedDetails>
    implements $SalesRepAuthorizedDetailsCopyWith<$Res> {
  _$SalesRepAuthorizedDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movApproval = null,
    Object? movReason = null,
    Object? sendPayload = null,
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
      sendPayload: null == sendPayload
          ? _value.sendPayload
          : sendPayload // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesRepAuthorizedDetailsImplCopyWith<$Res>
    implements $SalesRepAuthorizedDetailsCopyWith<$Res> {
  factory _$$SalesRepAuthorizedDetailsImplCopyWith(
          _$SalesRepAuthorizedDetailsImpl value,
          $Res Function(_$SalesRepAuthorizedDetailsImpl) then) =
      __$$SalesRepAuthorizedDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String movApproval, String movReason, bool sendPayload});
}

/// @nodoc
class __$$SalesRepAuthorizedDetailsImplCopyWithImpl<$Res>
    extends _$SalesRepAuthorizedDetailsCopyWithImpl<$Res,
        _$SalesRepAuthorizedDetailsImpl>
    implements _$$SalesRepAuthorizedDetailsImplCopyWith<$Res> {
  __$$SalesRepAuthorizedDetailsImplCopyWithImpl(
      _$SalesRepAuthorizedDetailsImpl _value,
      $Res Function(_$SalesRepAuthorizedDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movApproval = null,
    Object? movReason = null,
    Object? sendPayload = null,
  }) {
    return _then(_$SalesRepAuthorizedDetailsImpl(
      movApproval: null == movApproval
          ? _value.movApproval
          : movApproval // ignore: cast_nullable_to_non_nullable
              as String,
      movReason: null == movReason
          ? _value.movReason
          : movReason // ignore: cast_nullable_to_non_nullable
              as String,
      sendPayload: null == sendPayload
          ? _value.sendPayload
          : sendPayload // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SalesRepAuthorizedDetailsImpl extends _SalesRepAuthorizedDetails {
  _$SalesRepAuthorizedDetailsImpl(
      {required this.movApproval,
      required this.movReason,
      required this.sendPayload})
      : super._();

  @override
  final String movApproval;
  @override
  final String movReason;
  @override
  final bool sendPayload;

  @override
  String toString() {
    return 'SalesRepAuthorizedDetails(movApproval: $movApproval, movReason: $movReason, sendPayload: $sendPayload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesRepAuthorizedDetailsImpl &&
            (identical(other.movApproval, movApproval) ||
                other.movApproval == movApproval) &&
            (identical(other.movReason, movReason) ||
                other.movReason == movReason) &&
            (identical(other.sendPayload, sendPayload) ||
                other.sendPayload == sendPayload));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, movApproval, movReason, sendPayload);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesRepAuthorizedDetailsImplCopyWith<_$SalesRepAuthorizedDetailsImpl>
      get copyWith => __$$SalesRepAuthorizedDetailsImplCopyWithImpl<
          _$SalesRepAuthorizedDetailsImpl>(this, _$identity);
}

abstract class _SalesRepAuthorizedDetails extends SalesRepAuthorizedDetails {
  factory _SalesRepAuthorizedDetails(
      {required final String movApproval,
      required final String movReason,
      required final bool sendPayload}) = _$SalesRepAuthorizedDetailsImpl;
  _SalesRepAuthorizedDetails._() : super._();

  @override
  String get movApproval;
  @override
  String get movReason;
  @override
  bool get sendPayload;
  @override
  @JsonKey(ignore: true)
  _$$SalesRepAuthorizedDetailsImplCopyWith<_$SalesRepAuthorizedDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
