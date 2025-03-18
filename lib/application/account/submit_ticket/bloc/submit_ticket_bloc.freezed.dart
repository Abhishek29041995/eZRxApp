// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_ticket_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubmitTicketEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo, User user, String chatUrl)
        initialize,
    required TResult Function(CustomerTicketType customerTicketType)
        selectTicketType,
    required TResult Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)
        selectTicketSubCategoryType,
    required TResult Function(TicketPriority ticketPriority) selectPriority,
    required TResult Function(bool newValue) disclaimerConsent,
    required TResult Function(SubmitTicketLabel label, String newValue)
        onTextChange,
    required TResult Function() validateForm,
    required TResult Function(List<PlatformFile> poDocuments) addPoDocument,
    required TResult Function(PlatformFile poDocument) removePoDocument,
    required TResult Function() submitTicket,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo,
            User user, String chatUrl)?
        initialize,
    TResult? Function(CustomerTicketType customerTicketType)? selectTicketType,
    TResult? Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)?
        selectTicketSubCategoryType,
    TResult? Function(TicketPriority ticketPriority)? selectPriority,
    TResult? Function(bool newValue)? disclaimerConsent,
    TResult? Function(SubmitTicketLabel label, String newValue)? onTextChange,
    TResult? Function()? validateForm,
    TResult? Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult? Function(PlatformFile poDocument)? removePoDocument,
    TResult? Function()? submitTicket,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo,
            User user, String chatUrl)?
        initialize,
    TResult Function(CustomerTicketType customerTicketType)? selectTicketType,
    TResult Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)?
        selectTicketSubCategoryType,
    TResult Function(TicketPriority ticketPriority)? selectPriority,
    TResult Function(bool newValue)? disclaimerConsent,
    TResult Function(SubmitTicketLabel label, String newValue)? onTextChange,
    TResult Function()? validateForm,
    TResult Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult Function(PlatformFile poDocument)? removePoDocument,
    TResult Function()? submitTicket,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SelectTicketType value) selectTicketType,
    required TResult Function(_SelectTicketSubCategoryType value)
        selectTicketSubCategoryType,
    required TResult Function(_SelectPriority value) selectPriority,
    required TResult Function(_DisclaimerConsent value) disclaimerConsent,
    required TResult Function(_OnTextChange value) onTextChange,
    required TResult Function(_ValidateForm value) validateForm,
    required TResult Function(_AddPoDocument value) addPoDocument,
    required TResult Function(_RemovePoDocument value) removePoDocument,
    required TResult Function(_SubmitTicket value) submitTicket,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SelectTicketType value)? selectTicketType,
    TResult? Function(_SelectTicketSubCategoryType value)?
        selectTicketSubCategoryType,
    TResult? Function(_SelectPriority value)? selectPriority,
    TResult? Function(_DisclaimerConsent value)? disclaimerConsent,
    TResult? Function(_OnTextChange value)? onTextChange,
    TResult? Function(_ValidateForm value)? validateForm,
    TResult? Function(_AddPoDocument value)? addPoDocument,
    TResult? Function(_RemovePoDocument value)? removePoDocument,
    TResult? Function(_SubmitTicket value)? submitTicket,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SelectTicketType value)? selectTicketType,
    TResult Function(_SelectTicketSubCategoryType value)?
        selectTicketSubCategoryType,
    TResult Function(_SelectPriority value)? selectPriority,
    TResult Function(_DisclaimerConsent value)? disclaimerConsent,
    TResult Function(_OnTextChange value)? onTextChange,
    TResult Function(_ValidateForm value)? validateForm,
    TResult Function(_AddPoDocument value)? addPoDocument,
    TResult Function(_RemovePoDocument value)? removePoDocument,
    TResult Function(_SubmitTicket value)? submitTicket,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitTicketEventCopyWith<$Res> {
  factory $SubmitTicketEventCopyWith(
          SubmitTicketEvent value, $Res Function(SubmitTicketEvent) then) =
      _$SubmitTicketEventCopyWithImpl<$Res, SubmitTicketEvent>;
}

/// @nodoc
class _$SubmitTicketEventCopyWithImpl<$Res, $Val extends SubmitTicketEvent>
    implements $SubmitTicketEventCopyWith<$Res> {
  _$SubmitTicketEventCopyWithImpl(this._value, this._then);

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
  @useResult
  $Res call(
      {CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      User user,
      String chatUrl});

  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$SubmitTicketEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? user = null,
    Object? chatUrl = null,
  }) {
    return _then(_$InitializeImpl(
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      chatUrl: null == chatUrl
          ? _value.chatUrl
          : chatUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl(
      {required this.customerCodeInfo,
      required this.shipToInfo,
      required this.user,
      required this.chatUrl});

  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final User user;
  @override
  final String chatUrl;

  @override
  String toString() {
    return 'SubmitTicketEvent.initialize(customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, user: $user, chatUrl: $chatUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.chatUrl, chatUrl) || other.chatUrl == chatUrl));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, customerCodeInfo, shipToInfo, user, chatUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo, User user, String chatUrl)
        initialize,
    required TResult Function(CustomerTicketType customerTicketType)
        selectTicketType,
    required TResult Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)
        selectTicketSubCategoryType,
    required TResult Function(TicketPriority ticketPriority) selectPriority,
    required TResult Function(bool newValue) disclaimerConsent,
    required TResult Function(SubmitTicketLabel label, String newValue)
        onTextChange,
    required TResult Function() validateForm,
    required TResult Function(List<PlatformFile> poDocuments) addPoDocument,
    required TResult Function(PlatformFile poDocument) removePoDocument,
    required TResult Function() submitTicket,
  }) {
    return initialize(customerCodeInfo, shipToInfo, user, chatUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo,
            User user, String chatUrl)?
        initialize,
    TResult? Function(CustomerTicketType customerTicketType)? selectTicketType,
    TResult? Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)?
        selectTicketSubCategoryType,
    TResult? Function(TicketPriority ticketPriority)? selectPriority,
    TResult? Function(bool newValue)? disclaimerConsent,
    TResult? Function(SubmitTicketLabel label, String newValue)? onTextChange,
    TResult? Function()? validateForm,
    TResult? Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult? Function(PlatformFile poDocument)? removePoDocument,
    TResult? Function()? submitTicket,
  }) {
    return initialize?.call(customerCodeInfo, shipToInfo, user, chatUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo,
            User user, String chatUrl)?
        initialize,
    TResult Function(CustomerTicketType customerTicketType)? selectTicketType,
    TResult Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)?
        selectTicketSubCategoryType,
    TResult Function(TicketPriority ticketPriority)? selectPriority,
    TResult Function(bool newValue)? disclaimerConsent,
    TResult Function(SubmitTicketLabel label, String newValue)? onTextChange,
    TResult Function()? validateForm,
    TResult Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult Function(PlatformFile poDocument)? removePoDocument,
    TResult Function()? submitTicket,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(customerCodeInfo, shipToInfo, user, chatUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SelectTicketType value) selectTicketType,
    required TResult Function(_SelectTicketSubCategoryType value)
        selectTicketSubCategoryType,
    required TResult Function(_SelectPriority value) selectPriority,
    required TResult Function(_DisclaimerConsent value) disclaimerConsent,
    required TResult Function(_OnTextChange value) onTextChange,
    required TResult Function(_ValidateForm value) validateForm,
    required TResult Function(_AddPoDocument value) addPoDocument,
    required TResult Function(_RemovePoDocument value) removePoDocument,
    required TResult Function(_SubmitTicket value) submitTicket,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SelectTicketType value)? selectTicketType,
    TResult? Function(_SelectTicketSubCategoryType value)?
        selectTicketSubCategoryType,
    TResult? Function(_SelectPriority value)? selectPriority,
    TResult? Function(_DisclaimerConsent value)? disclaimerConsent,
    TResult? Function(_OnTextChange value)? onTextChange,
    TResult? Function(_ValidateForm value)? validateForm,
    TResult? Function(_AddPoDocument value)? addPoDocument,
    TResult? Function(_RemovePoDocument value)? removePoDocument,
    TResult? Function(_SubmitTicket value)? submitTicket,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SelectTicketType value)? selectTicketType,
    TResult Function(_SelectTicketSubCategoryType value)?
        selectTicketSubCategoryType,
    TResult Function(_SelectPriority value)? selectPriority,
    TResult Function(_DisclaimerConsent value)? disclaimerConsent,
    TResult Function(_OnTextChange value)? onTextChange,
    TResult Function(_ValidateForm value)? validateForm,
    TResult Function(_AddPoDocument value)? addPoDocument,
    TResult Function(_RemovePoDocument value)? removePoDocument,
    TResult Function(_SubmitTicket value)? submitTicket,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements SubmitTicketEvent {
  const factory _Initialize(
      {required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final User user,
      required final String chatUrl}) = _$InitializeImpl;

  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  User get user;
  String get chatUrl;
  @JsonKey(ignore: true)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectTicketTypeImplCopyWith<$Res> {
  factory _$$SelectTicketTypeImplCopyWith(_$SelectTicketTypeImpl value,
          $Res Function(_$SelectTicketTypeImpl) then) =
      __$$SelectTicketTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CustomerTicketType customerTicketType});
}

