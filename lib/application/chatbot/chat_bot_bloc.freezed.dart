// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_bot_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatBotEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() startChatbot,
    required TResult Function() resetChatbot,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? startChatbot,
    TResult? Function()? resetChatbot,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? startChatbot,
    TResult Function()? resetChatbot,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_StartChatbot value) startChatbot,
    required TResult Function(_ResetChatbot value) resetChatbot,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_StartChatbot value)? startChatbot,
    TResult? Function(_ResetChatbot value)? resetChatbot,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_StartChatbot value)? startChatbot,
    TResult Function(_ResetChatbot value)? resetChatbot,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatBotEventCopyWith<$Res> {
  factory $ChatBotEventCopyWith(
          ChatBotEvent value, $Res Function(ChatBotEvent) then) =
      _$ChatBotEventCopyWithImpl<$Res, ChatBotEvent>;
}

/// @nodoc
class _$ChatBotEventCopyWithImpl<$Res, $Val extends ChatBotEvent>
    implements $ChatBotEventCopyWith<$Res> {
  _$ChatBotEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$ChatBotEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl();

  @override
  String toString() {
    return 'ChatBotEvent.initialize()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() startChatbot,
    required TResult Function() resetChatbot,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? startChatbot,
    TResult? Function()? resetChatbot,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? startChatbot,
    TResult Function()? resetChatbot,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_StartChatbot value) startChatbot,
    required TResult Function(_ResetChatbot value) resetChatbot,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_StartChatbot value)? startChatbot,
    TResult? Function(_ResetChatbot value)? resetChatbot,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_StartChatbot value)? startChatbot,
    TResult Function(_ResetChatbot value)? resetChatbot,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements ChatBotEvent {
  const factory _Initialize() = _$InitializeImpl;
}

/// @nodoc
abstract class _$$StartChatbotImplCopyWith<$Res> {
  factory _$$StartChatbotImplCopyWith(
          _$StartChatbotImpl value, $Res Function(_$StartChatbotImpl) then) =
      __$$StartChatbotImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartChatbotImplCopyWithImpl<$Res>
    extends _$ChatBotEventCopyWithImpl<$Res, _$StartChatbotImpl>
    implements _$$StartChatbotImplCopyWith<$Res> {
  __$$StartChatbotImplCopyWithImpl(
      _$StartChatbotImpl _value, $Res Function(_$StartChatbotImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartChatbotImpl implements _StartChatbot {
  const _$StartChatbotImpl();

  @override
  String toString() {
    return 'ChatBotEvent.startChatbot()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartChatbotImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() startChatbot,
    required TResult Function() resetChatbot,
  }) {
    return startChatbot();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? startChatbot,
    TResult? Function()? resetChatbot,
  }) {
    return startChatbot?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? startChatbot,
    TResult Function()? resetChatbot,
    required TResult orElse(),
  }) {
    if (startChatbot != null) {
      return startChatbot();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_StartChatbot value) startChatbot,
    required TResult Function(_ResetChatbot value) resetChatbot,
  }) {
    return startChatbot(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_StartChatbot value)? startChatbot,
    TResult? Function(_ResetChatbot value)? resetChatbot,
  }) {
    return startChatbot?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_StartChatbot value)? startChatbot,
    TResult Function(_ResetChatbot value)? resetChatbot,
    required TResult orElse(),
  }) {
    if (startChatbot != null) {
      return startChatbot(this);
    }
    return orElse();
  }
}

abstract class _StartChatbot implements ChatBotEvent {
  const factory _StartChatbot() = _$StartChatbotImpl;
}

