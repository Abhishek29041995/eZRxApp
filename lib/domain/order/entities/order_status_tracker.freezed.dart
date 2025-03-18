// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_status_tracker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderStatusTracker {
  String get action => throw _privateConstructorUsedError;
  String get stepName => throw _privateConstructorUsedError;
  String get stepStage => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  StatusType get status => throw _privateConstructorUsedError;
  DateTimeStringValue get updateTimeStamp => throw _privateConstructorUsedError;
  DateTimeStringValue get preformedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderStatusTrackerCopyWith<OrderStatusTracker> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStatusTrackerCopyWith<$Res> {
  factory $OrderStatusTrackerCopyWith(
          OrderStatusTracker value, $Res Function(OrderStatusTracker) then) =
      _$OrderStatusTrackerCopyWithImpl<$Res, OrderStatusTracker>;
  @useResult
  $Res call(
      {String action,
      String stepName,
      String stepStage,
      String state,
      StatusType status,
      DateTimeStringValue updateTimeStamp,
      DateTimeStringValue preformedAt});
}

/// @nodoc
class _$OrderStatusTrackerCopyWithImpl<$Res, $Val extends OrderStatusTracker>
    implements $OrderStatusTrackerCopyWith<$Res> {
  _$OrderStatusTrackerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? stepName = null,
    Object? stepStage = null,
    Object? state = null,
    Object? status = null,
    Object? updateTimeStamp = null,
    Object? preformedAt = null,
  }) {
    return _then(_value.copyWith(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      stepName: null == stepName
          ? _value.stepName
          : stepName // ignore: cast_nullable_to_non_nullable
              as String,
      stepStage: null == stepStage
          ? _value.stepStage
          : stepStage // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusType,
      updateTimeStamp: null == updateTimeStamp
          ? _value.updateTimeStamp
          : updateTimeStamp // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      preformedAt: null == preformedAt
          ? _value.preformedAt
          : preformedAt // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderStatusTrackerImplCopyWith<$Res>
    implements $OrderStatusTrackerCopyWith<$Res> {
  factory _$$OrderStatusTrackerImplCopyWith(_$OrderStatusTrackerImpl value,
          $Res Function(_$OrderStatusTrackerImpl) then) =
      __$$OrderStatusTrackerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String action,
      String stepName,
      String stepStage,
      String state,
      StatusType status,
      DateTimeStringValue updateTimeStamp,
      DateTimeStringValue preformedAt});
}

/// @nodoc
class __$$OrderStatusTrackerImplCopyWithImpl<$Res>
    extends _$OrderStatusTrackerCopyWithImpl<$Res, _$OrderStatusTrackerImpl>
    implements _$$OrderStatusTrackerImplCopyWith<$Res> {
  __$$OrderStatusTrackerImplCopyWithImpl(_$OrderStatusTrackerImpl _value,
      $Res Function(_$OrderStatusTrackerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? stepName = null,
    Object? stepStage = null,
    Object? state = null,
    Object? status = null,
    Object? updateTimeStamp = null,
    Object? preformedAt = null,
  }) {
    return _then(_$OrderStatusTrackerImpl(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      stepName: null == stepName
          ? _value.stepName
          : stepName // ignore: cast_nullable_to_non_nullable
              as String,
      stepStage: null == stepStage
          ? _value.stepStage
          : stepStage // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusType,
      updateTimeStamp: null == updateTimeStamp
          ? _value.updateTimeStamp
          : updateTimeStamp // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      preformedAt: null == preformedAt
          ? _value.preformedAt
          : preformedAt // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
    ));
  }
}

/// @nodoc

class _$OrderStatusTrackerImpl extends _OrderStatusTracker {
  _$OrderStatusTrackerImpl(
      {required this.action,
      required this.stepName,
      required this.stepStage,
      required this.state,
      required this.status,
      required this.updateTimeStamp,
      required this.preformedAt})
      : super._();

  @override
  final String action;
  @override
  final String stepName;
  @override
  final String stepStage;
  @override
  final String state;
  @override
  final StatusType status;
  @override
  final DateTimeStringValue updateTimeStamp;
  @override
  final DateTimeStringValue preformedAt;

  @override
  String toString() {
    return 'OrderStatusTracker(action: $action, stepName: $stepName, stepStage: $stepStage, state: $state, status: $status, updateTimeStamp: $updateTimeStamp, preformedAt: $preformedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStatusTrackerImpl &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.stepName, stepName) ||
                other.stepName == stepName) &&
            (identical(other.stepStage, stepStage) ||
                other.stepStage == stepStage) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.updateTimeStamp, updateTimeStamp) ||
                other.updateTimeStamp == updateTimeStamp) &&
            (identical(other.preformedAt, preformedAt) ||
                other.preformedAt == preformedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, action, stepName, stepStage,
      state, status, updateTimeStamp, preformedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStatusTrackerImplCopyWith<_$OrderStatusTrackerImpl> get copyWith =>
      __$$OrderStatusTrackerImplCopyWithImpl<_$OrderStatusTrackerImpl>(
          this, _$identity);
}

abstract class _OrderStatusTracker extends OrderStatusTracker {
  factory _OrderStatusTracker(
          {required final String action,
          required final String stepName,
          required final String stepStage,
          required final String state,
          required final StatusType status,
          required final DateTimeStringValue updateTimeStamp,
          required final DateTimeStringValue preformedAt}) =
      _$OrderStatusTrackerImpl;
  _OrderStatusTracker._() : super._();

  @override
  String get action;
  @override
  String get stepName;
  @override
  String get stepStage;
  @override
  String get state;
  @override
  StatusType get status;
  @override
  DateTimeStringValue get updateTimeStamp;
  @override
  DateTimeStringValue get preformedAt;
  @override
  @JsonKey(ignore: true)
  _$$OrderStatusTrackerImplCopyWith<_$OrderStatusTrackerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