/// @nodoc
class __$$SelectTicketTypeImplCopyWithImpl<$Res>
    extends _$SubmitTicketEventCopyWithImpl<$Res, _$SelectTicketTypeImpl>
    implements _$$SelectTicketTypeImplCopyWith<$Res> {
  __$$SelectTicketTypeImplCopyWithImpl(_$SelectTicketTypeImpl _value,
      $Res Function(_$SelectTicketTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerTicketType = null,
  }) {
    return _then(_$SelectTicketTypeImpl(
      customerTicketType: null == customerTicketType
          ? _value.customerTicketType
          : customerTicketType // ignore: cast_nullable_to_non_nullable
              as CustomerTicketType,
    ));
  }
}

/// @nodoc

class _$SelectTicketTypeImpl implements _SelectTicketType {
  const _$SelectTicketTypeImpl({required this.customerTicketType});

  @override
  final CustomerTicketType customerTicketType;

  @override
  String toString() {
    return 'SubmitTicketEvent.selectTicketType(customerTicketType: $customerTicketType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectTicketTypeImpl &&
            (identical(other.customerTicketType, customerTicketType) ||
                other.customerTicketType == customerTicketType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerTicketType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectTicketTypeImplCopyWith<_$SelectTicketTypeImpl> get copyWith =>
      __$$SelectTicketTypeImplCopyWithImpl<_$SelectTicketTypeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo, User user, String chatUrl)
        initialize,
    required TResult Function(CustomerTicketType customerTicketType)
        selectTicketType,
    required TResult Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)
        selectTicketSubCategoryType,
    required TResult Function(TicketPriority ticketPriority) selectPriority,
    required TResult Function(bool newValue) disclaimerConsent,
    required TResult Function(SubmitTicketLabel label, String newValue)
        onTextChange,
    required TResult Function() validateForm,
    required TResult Function(List<PlatformFile> poDocuments) addPoDocument,
    required TResult Function(PlatformFile poDocument) removePoDocument,
    required TResult Function() submitTicket,
  }) {
    return selectTicketType(customerTicketType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo,
            User user, String chatUrl)?
        initialize,
    TResult? Function(CustomerTicketType customerTicketType)? selectTicketType,
    TResult? Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)?
        selectTicketSubCategoryType,
    TResult? Function(TicketPriority ticketPriority)? selectPriority,
    TResult? Function(bool newValue)? disclaimerConsent,
    TResult? Function(SubmitTicketLabel label, String newValue)? onTextChange,
    TResult? Function()? validateForm,
    TResult? Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult? Function(PlatformFile poDocument)? removePoDocument,
    TResult? Function()? submitTicket,
  }) {
    return selectTicketType?.call(customerTicketType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo,
            User user, String chatUrl)?
        initialize,
    TResult Function(CustomerTicketType customerTicketType)? selectTicketType,
    TResult Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)?
        selectTicketSubCategoryType,
    TResult Function(TicketPriority ticketPriority)? selectPriority,
    TResult Function(bool newValue)? disclaimerConsent,
    TResult Function(SubmitTicketLabel label, String newValue)? onTextChange,
    TResult Function()? validateForm,
    TResult Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult Function(PlatformFile poDocument)? removePoDocument,
    TResult Function()? submitTicket,
    required TResult orElse(),
  }) {
    if (selectTicketType != null) {
      return selectTicketType(customerTicketType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SelectTicketType value) selectTicketType,
    required TResult Function(_SelectTicketSubCategoryType value)
        selectTicketSubCategoryType,
    required TResult Function(_SelectPriority value) selectPriority,
    required TResult Function(_DisclaimerConsent value) disclaimerConsent,
    required TResult Function(_OnTextChange value) onTextChange,
    required TResult Function(_ValidateForm value) validateForm,
    required TResult Function(_AddPoDocument value) addPoDocument,
    required TResult Function(_RemovePoDocument value) removePoDocument,
    required TResult Function(_SubmitTicket value) submitTicket,
  }) {
    return selectTicketType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SelectTicketType value)? selectTicketType,
    TResult? Function(_SelectTicketSubCategoryType value)?
        selectTicketSubCategoryType,
    TResult? Function(_SelectPriority value)? selectPriority,
    TResult? Function(_DisclaimerConsent value)? disclaimerConsent,
    TResult? Function(_OnTextChange value)? onTextChange,
    TResult? Function(_ValidateForm value)? validateForm,
    TResult? Function(_AddPoDocument value)? addPoDocument,
    TResult? Function(_RemovePoDocument value)? removePoDocument,
    TResult? Function(_SubmitTicket value)? submitTicket,
  }) {
    return selectTicketType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SelectTicketType value)? selectTicketType,
    TResult Function(_SelectTicketSubCategoryType value)?
        selectTicketSubCategoryType,
    TResult Function(_SelectPriority value)? selectPriority,
    TResult Function(_DisclaimerConsent value)? disclaimerConsent,
    TResult Function(_OnTextChange value)? onTextChange,
    TResult Function(_ValidateForm value)? validateForm,
    TResult Function(_AddPoDocument value)? addPoDocument,
    TResult Function(_RemovePoDocument value)? removePoDocument,
    TResult Function(_SubmitTicket value)? submitTicket,
    required TResult orElse(),
  }) {
    if (selectTicketType != null) {
      return selectTicketType(this);
    }
    return orElse();
  }
}

abstract class _SelectTicketType implements SubmitTicketEvent {
  const factory _SelectTicketType(
          {required final CustomerTicketType customerTicketType}) =
      _$SelectTicketTypeImpl;

  CustomerTicketType get customerTicketType;
  @JsonKey(ignore: true)
  _$$SelectTicketTypeImplCopyWith<_$SelectTicketTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectTicketSubCategoryTypeImplCopyWith<$Res> {
  factory _$$SelectTicketSubCategoryTypeImplCopyWith(
          _$SelectTicketSubCategoryTypeImpl value,
          $Res Function(_$SelectTicketSubCategoryTypeImpl) then) =
      __$$SelectTicketSubCategoryTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CustomerTicketSubCategoryType customerTicketSubCategoryType});
}

/// @nodoc
class __$$SelectTicketSubCategoryTypeImplCopyWithImpl<$Res>
    extends _$SubmitTicketEventCopyWithImpl<$Res,
        _$SelectTicketSubCategoryTypeImpl>
    implements _$$SelectTicketSubCategoryTypeImplCopyWith<$Res> {
  __$$SelectTicketSubCategoryTypeImplCopyWithImpl(
      _$SelectTicketSubCategoryTypeImpl _value,
      $Res Function(_$SelectTicketSubCategoryTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerTicketSubCategoryType = null,
  }) {
    return _then(_$SelectTicketSubCategoryTypeImpl(
      customerTicketSubCategoryType: null == customerTicketSubCategoryType
          ? _value.customerTicketSubCategoryType
          : customerTicketSubCategoryType // ignore: cast_nullable_to_non_nullable
              as CustomerTicketSubCategoryType,
    ));
  }
}

/// @nodoc