/// @nodoc
abstract class _$$ResetChatbotImplCopyWith<$Res> {
  factory _$$ResetChatbotImplCopyWith(
          _$ResetChatbotImpl value, $Res Function(_$ResetChatbotImpl) then) =
      __$$ResetChatbotImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetChatbotImplCopyWithImpl<$Res>
    extends _$ChatBotEventCopyWithImpl<$Res, _$ResetChatbotImpl>
    implements _$$ResetChatbotImplCopyWith<$Res> {
  __$$ResetChatbotImplCopyWithImpl(
      _$ResetChatbotImpl _value, $Res Function(_$ResetChatbotImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetChatbotImpl implements _ResetChatbot {
  const _$ResetChatbotImpl();

  @override
  String toString() {
    return 'ChatBotEvent.resetChatbot()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetChatbotImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() startChatbot,
    required TResult Function() resetChatbot,
  }) {
    return resetChatbot();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? startChatbot,
    TResult? Function()? resetChatbot,
  }) {
    return resetChatbot?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? startChatbot,
    TResult Function()? resetChatbot,
    required TResult orElse(),
  }) {
    if (resetChatbot != null) {
      return resetChatbot();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_StartChatbot value) startChatbot,
    required TResult Function(_ResetChatbot value) resetChatbot,
  }) {
    return resetChatbot(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_StartChatbot value)? startChatbot,
    TResult? Function(_ResetChatbot value)? resetChatbot,
  }) {
    return resetChatbot?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_StartChatbot value)? startChatbot,
    TResult Function(_ResetChatbot value)? resetChatbot,
    required TResult orElse(),
  }) {
    if (resetChatbot != null) {
      return resetChatbot(this);
    }
    return orElse();
  }
}

abstract class _ResetChatbot implements ChatBotEvent {
  const factory _ResetChatbot() = _$ResetChatbotImpl;
}

/// @nodoc
mixin _$ChatBotState {
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get chatbotFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatBotStateCopyWith<ChatBotState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatBotStateCopyWith<$Res> {
  factory $ChatBotStateCopyWith(
          ChatBotState value, $Res Function(ChatBotState) then) =
      _$ChatBotStateCopyWithImpl<$Res, ChatBotState>;
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<ApiFailure, dynamic>> chatbotFailureOrSuccessOption});
}

/// @nodoc
class _$ChatBotStateCopyWithImpl<$Res, $Val extends ChatBotState>
    implements $ChatBotStateCopyWith<$Res> {
  _$ChatBotStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? chatbotFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      chatbotFailureOrSuccessOption: null == chatbotFailureOrSuccessOption
          ? _value.chatbotFailureOrSuccessOption
          : chatbotFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatBotStateImplCopyWith<$Res>
    implements $ChatBotStateCopyWith<$Res> {
  factory _$$ChatBotStateImplCopyWith(
          _$ChatBotStateImpl value, $Res Function(_$ChatBotStateImpl) then) =
      __$$ChatBotStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<ApiFailure, dynamic>> chatbotFailureOrSuccessOption});
}

/// @nodoc
class __$$ChatBotStateImplCopyWithImpl<$Res>
    extends _$ChatBotStateCopyWithImpl<$Res, _$ChatBotStateImpl>
    implements _$$ChatBotStateImplCopyWith<$Res> {
  __$$ChatBotStateImplCopyWithImpl(
      _$ChatBotStateImpl _value, $Res Function(_$ChatBotStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? chatbotFailureOrSuccessOption = null,
  }) {
    return _then(_$ChatBotStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      chatbotFailureOrSuccessOption: null == chatbotFailureOrSuccessOption
          ? _value.chatbotFailureOrSuccessOption
          : chatbotFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$ChatBotStateImpl extends _ChatBotState {
  const _$ChatBotStateImpl(
      {required this.isLoading, required this.chatbotFailureOrSuccessOption})
      : super._();

  @override
  final bool isLoading;
  @override
  final Option<Either<ApiFailure, dynamic>> chatbotFailureOrSuccessOption;

  @override
  String toString() {
    return 'ChatBotState(isLoading: $isLoading, chatbotFailureOrSuccessOption: $chatbotFailureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatBotStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.chatbotFailureOrSuccessOption,
                    chatbotFailureOrSuccessOption) ||
                other.chatbotFailureOrSuccessOption ==
                    chatbotFailureOrSuccessOption));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, chatbotFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatBotStateImplCopyWith<_$ChatBotStateImpl> get copyWith =>
      __$$ChatBotStateImplCopyWithImpl<_$ChatBotStateImpl>(this, _$identity);
}

abstract class _ChatBotState extends ChatBotState {
  const factory _ChatBotState(
      {required final bool isLoading,
      required final Option<Either<ApiFailure, dynamic>>
          chatbotFailureOrSuccessOption}) = _$ChatBotStateImpl;
  const _ChatBotState._() : super._();

  @override
  bool get isLoading;
  @override
  Option<Either<ApiFailure, dynamic>> get chatbotFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$ChatBotStateImplCopyWith<_$ChatBotStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
