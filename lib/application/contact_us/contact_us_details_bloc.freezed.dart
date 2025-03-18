// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_us_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ContactUsDetailsEvent {
  AppMarket get market => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppMarket market) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppMarket market)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppMarket market)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContactUsDetailsEventCopyWith<ContactUsDetailsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactUsDetailsEventCopyWith<$Res> {
  factory $ContactUsDetailsEventCopyWith(ContactUsDetailsEvent value,
          $Res Function(ContactUsDetailsEvent) then) =
      _$ContactUsDetailsEventCopyWithImpl<$Res, ContactUsDetailsEvent>;
  @useResult
  $Res call({AppMarket market});
}

/// @nodoc
class _$ContactUsDetailsEventCopyWithImpl<$Res,
        $Val extends ContactUsDetailsEvent>
    implements $ContactUsDetailsEventCopyWith<$Res> {
  _$ContactUsDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? market = null,
  }) {
    return _then(_value.copyWith(
      market: null == market
          ? _value.market
          : market // ignore: cast_nullable_to_non_nullable
              as AppMarket,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res>
    implements $ContactUsDetailsEventCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppMarket market});
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$ContactUsDetailsEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? market = null,
  }) {
    return _then(_$FetchImpl(
      market: null == market
          ? _value.market
          : market // ignore: cast_nullable_to_non_nullable
              as AppMarket,
    ));
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl({required this.market});

  @override
  final AppMarket market;

  @override
  String toString() {
    return 'ContactUsDetailsEvent.fetch(market: $market)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.market, market) || other.market == market));
  }

  @override
  int get hashCode => Object.hash(runtimeType, market);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppMarket market) fetch,
  }) {
    return fetch(market);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppMarket market)? fetch,
  }) {
    return fetch?.call(market);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppMarket market)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(market);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements ContactUsDetailsEvent {
  const factory _Fetch({required final AppMarket market}) = _$FetchImpl;

  @override
  AppMarket get market;
  @override
  @JsonKey(ignore: true)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ContactUsDetailsState {
  ContactUsDetails get contactUsDetails => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContactUsDetailsStateCopyWith<ContactUsDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactUsDetailsStateCopyWith<$Res> {
  factory $ContactUsDetailsStateCopyWith(ContactUsDetailsState value,
          $Res Function(ContactUsDetailsState) then) =
      _$ContactUsDetailsStateCopyWithImpl<$Res, ContactUsDetailsState>;
  @useResult
  $Res call({ContactUsDetails contactUsDetails, bool isLoading});

  $ContactUsDetailsCopyWith<$Res> get contactUsDetails;
}

/// @nodoc
class _$ContactUsDetailsStateCopyWithImpl<$Res,
        $Val extends ContactUsDetailsState>
    implements $ContactUsDetailsStateCopyWith<$Res> {
  _$ContactUsDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contactUsDetails = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      contactUsDetails: null == contactUsDetails
          ? _value.contactUsDetails
          : contactUsDetails // ignore: cast_nullable_to_non_nullable
              as ContactUsDetails,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContactUsDetailsCopyWith<$Res> get contactUsDetails {
    return $ContactUsDetailsCopyWith<$Res>(_value.contactUsDetails, (value) {
      return _then(_value.copyWith(contactUsDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContactUsDetailsStateImplCopyWith<$Res>
    implements $ContactUsDetailsStateCopyWith<$Res> {
  factory _$$ContactUsDetailsStateImplCopyWith(
          _$ContactUsDetailsStateImpl value,
          $Res Function(_$ContactUsDetailsStateImpl) then) =
      __$$ContactUsDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ContactUsDetails contactUsDetails, bool isLoading});

  @override
  $ContactUsDetailsCopyWith<$Res> get contactUsDetails;
}

/// @nodoc
class __$$ContactUsDetailsStateImplCopyWithImpl<$Res>
    extends _$ContactUsDetailsStateCopyWithImpl<$Res,
        _$ContactUsDetailsStateImpl>
    implements _$$ContactUsDetailsStateImplCopyWith<$Res> {
  __$$ContactUsDetailsStateImplCopyWithImpl(_$ContactUsDetailsStateImpl _value,
      $Res Function(_$ContactUsDetailsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contactUsDetails = null,
    Object? isLoading = null,
  }) {
    return _then(_$ContactUsDetailsStateImpl(
      contactUsDetails: null == contactUsDetails
          ? _value.contactUsDetails
          : contactUsDetails // ignore: cast_nullable_to_non_nullable
              as ContactUsDetails,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ContactUsDetailsStateImpl extends _ContactUsDetailsState {
  const _$ContactUsDetailsStateImpl(
      {required this.contactUsDetails, required this.isLoading})
      : super._();

  @override
  final ContactUsDetails contactUsDetails;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'ContactUsDetailsState(contactUsDetails: $contactUsDetails, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactUsDetailsStateImpl &&
            (identical(other.contactUsDetails, contactUsDetails) ||
                other.contactUsDetails == contactUsDetails) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, contactUsDetails, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactUsDetailsStateImplCopyWith<_$ContactUsDetailsStateImpl>
      get copyWith => __$$ContactUsDetailsStateImplCopyWithImpl<
          _$ContactUsDetailsStateImpl>(this, _$identity);
}

abstract class _ContactUsDetailsState extends ContactUsDetailsState {
  const factory _ContactUsDetailsState(
      {required final ContactUsDetails contactUsDetails,
      required final bool isLoading}) = _$ContactUsDetailsStateImpl;
  const _ContactUsDetailsState._() : super._();

  @override
  ContactUsDetails get contactUsDetails;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$ContactUsDetailsStateImplCopyWith<_$ContactUsDetailsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