class _$SelectTicketSubCategoryTypeImpl
    implements _SelectTicketSubCategoryType {
  const _$SelectTicketSubCategoryTypeImpl(
      {required this.customerTicketSubCategoryType});

  @override
  final CustomerTicketSubCategoryType customerTicketSubCategoryType;

  @override
  String toString() {
    return 'SubmitTicketEvent.selectTicketSubCategoryType(customerTicketSubCategoryType: $customerTicketSubCategoryType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectTicketSubCategoryTypeImpl &&
            (identical(other.customerTicketSubCategoryType,
                    customerTicketSubCategoryType) ||
                other.customerTicketSubCategoryType ==
                    customerTicketSubCategoryType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerTicketSubCategoryType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectTicketSubCategoryTypeImplCopyWith<_$SelectTicketSubCategoryTypeImpl>
      get copyWith => __$$SelectTicketSubCategoryTypeImplCopyWithImpl<
          _$SelectTicketSubCategoryTypeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo, User user, String chatUrl)
        initialize,
    required TResult Function(CustomerTicketType customerTicketType)
        selectTicketType,
    required TResult Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)
        selectTicketSubCategoryType,
    required TResult Function(TicketPriority ticketPriority) selectPriority,
    required TResult Function(bool newValue) disclaimerConsent,
    required TResult Function(SubmitTicketLabel label, String newValue)
        onTextChange,
    required TResult Function() validateForm,
    required TResult Function(List<PlatformFile> poDocuments) addPoDocument,
    required TResult Function(PlatformFile poDocument) removePoDocument,
    required TResult Function() submitTicket,
  }) {
    return selectTicketSubCategoryType(customerTicketSubCategoryType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo,
            User user, String chatUrl)?
        initialize,
    TResult? Function(CustomerTicketType customerTicketType)? selectTicketType,
    TResult? Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)?
        selectTicketSubCategoryType,
    TResult? Function(TicketPriority ticketPriority)? selectPriority,
    TResult? Function(bool newValue)? disclaimerConsent,
    TResult? Function(SubmitTicketLabel label, String newValue)? onTextChange,
    TResult? Function()? validateForm,
    TResult? Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult? Function(PlatformFile poDocument)? removePoDocument,
    TResult? Function()? submitTicket,
  }) {
    return selectTicketSubCategoryType?.call(customerTicketSubCategoryType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo,
            User user, String chatUrl)?
        initialize,
    TResult Function(CustomerTicketType customerTicketType)? selectTicketType,
    TResult Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)?
        selectTicketSubCategoryType,
    TResult Function(TicketPriority ticketPriority)? selectPriority,
    TResult Function(bool newValue)? disclaimerConsent,
    TResult Function(SubmitTicketLabel label, String newValue)? onTextChange,
    TResult Function()? validateForm,
    TResult Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult Function(PlatformFile poDocument)? removePoDocument,
    TResult Function()? submitTicket,
    required TResult orElse(),
  }) {
    if (selectTicketSubCategoryType != null) {
      return selectTicketSubCategoryType(customerTicketSubCategoryType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SelectTicketType value) selectTicketType,
    required TResult Function(_SelectTicketSubCategoryType value)
        selectTicketSubCategoryType,
    required TResult Function(_SelectPriority value) selectPriority,
    required TResult Function(_DisclaimerConsent value) disclaimerConsent,
    required TResult Function(_OnTextChange value) onTextChange,
    required TResult Function(_ValidateForm value) validateForm,
    required TResult Function(_AddPoDocument value) addPoDocument,
    required TResult Function(_RemovePoDocument value) removePoDocument,
    required TResult Function(_SubmitTicket value) submitTicket,
  }) {
    return selectTicketSubCategoryType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SelectTicketType value)? selectTicketType,
    TResult? Function(_SelectTicketSubCategoryType value)?
        selectTicketSubCategoryType,
    TResult? Function(_SelectPriority value)? selectPriority,
    TResult? Function(_DisclaimerConsent value)? disclaimerConsent,
    TResult? Function(_OnTextChange value)? onTextChange,
    TResult? Function(_ValidateForm value)? validateForm,
    TResult? Function(_AddPoDocument value)? addPoDocument,
    TResult? Function(_RemovePoDocument value)? removePoDocument,
    TResult? Function(_SubmitTicket value)? submitTicket,
  }) {
    return selectTicketSubCategoryType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SelectTicketType value)? selectTicketType,
    TResult Function(_SelectTicketSubCategoryType value)?
        selectTicketSubCategoryType,
    TResult Function(_SelectPriority value)? selectPriority,
    TResult Function(_DisclaimerConsent value)? disclaimerConsent,
    TResult Function(_OnTextChange value)? onTextChange,
    TResult Function(_ValidateForm value)? validateForm,
    TResult Function(_AddPoDocument value)? addPoDocument,
    TResult Function(_RemovePoDocument value)? removePoDocument,
    TResult Function(_SubmitTicket value)? submitTicket,
    required TResult orElse(),
  }) {
    if (selectTicketSubCategoryType != null) {
      return selectTicketSubCategoryType(this);
    }
    return orElse();
  }
}

abstract class _SelectTicketSubCategoryType implements SubmitTicketEvent {
  const factory _SelectTicketSubCategoryType(
      {required final CustomerTicketSubCategoryType
          customerTicketSubCategoryType}) = _$SelectTicketSubCategoryTypeImpl;

  CustomerTicketSubCategoryType get customerTicketSubCategoryType;
  @JsonKey(ignore: true)
  _$$SelectTicketSubCategoryTypeImplCopyWith<_$SelectTicketSubCategoryTypeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectPriorityImplCopyWith<$Res> {
  factory _$$SelectPriorityImplCopyWith(_$SelectPriorityImpl value,
          $Res Function(_$SelectPriorityImpl) then) =
      __$$SelectPriorityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TicketPriority ticketPriority});
}

/// @nodoc
class __$$SelectPriorityImplCopyWithImpl<$Res>
    extends _$SubmitTicketEventCopyWithImpl<$Res, _$SelectPriorityImpl>
    implements _$$SelectPriorityImplCopyWith<$Res> {
  __$$SelectPriorityImplCopyWithImpl(
      _$SelectPriorityImpl _value, $Res Function(_$SelectPriorityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketPriority = null,
  }) {
    return _then(_$SelectPriorityImpl(
      ticketPriority: null == ticketPriority
          ? _value.ticketPriority
          : ticketPriority // ignore: cast_nullable_to_non_nullable
              as TicketPriority,
    ));
  }
}

/// @nodoc

class _$SelectPriorityImpl implements _SelectPriority {
  const _$SelectPriorityImpl({required this.ticketPriority});

  @override
  final TicketPriority ticketPriority;

  @override
  String toString() {
    return 'SubmitTicketEvent.selectPriority(ticketPriority: $ticketPriority)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectPriorityImpl &&
            (identical(other.ticketPriority, ticketPriority) ||
                other.ticketPriority == ticketPriority));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ticketPriority);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectPriorityImplCopyWith<_$SelectPriorityImpl> get copyWith =>
      __$$SelectPriorityImplCopyWithImpl<_$SelectPriorityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo, User user, String chatUrl)
        initialize,
    required TResult Function(CustomerTicketType customerTicketType)
        selectTicketType,
    required TResult Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)
        selectTicketSubCategoryType,
    required TResult Function(TicketPriority ticketPriority) selectPriority,
    required TResult Function(bool newValue) disclaimerConsent,
    required TResult Function(SubmitTicketLabel label, String newValue)
        onTextChange,
    required TResult Function() validateForm,
    required TResult Function(List<PlatformFile> poDocuments) addPoDocument,
    required TResult Function(PlatformFile poDocument) removePoDocument,
    required TResult Function() submitTicket,
  }) {
    return selectPriority(ticketPriority);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo,
            User user, String chatUrl)?
        initialize,
    TResult? Function(CustomerTicketType customerTicketType)? selectTicketType,
    TResult? Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)?
        selectTicketSubCategoryType,
    TResult? Function(TicketPriority ticketPriority)? selectPriority,
    TResult? Function(bool newValue)? disclaimerConsent,
    TResult? Function(SubmitTicketLabel label, String newValue)? onTextChange,
    TResult? Function()? validateForm,
    TResult? Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult? Function(PlatformFile poDocument)? removePoDocument,
    TResult? Function()? submitTicket,
  }) {
    return selectPriority?.call(ticketPriority);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo,
            User user, String chatUrl)?
        initialize,
    TResult Function(CustomerTicketType customerTicketType)? selectTicketType,
    TResult Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)?
        selectTicketSubCategoryType,
    TResult Function(TicketPriority ticketPriority)? selectPriority,
    TResult Function(bool newValue)? disclaimerConsent,
    TResult Function(SubmitTicketLabel label, String newValue)? onTextChange,
    TResult Function()? validateForm,
    TResult Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult Function(PlatformFile poDocument)? removePoDocument,
    TResult Function()? submitTicket,
    required TResult orElse(),
  }) {
    if (selectPriority != null) {
      return selectPriority(ticketPriority);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SelectTicketType value) selectTicketType,
    required TResult Function(_SelectTicketSubCategoryType value)
        selectTicketSubCategoryType,
    required TResult Function(_SelectPriority value) selectPriority,
    required TResult Function(_DisclaimerConsent value) disclaimerConsent,
    required TResult Function(_OnTextChange value) onTextChange,
    required TResult Function(_ValidateForm value) validateForm,
    required TResult Function(_AddPoDocument value) addPoDocument,
    required TResult Function(_RemovePoDocument value) removePoDocument,
    required TResult Function(_SubmitTicket value) submitTicket,
  }) {
    return selectPriority(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SelectTicketType value)? selectTicketType,
    TResult? Function(_SelectTicketSubCategoryType value)?
        selectTicketSubCategoryType,
    TResult? Function(_SelectPriority value)? selectPriority,
    TResult? Function(_DisclaimerConsent value)? disclaimerConsent,
    TResult? Function(_OnTextChange value)? onTextChange,
    TResult? Function(_ValidateForm value)? validateForm,
    TResult? Function(_AddPoDocument value)? addPoDocument,
    TResult? Function(_RemovePoDocument value)? removePoDocument,
    TResult? Function(_SubmitTicket value)? submitTicket,
  }) {
    return selectPriority?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SelectTicketType value)? selectTicketType,
    TResult Function(_SelectTicketSubCategoryType value)?
        selectTicketSubCategoryType,
    TResult Function(_SelectPriority value)? selectPriority,
    TResult Function(_DisclaimerConsent value)? disclaimerConsent,
    TResult Function(_OnTextChange value)? onTextChange,
    TResult Function(_ValidateForm value)? validateForm,
    TResult Function(_AddPoDocument value)? addPoDocument,
    TResult Function(_RemovePoDocument value)? removePoDocument,
    TResult Function(_SubmitTicket value)? submitTicket,
    required TResult orElse(),
  }) {
    if (selectPriority != null) {
      return selectPriority(this);
    }
    return orElse();
  }
}

