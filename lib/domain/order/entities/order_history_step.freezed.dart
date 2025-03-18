// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_step.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderHistoryStep {
  String get dateString => throw _privateConstructorUsedError;
  String get timeString => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get subTitle => throw _privateConstructorUsedError;
  List<OrderStatusTracker> get subSteps => throw _privateConstructorUsedError;
  OrderHistoryStepStates get state => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderHistoryStepCopyWith<OrderHistoryStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryStepCopyWith<$Res> {
  factory $OrderHistoryStepCopyWith(
          OrderHistoryStep value, $Res Function(OrderHistoryStep) then) =
      _$OrderHistoryStepCopyWithImpl<$Res, OrderHistoryStep>;
  @useResult
  $Res call(
      {String dateString,
      String timeString,
      IconData icon,
      String title,
      String subTitle,
      List<OrderStatusTracker> subSteps,
      OrderHistoryStepStates state});
}

/// @nodoc
class _$OrderHistoryStepCopyWithImpl<$Res, $Val extends OrderHistoryStep>
    implements $OrderHistoryStepCopyWith<$Res> {
  _$OrderHistoryStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateString = null,
    Object? timeString = null,
    Object? icon = null,
    Object? title = null,
    Object? subTitle = null,
    Object? subSteps = null,
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      dateString: null == dateString
          ? _value.dateString
          : dateString // ignore: cast_nullable_to_non_nullable
              as String,
      timeString: null == timeString
          ? _value.timeString
          : timeString // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      subSteps: null == subSteps
          ? _value.subSteps
          : subSteps // ignore: cast_nullable_to_non_nullable
              as List<OrderStatusTracker>,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as OrderHistoryStepStates,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderHistoryStepImplCopyWith<$Res>
    implements $OrderHistoryStepCopyWith<$Res> {
  factory _$$OrderHistoryStepImplCopyWith(_$OrderHistoryStepImpl value,
          $Res Function(_$OrderHistoryStepImpl) then) =
      __$$OrderHistoryStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String dateString,
      String timeString,
      IconData icon,
      String title,
      String subTitle,
      List<OrderStatusTracker> subSteps,
      OrderHistoryStepStates state});
}

/// @nodoc
class __$$OrderHistoryStepImplCopyWithImpl<$Res>
    extends _$OrderHistoryStepCopyWithImpl<$Res, _$OrderHistoryStepImpl>
    implements _$$OrderHistoryStepImplCopyWith<$Res> {
  __$$OrderHistoryStepImplCopyWithImpl(_$OrderHistoryStepImpl _value,
      $Res Function(_$OrderHistoryStepImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateString = null,
    Object? timeString = null,
    Object? icon = null,
    Object? title = null,
    Object? subTitle = null,
    Object? subSteps = null,
    Object? state = null,
  }) {
    return _then(_$OrderHistoryStepImpl(
      dateString: null == dateString
          ? _value.dateString
          : dateString // ignore: cast_nullable_to_non_nullable
              as String,
      timeString: null == timeString
          ? _value.timeString
          : timeString // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      subSteps: null == subSteps
          ? _value._subSteps
          : subSteps // ignore: cast_nullable_to_non_nullable
              as List<OrderStatusTracker>,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as OrderHistoryStepStates,
    ));
  }
}

/// @nodoc

class _$OrderHistoryStepImpl extends _OrderHistoryStep {
  const _$OrderHistoryStepImpl(
      {required this.dateString,
      required this.timeString,
      required this.icon,
      required this.title,
      required this.subTitle,
      required final List<OrderStatusTracker> subSteps,
      required this.state})
      : _subSteps = subSteps,
        super._();

  @override
  final String dateString;
  @override
  final String timeString;
  @override
  final IconData icon;
  @override
  final String title;
  @override
  final String subTitle;
  final List<OrderStatusTracker> _subSteps;
  @override
  List<OrderStatusTracker> get subSteps {
    if (_subSteps is EqualUnmodifiableListView) return _subSteps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subSteps);
  }

  @override
  final OrderHistoryStepStates state;

  @override
  String toString() {
    return 'OrderHistoryStep(dateString: $dateString, timeString: $timeString, icon: $icon, title: $title, subTitle: $subTitle, subSteps: $subSteps, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderHistoryStepImpl &&
            (identical(other.dateString, dateString) ||
                other.dateString == dateString) &&
            (identical(other.timeString, timeString) ||
                other.timeString == timeString) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            const DeepCollectionEquality().equals(other._subSteps, _subSteps) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateString, timeString, icon,
      title, subTitle, const DeepCollectionEquality().hash(_subSteps), state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderHistoryStepImplCopyWith<_$OrderHistoryStepImpl> get copyWith =>
      __$$OrderHistoryStepImplCopyWithImpl<_$OrderHistoryStepImpl>(
          this, _$identity);
}

abstract class _OrderHistoryStep extends OrderHistoryStep {
  const factory _OrderHistoryStep(
      {required final String dateString,
      required final String timeString,
      required final IconData icon,
      required final String title,
      required final String subTitle,
      required final List<OrderStatusTracker> subSteps,
      required final OrderHistoryStepStates state}) = _$OrderHistoryStepImpl;
  const _OrderHistoryStep._() : super._();

  @override
  String get dateString;
  @override
  String get timeString;
  @override
  IconData get icon;
  @override
  String get title;
  @override
  String get subTitle;
  @override
  List<OrderStatusTracker> get subSteps;
  @override
  OrderHistoryStepStates get state;
  @override
  @JsonKey(ignore: true)
  _$$OrderHistoryStepImplCopyWith<_$OrderHistoryStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