abstract class _SelectPriority implements SubmitTicketEvent {
  const factory _SelectPriority(
      {required final TicketPriority ticketPriority}) = _$SelectPriorityImpl;

  TicketPriority get ticketPriority;
  @JsonKey(ignore: true)
  _$$SelectPriorityImplCopyWith<_$SelectPriorityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DisclaimerConsentImplCopyWith<$Res> {
  factory _$$DisclaimerConsentImplCopyWith(_$DisclaimerConsentImpl value,
          $Res Function(_$DisclaimerConsentImpl) then) =
      __$$DisclaimerConsentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool newValue});
}

/// @nodoc
class __$$DisclaimerConsentImplCopyWithImpl<$Res>
    extends _$SubmitTicketEventCopyWithImpl<$Res, _$DisclaimerConsentImpl>
    implements _$$DisclaimerConsentImplCopyWith<$Res> {
  __$$DisclaimerConsentImplCopyWithImpl(_$DisclaimerConsentImpl _value,
      $Res Function(_$DisclaimerConsentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newValue = null,
  }) {
    return _then(_$DisclaimerConsentImpl(
      newValue: null == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DisclaimerConsentImpl implements _DisclaimerConsent {
  const _$DisclaimerConsentImpl({required this.newValue});

  @override
  final bool newValue;

  @override
  String toString() {
    return 'SubmitTicketEvent.disclaimerConsent(newValue: $newValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisclaimerConsentImpl &&
            (identical(other.newValue, newValue) ||
                other.newValue == newValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DisclaimerConsentImplCopyWith<_$DisclaimerConsentImpl> get copyWith =>
      __$$DisclaimerConsentImplCopyWithImpl<_$DisclaimerConsentImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo, User user, String chatUrl)
        initialize,
    required TResult Function(CustomerTicketType customerTicketType)
        selectTicketType,
    required TResult Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)
        selectTicketSubCategoryType,
    required TResult Function(TicketPriority ticketPriority) selectPriority,
    required TResult Function(bool newValue) disclaimerConsent,
    required TResult Function(SubmitTicketLabel label, String newValue)
        onTextChange,
    required TResult Function() validateForm,
    required TResult Function(List<PlatformFile> poDocuments) addPoDocument,
    required TResult Function(PlatformFile poDocument) removePoDocument,
    required TResult Function() submitTicket,
  }) {
    return disclaimerConsent(newValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo,
            User user, String chatUrl)?
        initialize,
    TResult? Function(CustomerTicketType customerTicketType)? selectTicketType,
    TResult? Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)?
        selectTicketSubCategoryType,
    TResult? Function(TicketPriority ticketPriority)? selectPriority,
    TResult? Function(bool newValue)? disclaimerConsent,
    TResult? Function(SubmitTicketLabel label, String newValue)? onTextChange,
    TResult? Function()? validateForm,
    TResult? Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult? Function(PlatformFile poDocument)? removePoDocument,
    TResult? Function()? submitTicket,
  }) {
    return disclaimerConsent?.call(newValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo,
            User user, String chatUrl)?
        initialize,
    TResult Function(CustomerTicketType customerTicketType)? selectTicketType,
    TResult Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)?
        selectTicketSubCategoryType,
    TResult Function(TicketPriority ticketPriority)? selectPriority,
    TResult Function(bool newValue)? disclaimerConsent,
    TResult Function(SubmitTicketLabel label, String newValue)? onTextChange,
    TResult Function()? validateForm,
    TResult Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult Function(PlatformFile poDocument)? removePoDocument,
    TResult Function()? submitTicket,
    required TResult orElse(),
  }) {
    if (disclaimerConsent != null) {
      return disclaimerConsent(newValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SelectTicketType value) selectTicketType,
    required TResult Function(_SelectTicketSubCategoryType value)
        selectTicketSubCategoryType,
    required TResult Function(_SelectPriority value) selectPriority,
    required TResult Function(_DisclaimerConsent value) disclaimerConsent,
    required TResult Function(_OnTextChange value) onTextChange,
    required TResult Function(_ValidateForm value) validateForm,
    required TResult Function(_AddPoDocument value) addPoDocument,
    required TResult Function(_RemovePoDocument value) removePoDocument,
    required TResult Function(_SubmitTicket value) submitTicket,
  }) {
    return disclaimerConsent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SelectTicketType value)? selectTicketType,
    TResult? Function(_SelectTicketSubCategoryType value)?
        selectTicketSubCategoryType,
    TResult? Function(_SelectPriority value)? selectPriority,
    TResult? Function(_DisclaimerConsent value)? disclaimerConsent,
    TResult? Function(_OnTextChange value)? onTextChange,
    TResult? Function(_ValidateForm value)? validateForm,
    TResult? Function(_AddPoDocument value)? addPoDocument,
    TResult? Function(_RemovePoDocument value)? removePoDocument,
    TResult? Function(_SubmitTicket value)? submitTicket,
  }) {
    return disclaimerConsent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SelectTicketType value)? selectTicketType,
    TResult Function(_SelectTicketSubCategoryType value)?
        selectTicketSubCategoryType,
    TResult Function(_SelectPriority value)? selectPriority,
    TResult Function(_DisclaimerConsent value)? disclaimerConsent,
    TResult Function(_OnTextChange value)? onTextChange,
    TResult Function(_ValidateForm value)? validateForm,
    TResult Function(_AddPoDocument value)? addPoDocument,
    TResult Function(_RemovePoDocument value)? removePoDocument,
    TResult Function(_SubmitTicket value)? submitTicket,
    required TResult orElse(),
  }) {
    if (disclaimerConsent != null) {
      return disclaimerConsent(this);
    }
    return orElse();
  }
}

abstract class _DisclaimerConsent implements SubmitTicketEvent {
  const factory _DisclaimerConsent({required final bool newValue}) =
      _$DisclaimerConsentImpl;

  bool get newValue;
  @JsonKey(ignore: true)
  _$$DisclaimerConsentImplCopyWith<_$DisclaimerConsentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnTextChangeImplCopyWith<$Res> {
  factory _$$OnTextChangeImplCopyWith(
          _$OnTextChangeImpl value, $Res Function(_$OnTextChangeImpl) then) =
      __$$OnTextChangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SubmitTicketLabel label, String newValue});
}

/// @nodoc
class __$$OnTextChangeImplCopyWithImpl<$Res>
    extends _$SubmitTicketEventCopyWithImpl<$Res, _$OnTextChangeImpl>
    implements _$$OnTextChangeImplCopyWith<$Res> {
  __$$OnTextChangeImplCopyWithImpl(
      _$OnTextChangeImpl _value, $Res Function(_$OnTextChangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? newValue = null,
  }) {
    return _then(_$OnTextChangeImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as SubmitTicketLabel,
      newValue: null == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnTextChangeImpl implements _OnTextChange {
  const _$OnTextChangeImpl({required this.label, required this.newValue});

  @override
  final SubmitTicketLabel label;
  @override
  final String newValue;

  @override
  String toString() {
    return 'SubmitTicketEvent.onTextChange(label: $label, newValue: $newValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnTextChangeImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.newValue, newValue) ||
                other.newValue == newValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, newValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnTextChangeImplCopyWith<_$OnTextChangeImpl> get copyWith =>
      __$$OnTextChangeImplCopyWithImpl<_$OnTextChangeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo, User user, String chatUrl)
        initialize,
    required TResult Function(CustomerTicketType customerTicketType)
        selectTicketType,
    required TResult Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)
        selectTicketSubCategoryType,
    required TResult Function(TicketPriority ticketPriority) selectPriority,
    required TResult Function(bool newValue) disclaimerConsent,
    required TResult Function(SubmitTicketLabel label, String newValue)
        onTextChange,
    required TResult Function() validateForm,
    required TResult Function(List<PlatformFile> poDocuments) addPoDocument,
    required TResult Function(PlatformFile poDocument) removePoDocument,
    required TResult Function() submitTicket,
  }) {
    return onTextChange(label, newValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo,
            User user, String chatUrl)?
        initialize,
    TResult? Function(CustomerTicketType customerTicketType)? selectTicketType,
    TResult? Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)?
        selectTicketSubCategoryType,
    TResult? Function(TicketPriority ticketPriority)? selectPriority,
    TResult? Function(bool newValue)? disclaimerConsent,
    TResult? Function(SubmitTicketLabel label, String newValue)? onTextChange,
    TResult? Function()? validateForm,
    TResult? Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult? Function(PlatformFile poDocument)? removePoDocument,
    TResult? Function()? submitTicket,
  }) {
    return onTextChange?.call(label, newValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo,
            User user, String chatUrl)?
        initialize,
    TResult Function(CustomerTicketType customerTicketType)? selectTicketType,
    TResult Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)?
        selectTicketSubCategoryType,
    TResult Function(TicketPriority ticketPriority)? selectPriority,
    TResult Function(bool newValue)? disclaimerConsent,
    TResult Function(SubmitTicketLabel label, String newValue)? onTextChange,
    TResult Function()? validateForm,
    TResult Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult Function(PlatformFile poDocument)? removePoDocument,
    TResult Function()? submitTicket,
    required TResult orElse(),
  }) {
    if (onTextChange != null) {
      return onTextChange(label, newValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SelectTicketType value) selectTicketType,
    required TResult Function(_SelectTicketSubCategoryType value)
        selectTicketSubCategoryType,
    required TResult Function(_SelectPriority value) selectPriority,
    required TResult Function(_DisclaimerConsent value) disclaimerConsent,
    required TResult Function(_OnTextChange value) onTextChange,
    required TResult Function(_ValidateForm value) validateForm,
    required TResult Function(_AddPoDocument value) addPoDocument,
    required TResult Function(_RemovePoDocument value) removePoDocument,
    required TResult Function(_SubmitTicket value) submitTicket,
  }) {
    return onTextChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SelectTicketType value)? selectTicketType,
    TResult? Function(_SelectTicketSubCategoryType value)?
        selectTicketSubCategoryType,
    TResult? Function(_SelectPriority value)? selectPriority,
    TResult? Function(_DisclaimerConsent value)? disclaimerConsent,
    TResult? Function(_OnTextChange value)? onTextChange,
    TResult? Function(_ValidateForm value)? validateForm,
    TResult? Function(_AddPoDocument value)? addPoDocument,
    TResult? Function(_RemovePoDocument value)? removePoDocument,
    TResult? Function(_SubmitTicket value)? submitTicket,
  }) {
    return onTextChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SelectTicketType value)? selectTicketType,
    TResult Function(_SelectTicketSubCategoryType value)?
        selectTicketSubCategoryType,
    TResult Function(_SelectPriority value)? selectPriority,
    TResult Function(_DisclaimerConsent value)? disclaimerConsent,
    TResult Function(_OnTextChange value)? onTextChange,
    TResult Function(_ValidateForm value)? validateForm,
    TResult Function(_AddPoDocument value)? addPoDocument,
    TResult Function(_RemovePoDocument value)? removePoDocument,
    TResult Function(_SubmitTicket value)? submitTicket,
    required TResult orElse(),
  }) {
    if (onTextChange != null) {
      return onTextChange(this);
    }
    return orElse();
  }
}

abstract class _OnTextChange implements SubmitTicketEvent {
  const factory _OnTextChange(
      {required final SubmitTicketLabel label,
      required final String newValue}) = _$OnTextChangeImpl;

  SubmitTicketLabel get label;
  String get newValue;
  @JsonKey(ignore: true)
  _$$OnTextChangeImplCopyWith<_$OnTextChangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidateFormImplCopyWith<$Res> {
  factory _$$ValidateFormImplCopyWith(
          _$ValidateFormImpl value, $Res Function(_$ValidateFormImpl) then) =
      __$$ValidateFormImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ValidateFormImplCopyWithImpl<$Res>
    extends _$SubmitTicketEventCopyWithImpl<$Res, _$ValidateFormImpl>
    implements _$$ValidateFormImplCopyWith<$Res> {
  __$$ValidateFormImplCopyWithImpl(
      _$ValidateFormImpl _value, $Res Function(_$ValidateFormImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ValidateFormImpl implements _ValidateForm {
  const _$ValidateFormImpl();

  @override
  String toString() {
    return 'SubmitTicketEvent.validateForm()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ValidateFormImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo, User user, String chatUrl)
        initialize,
    required TResult Function(CustomerTicketType customerTicketType)
        selectTicketType,
    required TResult Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)
        selectTicketSubCategoryType,
    required TResult Function(TicketPriority ticketPriority) selectPriority,
    required TResult Function(bool newValue) disclaimerConsent,
    required TResult Function(SubmitTicketLabel label, String newValue)
        onTextChange,
    required TResult Function() validateForm,
    required TResult Function(List<PlatformFile> poDocuments) addPoDocument,
    required TResult Function(PlatformFile poDocument) removePoDocument,
    required TResult Function() submitTicket,
  }) {
    return validateForm();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo,
            User user, String chatUrl)?
        initialize,
    TResult? Function(CustomerTicketType customerTicketType)? selectTicketType,
    TResult? Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)?
        selectTicketSubCategoryType,
    TResult? Function(TicketPriority ticketPriority)? selectPriority,
    TResult? Function(bool newValue)? disclaimerConsent,
    TResult? Function(SubmitTicketLabel label, String newValue)? onTextChange,
    TResult? Function()? validateForm,
    TResult? Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult? Function(PlatformFile poDocument)? removePoDocument,
    TResult? Function()? submitTicket,
  }) {
    return validateForm?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo,
            User user, String chatUrl)?
        initialize,
    TResult Function(CustomerTicketType customerTicketType)? selectTicketType,
    TResult Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)?
        selectTicketSubCategoryType,
    TResult Function(TicketPriority ticketPriority)? selectPriority,
    TResult Function(bool newValue)? disclaimerConsent,
    TResult Function(SubmitTicketLabel label, String newValue)? onTextChange,
    TResult Function()? validateForm,
    TResult Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult Function(PlatformFile poDocument)? removePoDocument,
    TResult Function()? submitTicket,
    required TResult orElse(),
  }) {
    if (validateForm != null) {
      return validateForm();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SelectTicketType value) selectTicketType,
    required TResult Function(_SelectTicketSubCategoryType value)
        selectTicketSubCategoryType,
    required TResult Function(_SelectPriority value) selectPriority,
    required TResult Function(_DisclaimerConsent value) disclaimerConsent,
    required TResult Function(_OnTextChange value) onTextChange,
    required TResult Function(_ValidateForm value) validateForm,
    required TResult Function(_AddPoDocument value) addPoDocument,
    required TResult Function(_RemovePoDocument value) removePoDocument,
    required TResult Function(_SubmitTicket value) submitTicket,
  }) {
    return validateForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SelectTicketType value)? selectTicketType,
    TResult? Function(_SelectTicketSubCategoryType value)?
        selectTicketSubCategoryType,
    TResult? Function(_SelectPriority value)? selectPriority,
    TResult? Function(_DisclaimerConsent value)? disclaimerConsent,
    TResult? Function(_OnTextChange value)? onTextChange,
    TResult? Function(_ValidateForm value)? validateForm,
    TResult? Function(_AddPoDocument value)? addPoDocument,
    TResult? Function(_RemovePoDocument value)? removePoDocument,
    TResult? Function(_SubmitTicket value)? submitTicket,
  }) {
    return validateForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SelectTicketType value)? selectTicketType,
    TResult Function(_SelectTicketSubCategoryType value)?
        selectTicketSubCategoryType,
    TResult Function(_SelectPriority value)? selectPriority,
    TResult Function(_DisclaimerConsent value)? disclaimerConsent,
    TResult Function(_OnTextChange value)? onTextChange,
    TResult Function(_ValidateForm value)? validateForm,
    TResult Function(_AddPoDocument value)? addPoDocument,
    TResult Function(_RemovePoDocument value)? removePoDocument,
    TResult Function(_SubmitTicket value)? submitTicket,
    required TResult orElse(),
  }) {
    if (validateForm != null) {
      return validateForm(this);
    }
    return orElse();
  }
}

abstract class _ValidateForm implements SubmitTicketEvent {
  const factory _ValidateForm() = _$ValidateFormImpl;
}

/// @nodoc
abstract class _$$AddPoDocumentImplCopyWith<$Res> {
  factory _$$AddPoDocumentImplCopyWith(
          _$AddPoDocumentImpl value, $Res Function(_$AddPoDocumentImpl) then) =
      __$$AddPoDocumentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PlatformFile> poDocuments});
}

/// @nodoc
class __$$AddPoDocumentImplCopyWithImpl<$Res>
    extends _$SubmitTicketEventCopyWithImpl<$Res, _$AddPoDocumentImpl>
    implements _$$AddPoDocumentImplCopyWith<$Res> {
  __$$AddPoDocumentImplCopyWithImpl(
      _$AddPoDocumentImpl _value, $Res Function(_$AddPoDocumentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poDocuments = null,
  }) {
    return _then(_$AddPoDocumentImpl(
      poDocuments: null == poDocuments
          ? _value._poDocuments
          : poDocuments // ignore: cast_nullable_to_non_nullable
              as List<PlatformFile>,
    ));
  }
}

/// @nodoc

class _$AddPoDocumentImpl implements _AddPoDocument {
  const _$AddPoDocumentImpl({required final List<PlatformFile> poDocuments})
      : _poDocuments = poDocuments;

  final List<PlatformFile> _poDocuments;
  @override
  List<PlatformFile> get poDocuments {
    if (_poDocuments is EqualUnmodifiableListView) return _poDocuments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_poDocuments);
  }

  @override
  String toString() {
    return 'SubmitTicketEvent.addPoDocument(poDocuments: $poDocuments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPoDocumentImpl &&
            const DeepCollectionEquality()
                .equals(other._poDocuments, _poDocuments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_poDocuments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPoDocumentImplCopyWith<_$AddPoDocumentImpl> get copyWith =>
      __$$AddPoDocumentImplCopyWithImpl<_$AddPoDocumentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo, User user, String chatUrl)
        initialize,
    required TResult Function(CustomerTicketType customerTicketType)
        selectTicketType,
    required TResult Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)
        selectTicketSubCategoryType,
    required TResult Function(TicketPriority ticketPriority) selectPriority,
    required TResult Function(bool newValue) disclaimerConsent,
    required TResult Function(SubmitTicketLabel label, String newValue)
        onTextChange,
    required TResult Function() validateForm,
    required TResult Function(List<PlatformFile> poDocuments) addPoDocument,
    required TResult Function(PlatformFile poDocument) removePoDocument,
    required TResult Function() submitTicket,
  }) {
    return addPoDocument(poDocuments);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo,
            User user, String chatUrl)?
        initialize,
    TResult? Function(CustomerTicketType customerTicketType)? selectTicketType,
    TResult? Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)?
        selectTicketSubCategoryType,
    TResult? Function(TicketPriority ticketPriority)? selectPriority,
    TResult? Function(bool newValue)? disclaimerConsent,
    TResult? Function(SubmitTicketLabel label, String newValue)? onTextChange,
    TResult? Function()? validateForm,
    TResult? Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult? Function(PlatformFile poDocument)? removePoDocument,
    TResult? Function()? submitTicket,
  }) {
    return addPoDocument?.call(poDocuments);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo,
            User user, String chatUrl)?
        initialize,
    TResult Function(CustomerTicketType customerTicketType)? selectTicketType,
    TResult Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)?
        selectTicketSubCategoryType,
    TResult Function(TicketPriority ticketPriority)? selectPriority,
    TResult Function(bool newValue)? disclaimerConsent,
    TResult Function(SubmitTicketLabel label, String newValue)? onTextChange,
    TResult Function()? validateForm,
    TResult Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult Function(PlatformFile poDocument)? removePoDocument,
    TResult Function()? submitTicket,
    required TResult orElse(),
  }) {
    if (addPoDocument != null) {
      return addPoDocument(poDocuments);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SelectTicketType value) selectTicketType,
    required TResult Function(_SelectTicketSubCategoryType value)
        selectTicketSubCategoryType,
    required TResult Function(_SelectPriority value) selectPriority,
    required TResult Function(_DisclaimerConsent value) disclaimerConsent,
    required TResult Function(_OnTextChange value) onTextChange,
    required TResult Function(_ValidateForm value) validateForm,
    required TResult Function(_AddPoDocument value) addPoDocument,
    required TResult Function(_RemovePoDocument value) removePoDocument,
    required TResult Function(_SubmitTicket value) submitTicket,
  }) {
    return addPoDocument(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SelectTicketType value)? selectTicketType,
    TResult? Function(_SelectTicketSubCategoryType value)?
        selectTicketSubCategoryType,
    TResult? Function(_SelectPriority value)? selectPriority,
    TResult? Function(_DisclaimerConsent value)? disclaimerConsent,
    TResult? Function(_OnTextChange value)? onTextChange,
    TResult? Function(_ValidateForm value)? validateForm,
    TResult? Function(_AddPoDocument value)? addPoDocument,
    TResult? Function(_RemovePoDocument value)? removePoDocument,
    TResult? Function(_SubmitTicket value)? submitTicket,
  }) {
    return addPoDocument?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SelectTicketType value)? selectTicketType,
    TResult Function(_SelectTicketSubCategoryType value)?
        selectTicketSubCategoryType,
    TResult Function(_SelectPriority value)? selectPriority,
    TResult Function(_DisclaimerConsent value)? disclaimerConsent,
    TResult Function(_OnTextChange value)? onTextChange,
    TResult Function(_ValidateForm value)? validateForm,
    TResult Function(_AddPoDocument value)? addPoDocument,
    TResult Function(_RemovePoDocument value)? removePoDocument,
    TResult Function(_SubmitTicket value)? submitTicket,
    required TResult orElse(),
  }) {
    if (addPoDocument != null) {
      return addPoDocument(this);
    }
    return orElse();
  }
}

abstract class _AddPoDocument implements SubmitTicketEvent {
  const factory _AddPoDocument(
      {required final List<PlatformFile> poDocuments}) = _$AddPoDocumentImpl;

  List<PlatformFile> get poDocuments;
  @JsonKey(ignore: true)
  _$$AddPoDocumentImplCopyWith<_$AddPoDocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemovePoDocumentImplCopyWith<$Res> {
  factory _$$RemovePoDocumentImplCopyWith(_$RemovePoDocumentImpl value,
          $Res Function(_$RemovePoDocumentImpl) then) =
      __$$RemovePoDocumentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PlatformFile poDocument});
}

/// @nodoc
class __$$RemovePoDocumentImplCopyWithImpl<$Res>
    extends _$SubmitTicketEventCopyWithImpl<$Res, _$RemovePoDocumentImpl>
    implements _$$RemovePoDocumentImplCopyWith<$Res> {
  __$$RemovePoDocumentImplCopyWithImpl(_$RemovePoDocumentImpl _value,
      $Res Function(_$RemovePoDocumentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poDocument = null,
  }) {
    return _then(_$RemovePoDocumentImpl(
      poDocument: null == poDocument
          ? _value.poDocument
          : poDocument // ignore: cast_nullable_to_non_nullable
              as PlatformFile,
    ));
  }
}

/// @nodoc

class _$RemovePoDocumentImpl implements _RemovePoDocument {
  const _$RemovePoDocumentImpl({required this.poDocument});

  @override
  final PlatformFile poDocument;

  @override
  String toString() {
    return 'SubmitTicketEvent.removePoDocument(poDocument: $poDocument)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemovePoDocumentImpl &&
            (identical(other.poDocument, poDocument) ||
                other.poDocument == poDocument));
  }

  @override
  int get hashCode => Object.hash(runtimeType, poDocument);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemovePoDocumentImplCopyWith<_$RemovePoDocumentImpl> get copyWith =>
      __$$RemovePoDocumentImplCopyWithImpl<_$RemovePoDocumentImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo, User user, String chatUrl)
        initialize,
    required TResult Function(CustomerTicketType customerTicketType)
        selectTicketType,
    required TResult Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)
        selectTicketSubCategoryType,
    required TResult Function(TicketPriority ticketPriority) selectPriority,
    required TResult Function(bool newValue) disclaimerConsent,
    required TResult Function(SubmitTicketLabel label, String newValue)
        onTextChange,
    required TResult Function() validateForm,
    required TResult Function(List<PlatformFile> poDocuments) addPoDocument,
    required TResult Function(PlatformFile poDocument) removePoDocument,
    required TResult Function() submitTicket,
  }) {
    return removePoDocument(poDocument);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo,
            User user, String chatUrl)?
        initialize,
    TResult? Function(CustomerTicketType customerTicketType)? selectTicketType,
    TResult? Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)?
        selectTicketSubCategoryType,
    TResult? Function(TicketPriority ticketPriority)? selectPriority,
    TResult? Function(bool newValue)? disclaimerConsent,
    TResult? Function(SubmitTicketLabel label, String newValue)? onTextChange,
    TResult? Function()? validateForm,
    TResult? Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult? Function(PlatformFile poDocument)? removePoDocument,
    TResult? Function()? submitTicket,
  }) {
    return removePoDocument?.call(poDocument);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo,
            User user, String chatUrl)?
        initialize,
    TResult Function(CustomerTicketType customerTicketType)? selectTicketType,
    TResult Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)?
        selectTicketSubCategoryType,
    TResult Function(TicketPriority ticketPriority)? selectPriority,
    TResult Function(bool newValue)? disclaimerConsent,
    TResult Function(SubmitTicketLabel label, String newValue)? onTextChange,
    TResult Function()? validateForm,
    TResult Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult Function(PlatformFile poDocument)? removePoDocument,
    TResult Function()? submitTicket,
    required TResult orElse(),
  }) {
    if (removePoDocument != null) {
      return removePoDocument(poDocument);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SelectTicketType value) selectTicketType,
    required TResult Function(_SelectTicketSubCategoryType value)
        selectTicketSubCategoryType,
    required TResult Function(_SelectPriority value) selectPriority,
    required TResult Function(_DisclaimerConsent value) disclaimerConsent,
    required TResult Function(_OnTextChange value) onTextChange,
    required TResult Function(_ValidateForm value) validateForm,
    required TResult Function(_AddPoDocument value) addPoDocument,
    required TResult Function(_RemovePoDocument value) removePoDocument,
    required TResult Function(_SubmitTicket value) submitTicket,
  }) {
    return removePoDocument(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SelectTicketType value)? selectTicketType,
    TResult? Function(_SelectTicketSubCategoryType value)?
        selectTicketSubCategoryType,
    TResult? Function(_SelectPriority value)? selectPriority,
    TResult? Function(_DisclaimerConsent value)? disclaimerConsent,
    TResult? Function(_OnTextChange value)? onTextChange,
    TResult? Function(_ValidateForm value)? validateForm,
    TResult? Function(_AddPoDocument value)? addPoDocument,
    TResult? Function(_RemovePoDocument value)? removePoDocument,
    TResult? Function(_SubmitTicket value)? submitTicket,
  }) {
    return removePoDocument?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SelectTicketType value)? selectTicketType,
    TResult Function(_SelectTicketSubCategoryType value)?
        selectTicketSubCategoryType,
    TResult Function(_SelectPriority value)? selectPriority,
    TResult Function(_DisclaimerConsent value)? disclaimerConsent,
    TResult Function(_OnTextChange value)? onTextChange,
    TResult Function(_ValidateForm value)? validateForm,
    TResult Function(_AddPoDocument value)? addPoDocument,
    TResult Function(_RemovePoDocument value)? removePoDocument,
    TResult Function(_SubmitTicket value)? submitTicket,
    required TResult orElse(),
  }) {
    if (removePoDocument != null) {
      return removePoDocument(this);
    }
    return orElse();
  }
}

abstract class _RemovePoDocument implements SubmitTicketEvent {
  const factory _RemovePoDocument({required final PlatformFile poDocument}) =
      _$RemovePoDocumentImpl;

  PlatformFile get poDocument;
  @JsonKey(ignore: true)
  _$$RemovePoDocumentImplCopyWith<_$RemovePoDocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitTicketImplCopyWith<$Res> {
  factory _$$SubmitTicketImplCopyWith(
          _$SubmitTicketImpl value, $Res Function(_$SubmitTicketImpl) then) =
      __$$SubmitTicketImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubmitTicketImplCopyWithImpl<$Res>
    extends _$SubmitTicketEventCopyWithImpl<$Res, _$SubmitTicketImpl>
    implements _$$SubmitTicketImplCopyWith<$Res> {
  __$$SubmitTicketImplCopyWithImpl(
      _$SubmitTicketImpl _value, $Res Function(_$SubmitTicketImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SubmitTicketImpl implements _SubmitTicket {
  const _$SubmitTicketImpl();

  @override
  String toString() {
    return 'SubmitTicketEvent.submitTicket()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SubmitTicketImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo, User user, String chatUrl)
        initialize,
    required TResult Function(CustomerTicketType customerTicketType)
        selectTicketType,
    required TResult Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)
        selectTicketSubCategoryType,
    required TResult Function(TicketPriority ticketPriority) selectPriority,
    required TResult Function(bool newValue) disclaimerConsent,
    required TResult Function(SubmitTicketLabel label, String newValue)
        onTextChange,
    required TResult Function() validateForm,
    required TResult Function(List<PlatformFile> poDocuments) addPoDocument,
    required TResult Function(PlatformFile poDocument) removePoDocument,
    required TResult Function() submitTicket,
  }) {
    return submitTicket();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo,
            User user, String chatUrl)?
        initialize,
    TResult? Function(CustomerTicketType customerTicketType)? selectTicketType,
    TResult? Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)?
        selectTicketSubCategoryType,
    TResult? Function(TicketPriority ticketPriority)? selectPriority,
    TResult? Function(bool newValue)? disclaimerConsent,
    TResult? Function(SubmitTicketLabel label, String newValue)? onTextChange,
    TResult? Function()? validateForm,
    TResult? Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult? Function(PlatformFile poDocument)? removePoDocument,
    TResult? Function()? submitTicket,
  }) {
    return submitTicket?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo,
            User user, String chatUrl)?
        initialize,
    TResult Function(CustomerTicketType customerTicketType)? selectTicketType,
    TResult Function(
            CustomerTicketSubCategoryType customerTicketSubCategoryType)?
        selectTicketSubCategoryType,
    TResult Function(TicketPriority ticketPriority)? selectPriority,
    TResult Function(bool newValue)? disclaimerConsent,
    TResult Function(SubmitTicketLabel label, String newValue)? onTextChange,
    TResult Function()? validateForm,
    TResult Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult Function(PlatformFile poDocument)? removePoDocument,
    TResult Function()? submitTicket,
    required TResult orElse(),
  }) {
    if (submitTicket != null) {
      return submitTicket();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SelectTicketType value) selectTicketType,
    required TResult Function(_SelectTicketSubCategoryType value)
        selectTicketSubCategoryType,
    required TResult Function(_SelectPriority value) selectPriority,
    required TResult Function(_DisclaimerConsent value) disclaimerConsent,
    required TResult Function(_OnTextChange value) onTextChange,
    required TResult Function(_ValidateForm value) validateForm,
    required TResult Function(_AddPoDocument value) addPoDocument,
    required TResult Function(_RemovePoDocument value) removePoDocument,
    required TResult Function(_SubmitTicket value) submitTicket,
  }) {
    return submitTicket(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SelectTicketType value)? selectTicketType,
    TResult? Function(_SelectTicketSubCategoryType value)?
        selectTicketSubCategoryType,
    TResult? Function(_SelectPriority value)? selectPriority,
    TResult? Function(_DisclaimerConsent value)? disclaimerConsent,
    TResult? Function(_OnTextChange value)? onTextChange,
    TResult? Function(_ValidateForm value)? validateForm,
    TResult? Function(_AddPoDocument value)? addPoDocument,
    TResult? Function(_RemovePoDocument value)? removePoDocument,
    TResult? Function(_SubmitTicket value)? submitTicket,
  }) {
    return submitTicket?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SelectTicketType value)? selectTicketType,
    TResult Function(_SelectTicketSubCategoryType value)?
        selectTicketSubCategoryType,
    TResult Function(_SelectPriority value)? selectPriority,
    TResult Function(_DisclaimerConsent value)? disclaimerConsent,
    TResult Function(_OnTextChange value)? onTextChange,
    TResult Function(_ValidateForm value)? validateForm,
    TResult Function(_AddPoDocument value)? addPoDocument,
    TResult Function(_RemovePoDocument value)? removePoDocument,
    TResult Function(_SubmitTicket value)? submitTicket,
    required TResult orElse(),
  }) {
    if (submitTicket != null) {
      return submitTicket(this);
    }
    return orElse();
  }
}

abstract class _SubmitTicket implements SubmitTicketEvent {
  const factory _SubmitTicket() = _$SubmitTicketImpl;
}

/// @nodoc
mixin _$SubmitTicketState {
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  EZCSTicket get ezcsTicket => throw _privateConstructorUsedError;
  bool get agreeToDisclaimer => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get showUploadExeedMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubmitTicketStateCopyWith<SubmitTicketState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitTicketStateCopyWith<$Res> {
  factory $SubmitTicketStateCopyWith(
          SubmitTicketState value, $Res Function(SubmitTicketState) then) =
      _$SubmitTicketStateCopyWithImpl<$Res, SubmitTicketState>;
  @useResult
  $Res call(
      {CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      User user,
      EZCSTicket ezcsTicket,
      bool agreeToDisclaimer,
      bool showErrorMessages,
      bool isLoading,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool showUploadExeedMessage});

  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $UserCopyWith<$Res> get user;
  $EZCSTicketCopyWith<$Res> get ezcsTicket;
}

/// @nodoc
class _$SubmitTicketStateCopyWithImpl<$Res, $Val extends SubmitTicketState>
    implements $SubmitTicketStateCopyWith<$Res> {
  _$SubmitTicketStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? user = null,
    Object? ezcsTicket = null,
    Object? agreeToDisclaimer = null,
    Object? showErrorMessages = null,
    Object? isLoading = null,
    Object? failureOrSuccessOption = null,
    Object? showUploadExeedMessage = null,
  }) {
    return _then(_value.copyWith(
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      ezcsTicket: null == ezcsTicket
          ? _value.ezcsTicket
          : ezcsTicket // ignore: cast_nullable_to_non_nullable
              as EZCSTicket,
      agreeToDisclaimer: null == agreeToDisclaimer
          ? _value.agreeToDisclaimer
          : agreeToDisclaimer // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      showUploadExeedMessage: null == showUploadExeedMessage
          ? _value.showUploadExeedMessage
          : showUploadExeedMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EZCSTicketCopyWith<$Res> get ezcsTicket {
    return $EZCSTicketCopyWith<$Res>(_value.ezcsTicket, (value) {
      return _then(_value.copyWith(ezcsTicket: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubmitTicketStateImplCopyWith<$Res>
    implements $SubmitTicketStateCopyWith<$Res> {
  factory _$$SubmitTicketStateImplCopyWith(_$SubmitTicketStateImpl value,
          $Res Function(_$SubmitTicketStateImpl) then) =
      __$$SubmitTicketStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      User user,
      EZCSTicket ezcsTicket,
      bool agreeToDisclaimer,
      bool showErrorMessages,
      bool isLoading,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool showUploadExeedMessage});

  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  @override
  $UserCopyWith<$Res> get user;
  @override
  $EZCSTicketCopyWith<$Res> get ezcsTicket;
}

/// @nodoc
class __$$SubmitTicketStateImplCopyWithImpl<$Res>
    extends _$SubmitTicketStateCopyWithImpl<$Res, _$SubmitTicketStateImpl>
    implements _$$SubmitTicketStateImplCopyWith<$Res> {
  __$$SubmitTicketStateImplCopyWithImpl(_$SubmitTicketStateImpl _value,
      $Res Function(_$SubmitTicketStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? user = null,
    Object? ezcsTicket = null,
    Object? agreeToDisclaimer = null,
    Object? showErrorMessages = null,
    Object? isLoading = null,
    Object? failureOrSuccessOption = null,
    Object? showUploadExeedMessage = null,
  }) {
    return _then(_$SubmitTicketStateImpl(
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      ezcsTicket: null == ezcsTicket
          ? _value.ezcsTicket
          : ezcsTicket // ignore: cast_nullable_to_non_nullable
              as EZCSTicket,
      agreeToDisclaimer: null == agreeToDisclaimer
          ? _value.agreeToDisclaimer
          : agreeToDisclaimer // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      showUploadExeedMessage: null == showUploadExeedMessage
          ? _value.showUploadExeedMessage
          : showUploadExeedMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SubmitTicketStateImpl extends _SubmitTicketState {
  const _$SubmitTicketStateImpl(
      {required this.customerCodeInfo,
      required this.shipToInfo,
      required this.user,
      required this.ezcsTicket,
      required this.agreeToDisclaimer,
      required this.showErrorMessages,
      required this.isLoading,
      required this.failureOrSuccessOption,
      required this.showUploadExeedMessage})
      : super._();

  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final User user;
  @override
  final EZCSTicket ezcsTicket;
  @override
  final bool agreeToDisclaimer;
  @override
  final bool showErrorMessages;
  @override
  final bool isLoading;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  @override
  final bool showUploadExeedMessage;

  @override
  String toString() {
    return 'SubmitTicketState(customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, user: $user, ezcsTicket: $ezcsTicket, agreeToDisclaimer: $agreeToDisclaimer, showErrorMessages: $showErrorMessages, isLoading: $isLoading, failureOrSuccessOption: $failureOrSuccessOption, showUploadExeedMessage: $showUploadExeedMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitTicketStateImpl &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.ezcsTicket, ezcsTicket) ||
                other.ezcsTicket == ezcsTicket) &&
            (identical(other.agreeToDisclaimer, agreeToDisclaimer) ||
                other.agreeToDisclaimer == agreeToDisclaimer) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.showUploadExeedMessage, showUploadExeedMessage) ||
                other.showUploadExeedMessage == showUploadExeedMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      customerCodeInfo,
      shipToInfo,
      user,
      ezcsTicket,
      agreeToDisclaimer,
      showErrorMessages,
      isLoading,
      failureOrSuccessOption,
      showUploadExeedMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitTicketStateImplCopyWith<_$SubmitTicketStateImpl> get copyWith =>
      __$$SubmitTicketStateImplCopyWithImpl<_$SubmitTicketStateImpl>(
          this, _$identity);
}

abstract class _SubmitTicketState extends SubmitTicketState {
  const factory _SubmitTicketState(
      {required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final User user,
      required final EZCSTicket ezcsTicket,
      required final bool agreeToDisclaimer,
      required final bool showErrorMessages,
      required final bool isLoading,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final bool showUploadExeedMessage}) = _$SubmitTicketStateImpl;
  const _SubmitTicketState._() : super._();

  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  ShipToInfo get shipToInfo;
  @override
  User get user;
  @override
  EZCSTicket get ezcsTicket;
  @override
  bool get agreeToDisclaimer;
  @override
  bool get showErrorMessages;
  @override
  bool get isLoading;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  bool get showUploadExeedMessage;
  @override
  @JsonKey(ignore: true)
  _$$SubmitTicketStateImplCopyWith<_$SubmitTicketStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
