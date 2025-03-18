// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'announcement_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnnouncementEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAnnouncement,
    required TResult Function() close,
    required TResult Function() clearBannerId,
    required TResult Function() clearClosedTime,
    required TResult Function() show,
    required TResult Function(
            DateTimeStringValue dateTime, StorageType storageType)
        setClosedTime,
    required TResult Function() getClosedTime,
    required TResult Function(SalesOrg salesOrg) getMaintenanceBanners,
    required TResult Function(bool preferSalesOrgLanguage) changePreferLanguage,
    required TResult Function(String id) closedBannerId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAnnouncement,
    TResult? Function()? close,
    TResult? Function()? clearBannerId,
    TResult? Function()? clearClosedTime,
    TResult? Function()? show,
    TResult? Function(DateTimeStringValue dateTime, StorageType storageType)?
        setClosedTime,
    TResult? Function()? getClosedTime,
    TResult? Function(SalesOrg salesOrg)? getMaintenanceBanners,
    TResult? Function(bool preferSalesOrgLanguage)? changePreferLanguage,
    TResult? Function(String id)? closedBannerId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAnnouncement,
    TResult Function()? close,
    TResult Function()? clearBannerId,
    TResult Function()? clearClosedTime,
    TResult Function()? show,
    TResult Function(DateTimeStringValue dateTime, StorageType storageType)?
        setClosedTime,
    TResult Function()? getClosedTime,
    TResult Function(SalesOrg salesOrg)? getMaintenanceBanners,
    TResult Function(bool preferSalesOrgLanguage)? changePreferLanguage,
    TResult Function(String id)? closedBannerId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAnnouncement value) getAnnouncement,
    required TResult Function(_Close value) close,
    required TResult Function(_ClearBannerId value) clearBannerId,
    required TResult Function(_ClearClosedTime value) clearClosedTime,
    required TResult Function(_Show value) show,
    required TResult Function(_SetDontShowDateTime value) setClosedTime,
    required TResult Function(_GetDontShowDateTime value) getClosedTime,
    required TResult Function(_GetMaintenanceBanners value)
        getMaintenanceBanners,
    required TResult Function(_ChangePreferLanguage value) changePreferLanguage,
    required TResult Function(_ClosedBannerId value) closedBannerId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAnnouncement value)? getAnnouncement,
    TResult? Function(_Close value)? close,
    TResult? Function(_ClearBannerId value)? clearBannerId,
    TResult? Function(_ClearClosedTime value)? clearClosedTime,
    TResult? Function(_Show value)? show,
    TResult? Function(_SetDontShowDateTime value)? setClosedTime,
    TResult? Function(_GetDontShowDateTime value)? getClosedTime,
    TResult? Function(_GetMaintenanceBanners value)? getMaintenanceBanners,
    TResult? Function(_ChangePreferLanguage value)? changePreferLanguage,
    TResult? Function(_ClosedBannerId value)? closedBannerId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAnnouncement value)? getAnnouncement,
    TResult Function(_Close value)? close,
    TResult Function(_ClearBannerId value)? clearBannerId,
    TResult Function(_ClearClosedTime value)? clearClosedTime,
    TResult Function(_Show value)? show,
    TResult Function(_SetDontShowDateTime value)? setClosedTime,
    TResult Function(_GetDontShowDateTime value)? getClosedTime,
    TResult Function(_GetMaintenanceBanners value)? getMaintenanceBanners,
    TResult Function(_ChangePreferLanguage value)? changePreferLanguage,
    TResult Function(_ClosedBannerId value)? closedBannerId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementEventCopyWith<$Res> {
  factory $AnnouncementEventCopyWith(
          AnnouncementEvent value, $Res Function(AnnouncementEvent) then) =
      _$AnnouncementEventCopyWithImpl<$Res, AnnouncementEvent>;
}

/// @nodoc
class _$AnnouncementEventCopyWithImpl<$Res, $Val extends AnnouncementEvent>
    implements $AnnouncementEventCopyWith<$Res> {
  _$AnnouncementEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetAnnouncementImplCopyWith<$Res> {
  factory _$$GetAnnouncementImplCopyWith(_$GetAnnouncementImpl value,
          $Res Function(_$GetAnnouncementImpl) then) =
      __$$GetAnnouncementImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAnnouncementImplCopyWithImpl<$Res>
    extends _$AnnouncementEventCopyWithImpl<$Res, _$GetAnnouncementImpl>
    implements _$$GetAnnouncementImplCopyWith<$Res> {
  __$$GetAnnouncementImplCopyWithImpl(
      _$GetAnnouncementImpl _value, $Res Function(_$GetAnnouncementImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAnnouncementImpl implements _GetAnnouncement {
  const _$GetAnnouncementImpl();

  @override
  String toString() {
    return 'AnnouncementEvent.getAnnouncement()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAnnouncementImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAnnouncement,
    required TResult Function() close,
    required TResult Function() clearBannerId,
    required TResult Function() clearClosedTime,
    required TResult Function() show,
    required TResult Function(
            DateTimeStringValue dateTime, StorageType storageType)
        setClosedTime,
    required TResult Function() getClosedTime,
    required TResult Function(SalesOrg salesOrg) getMaintenanceBanners,
    required TResult Function(bool preferSalesOrgLanguage) changePreferLanguage,
    required TResult Function(String id) closedBannerId,
  }) {
    return getAnnouncement();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAnnouncement,
    TResult? Function()? close,
    TResult? Function()? clearBannerId,
    TResult? Function()? clearClosedTime,
    TResult? Function()? show,
    TResult? Function(DateTimeStringValue dateTime, StorageType storageType)?
        setClosedTime,
    TResult? Function()? getClosedTime,
    TResult? Function(SalesOrg salesOrg)? getMaintenanceBanners,
    TResult? Function(bool preferSalesOrgLanguage)? changePreferLanguage,
    TResult? Function(String id)? closedBannerId,
  }) {
    return getAnnouncement?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAnnouncement,
    TResult Function()? close,
    TResult Function()? clearBannerId,
    TResult Function()? clearClosedTime,
    TResult Function()? show,
    TResult Function(DateTimeStringValue dateTime, StorageType storageType)?
        setClosedTime,
    TResult Function()? getClosedTime,
    TResult Function(SalesOrg salesOrg)? getMaintenanceBanners,
    TResult Function(bool preferSalesOrgLanguage)? changePreferLanguage,
    TResult Function(String id)? closedBannerId,
    required TResult orElse(),
  }) {
    if (getAnnouncement != null) {
      return getAnnouncement();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAnnouncement value) getAnnouncement,
    required TResult Function(_Close value) close,
    required TResult Function(_ClearBannerId value) clearBannerId,
    required TResult Function(_ClearClosedTime value) clearClosedTime,
    required TResult Function(_Show value) show,
    required TResult Function(_SetDontShowDateTime value) setClosedTime,
    required TResult Function(_GetDontShowDateTime value) getClosedTime,
    required TResult Function(_GetMaintenanceBanners value)
        getMaintenanceBanners,
    required TResult Function(_ChangePreferLanguage value) changePreferLanguage,
    required TResult Function(_ClosedBannerId value) closedBannerId,
  }) {
    return getAnnouncement(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAnnouncement value)? getAnnouncement,
    TResult? Function(_Close value)? close,
    TResult? Function(_ClearBannerId value)? clearBannerId,
    TResult? Function(_ClearClosedTime value)? clearClosedTime,
    TResult? Function(_Show value)? show,
    TResult? Function(_SetDontShowDateTime value)? setClosedTime,
    TResult? Function(_GetDontShowDateTime value)? getClosedTime,
    TResult? Function(_GetMaintenanceBanners value)? getMaintenanceBanners,
    TResult? Function(_ChangePreferLanguage value)? changePreferLanguage,
    TResult? Function(_ClosedBannerId value)? closedBannerId,
  }) {
    return getAnnouncement?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAnnouncement value)? getAnnouncement,
    TResult Function(_Close value)? close,
    TResult Function(_ClearBannerId value)? clearBannerId,
    TResult Function(_ClearClosedTime value)? clearClosedTime,
    TResult Function(_Show value)? show,
    TResult Function(_SetDontShowDateTime value)? setClosedTime,
    TResult Function(_GetDontShowDateTime value)? getClosedTime,
    TResult Function(_GetMaintenanceBanners value)? getMaintenanceBanners,
    TResult Function(_ChangePreferLanguage value)? changePreferLanguage,
    TResult Function(_ClosedBannerId value)? closedBannerId,
    required TResult orElse(),
  }) {
    if (getAnnouncement != null) {
      return getAnnouncement(this);
    }
    return orElse();
  }
}

abstract class _GetAnnouncement implements AnnouncementEvent {
  const factory _GetAnnouncement() = _$GetAnnouncementImpl;
}

/// @nodoc
abstract class _$$CloseImplCopyWith<$Res> {
  factory _$$CloseImplCopyWith(
          _$CloseImpl value, $Res Function(_$CloseImpl) then) =
      __$$CloseImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CloseImplCopyWithImpl<$Res>
    extends _$AnnouncementEventCopyWithImpl<$Res, _$CloseImpl>
    implements _$$CloseImplCopyWith<$Res> {
  __$$CloseImplCopyWithImpl(
      _$CloseImpl _value, $Res Function(_$CloseImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CloseImpl implements _Close {
  const _$CloseImpl();

  @override
  String toString() {
    return 'AnnouncementEvent.close()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CloseImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAnnouncement,
    required TResult Function() close,
    required TResult Function() clearBannerId,
    required TResult Function() clearClosedTime,
    required TResult Function() show,
    required TResult Function(
            DateTimeStringValue dateTime, StorageType storageType)
        setClosedTime,
    required TResult Function() getClosedTime,
    required TResult Function(SalesOrg salesOrg) getMaintenanceBanners,
    required TResult Function(bool preferSalesOrgLanguage) changePreferLanguage,
    required TResult Function(String id) closedBannerId,
  }) {
    return close();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAnnouncement,
    TResult? Function()? close,
    TResult? Function()? clearBannerId,
    TResult? Function()? clearClosedTime,
    TResult? Function()? show,
    TResult? Function(DateTimeStringValue dateTime, StorageType storageType)?
        setClosedTime,
    TResult? Function()? getClosedTime,
    TResult? Function(SalesOrg salesOrg)? getMaintenanceBanners,
    TResult? Function(bool preferSalesOrgLanguage)? changePreferLanguage,
    TResult? Function(String id)? closedBannerId,
  }) {
    return close?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAnnouncement,
    TResult Function()? close,
    TResult Function()? clearBannerId,
    TResult Function()? clearClosedTime,
    TResult Function()? show,
    TResult Function(DateTimeStringValue dateTime, StorageType storageType)?
        setClosedTime,
    TResult Function()? getClosedTime,
    TResult Function(SalesOrg salesOrg)? getMaintenanceBanners,
    TResult Function(bool preferSalesOrgLanguage)? changePreferLanguage,
    TResult Function(String id)? closedBannerId,
    required TResult orElse(),
  }) {
    if (close != null) {
      return close();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAnnouncement value) getAnnouncement,
    required TResult Function(_Close value) close,
    required TResult Function(_ClearBannerId value) clearBannerId,
    required TResult Function(_ClearClosedTime value) clearClosedTime,
    required TResult Function(_Show value) show,
    required TResult Function(_SetDontShowDateTime value) setClosedTime,
    required TResult Function(_GetDontShowDateTime value) getClosedTime,
    required TResult Function(_GetMaintenanceBanners value)
        getMaintenanceBanners,
    required TResult Function(_ChangePreferLanguage value) changePreferLanguage,
    required TResult Function(_ClosedBannerId value) closedBannerId,
  }) {
    return close(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAnnouncement value)? getAnnouncement,
    TResult? Function(_Close value)? close,
    TResult? Function(_ClearBannerId value)? clearBannerId,
    TResult? Function(_ClearClosedTime value)? clearClosedTime,
    TResult? Function(_Show value)? show,
    TResult? Function(_SetDontShowDateTime value)? setClosedTime,
    TResult? Function(_GetDontShowDateTime value)? getClosedTime,
    TResult? Function(_GetMaintenanceBanners value)? getMaintenanceBanners,
    TResult? Function(_ChangePreferLanguage value)? changePreferLanguage,
    TResult? Function(_ClosedBannerId value)? closedBannerId,
  }) {
    return close?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAnnouncement value)? getAnnouncement,
    TResult Function(_Close value)? close,
    TResult Function(_ClearBannerId value)? clearBannerId,
    TResult Function(_ClearClosedTime value)? clearClosedTime,
    TResult Function(_Show value)? show,
    TResult Function(_SetDontShowDateTime value)? setClosedTime,
    TResult Function(_GetDontShowDateTime value)? getClosedTime,
    TResult Function(_GetMaintenanceBanners value)? getMaintenanceBanners,
    TResult Function(_ChangePreferLanguage value)? changePreferLanguage,
    TResult Function(_ClosedBannerId value)? closedBannerId,
    required TResult orElse(),
  }) {
    if (close != null) {
      return close(this);
    }
    return orElse();
  }
}

abstract class _Close implements AnnouncementEvent {
  const factory _Close() = _$CloseImpl;
}

/// @nodoc
abstract class _$$ClearBannerIdImplCopyWith<$Res> {
  factory _$$ClearBannerIdImplCopyWith(
          _$ClearBannerIdImpl value, $Res Function(_$ClearBannerIdImpl) then) =
      __$$ClearBannerIdImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearBannerIdImplCopyWithImpl<$Res>
    extends _$AnnouncementEventCopyWithImpl<$Res, _$ClearBannerIdImpl>
    implements _$$ClearBannerIdImplCopyWith<$Res> {
  __$$ClearBannerIdImplCopyWithImpl(
      _$ClearBannerIdImpl _value, $Res Function(_$ClearBannerIdImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearBannerIdImpl implements _ClearBannerId {
  const _$ClearBannerIdImpl();

  @override
  String toString() {
    return 'AnnouncementEvent.clearBannerId()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearBannerIdImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAnnouncement,
    required TResult Function() close,
    required TResult Function() clearBannerId,
    required TResult Function() clearClosedTime,
    required TResult Function() show,
    required TResult Function(
            DateTimeStringValue dateTime, StorageType storageType)
        setClosedTime,
    required TResult Function() getClosedTime,
    required TResult Function(SalesOrg salesOrg) getMaintenanceBanners,
    required TResult Function(bool preferSalesOrgLanguage) changePreferLanguage,
    required TResult Function(String id) closedBannerId,
  }) {
    return clearBannerId();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAnnouncement,
    TResult? Function()? close,
    TResult? Function()? clearBannerId,
    TResult? Function()? clearClosedTime,
    TResult? Function()? show,
    TResult? Function(DateTimeStringValue dateTime, StorageType storageType)?
        setClosedTime,
    TResult? Function()? getClosedTime,
    TResult? Function(SalesOrg salesOrg)? getMaintenanceBanners,
    TResult? Function(bool preferSalesOrgLanguage)? changePreferLanguage,
    TResult? Function(String id)? closedBannerId,
  }) {
    return clearBannerId?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAnnouncement,
    TResult Function()? close,
    TResult Function()? clearBannerId,
    TResult Function()? clearClosedTime,
    TResult Function()? show,
    TResult Function(DateTimeStringValue dateTime, StorageType storageType)?
        setClosedTime,
    TResult Function()? getClosedTime,
    TResult Function(SalesOrg salesOrg)? getMaintenanceBanners,
    TResult Function(bool preferSalesOrgLanguage)? changePreferLanguage,
    TResult Function(String id)? closedBannerId,
    required TResult orElse(),
  }) {
    if (clearBannerId != null) {
      return clearBannerId();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAnnouncement value) getAnnouncement,
    required TResult Function(_Close value) close,
    required TResult Function(_ClearBannerId value) clearBannerId,
    required TResult Function(_ClearClosedTime value) clearClosedTime,
    required TResult Function(_Show value) show,
    required TResult Function(_SetDontShowDateTime value) setClosedTime,
    required TResult Function(_GetDontShowDateTime value) getClosedTime,
    required TResult Function(_GetMaintenanceBanners value)
        getMaintenanceBanners,
    required TResult Function(_ChangePreferLanguage value) changePreferLanguage,
    required TResult Function(_ClosedBannerId value) closedBannerId,
  }) {
    return clearBannerId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAnnouncement value)? getAnnouncement,
    TResult? Function(_Close value)? close,
    TResult? Function(_ClearBannerId value)? clearBannerId,
    TResult? Function(_ClearClosedTime value)? clearClosedTime,
    TResult? Function(_Show value)? show,
    TResult? Function(_SetDontShowDateTime value)? setClosedTime,
    TResult? Function(_GetDontShowDateTime value)? getClosedTime,
    TResult? Function(_GetMaintenanceBanners value)? getMaintenanceBanners,
    TResult? Function(_ChangePreferLanguage value)? changePreferLanguage,
    TResult? Function(_ClosedBannerId value)? closedBannerId,
  }) {
    return clearBannerId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAnnouncement value)? getAnnouncement,
    TResult Function(_Close value)? close,
    TResult Function(_ClearBannerId value)? clearBannerId,
    TResult Function(_ClearClosedTime value)? clearClosedTime,
    TResult Function(_Show value)? show,
    TResult Function(_SetDontShowDateTime value)? setClosedTime,
    TResult Function(_GetDontShowDateTime value)? getClosedTime,
    TResult Function(_GetMaintenanceBanners value)? getMaintenanceBanners,
    TResult Function(_ChangePreferLanguage value)? changePreferLanguage,
    TResult Function(_ClosedBannerId value)? closedBannerId,
    required TResult orElse(),
  }) {
    if (clearBannerId != null) {
      return clearBannerId(this);
    }
    return orElse();
  }
}

abstract class _ClearBannerId implements AnnouncementEvent {
  const factory _ClearBannerId() = _$ClearBannerIdImpl;
}

/// @nodoc
abstract class _$$ClearClosedTimeImplCopyWith<$Res> {
  factory _$$ClearClosedTimeImplCopyWith(_$ClearClosedTimeImpl value,
          $Res Function(_$ClearClosedTimeImpl) then) =
      __$$ClearClosedTimeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearClosedTimeImplCopyWithImpl<$Res>
    extends _$AnnouncementEventCopyWithImpl<$Res, _$ClearClosedTimeImpl>
    implements _$$ClearClosedTimeImplCopyWith<$Res> {
  __$$ClearClosedTimeImplCopyWithImpl(
      _$ClearClosedTimeImpl _value, $Res Function(_$ClearClosedTimeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearClosedTimeImpl implements _ClearClosedTime {
  const _$ClearClosedTimeImpl();

  @override
  String toString() {
    return 'AnnouncementEvent.clearClosedTime()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearClosedTimeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAnnouncement,
    required TResult Function() close,
    required TResult Function() clearBannerId,
    required TResult Function() clearClosedTime,
    required TResult Function() show,
    required TResult Function(
            DateTimeStringValue dateTime, StorageType storageType)
        setClosedTime,
    required TResult Function() getClosedTime,
    required TResult Function(SalesOrg salesOrg) getMaintenanceBanners,
    required TResult Function(bool preferSalesOrgLanguage) changePreferLanguage,
    required TResult Function(String id) closedBannerId,
  }) {
    return clearClosedTime();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAnnouncement,
    TResult? Function()? close,
    TResult? Function()? clearBannerId,
    TResult? Function()? clearClosedTime,
    TResult? Function()? show,
    TResult? Function(DateTimeStringValue dateTime, StorageType storageType)?
        setClosedTime,
    TResult? Function()? getClosedTime,
    TResult? Function(SalesOrg salesOrg)? getMaintenanceBanners,
    TResult? Function(bool preferSalesOrgLanguage)? changePreferLanguage,
    TResult? Function(String id)? closedBannerId,
  }) {
    return clearClosedTime?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAnnouncement,
    TResult Function()? close,
    TResult Function()? clearBannerId,
    TResult Function()? clearClosedTime,
    TResult Function()? show,
    TResult Function(DateTimeStringValue dateTime, StorageType storageType)?
        setClosedTime,
    TResult Function()? getClosedTime,
    TResult Function(SalesOrg salesOrg)? getMaintenanceBanners,
    TResult Function(bool preferSalesOrgLanguage)? changePreferLanguage,
    TResult Function(String id)? closedBannerId,
    required TResult orElse(),
  }) {
    if (clearClosedTime != null) {
      return clearClosedTime();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAnnouncement value) getAnnouncement,
    required TResult Function(_Close value) close,
    required TResult Function(_ClearBannerId value) clearBannerId,
    required TResult Function(_ClearClosedTime value) clearClosedTime,
    required TResult Function(_Show value) show,
    required TResult Function(_SetDontShowDateTime value) setClosedTime,
    required TResult Function(_GetDontShowDateTime value) getClosedTime,
    required TResult Function(_GetMaintenanceBanners value)
        getMaintenanceBanners,
    required TResult Function(_ChangePreferLanguage value) changePreferLanguage,
    required TResult Function(_ClosedBannerId value) closedBannerId,
  }) {
    return clearClosedTime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAnnouncement value)? getAnnouncement,
    TResult? Function(_Close value)? close,
    TResult? Function(_ClearBannerId value)? clearBannerId,
    TResult? Function(_ClearClosedTime value)? clearClosedTime,
    TResult? Function(_Show value)? show,
    TResult? Function(_SetDontShowDateTime value)? setClosedTime,
    TResult? Function(_GetDontShowDateTime value)? getClosedTime,
    TResult? Function(_GetMaintenanceBanners value)? getMaintenanceBanners,
    TResult? Function(_ChangePreferLanguage value)? changePreferLanguage,
    TResult? Function(_ClosedBannerId value)? closedBannerId,
  }) {
    return clearClosedTime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAnnouncement value)? getAnnouncement,
    TResult Function(_Close value)? close,
    TResult Function(_ClearBannerId value)? clearBannerId,
    TResult Function(_ClearClosedTime value)? clearClosedTime,
    TResult Function(_Show value)? show,
    TResult Function(_SetDontShowDateTime value)? setClosedTime,
    TResult Function(_GetDontShowDateTime value)? getClosedTime,
    TResult Function(_GetMaintenanceBanners value)? getMaintenanceBanners,
    TResult Function(_ChangePreferLanguage value)? changePreferLanguage,
    TResult Function(_ClosedBannerId value)? closedBannerId,
    required TResult orElse(),
  }) {
    if (clearClosedTime != null) {
      return clearClosedTime(this);
    }
    return orElse();
  }
}

abstract class _ClearClosedTime implements AnnouncementEvent {
  const factory _ClearClosedTime() = _$ClearClosedTimeImpl;
}

/// @nodoc
abstract class _$$ShowImplCopyWith<$Res> {
  factory _$$ShowImplCopyWith(
          _$ShowImpl value, $Res Function(_$ShowImpl) then) =
      __$$ShowImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShowImplCopyWithImpl<$Res>
    extends _$AnnouncementEventCopyWithImpl<$Res, _$ShowImpl>
    implements _$$ShowImplCopyWith<$Res> {
  __$$ShowImplCopyWithImpl(_$ShowImpl _value, $Res Function(_$ShowImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ShowImpl implements _Show {
  const _$ShowImpl();

  @override
  String toString() {
    return 'AnnouncementEvent.show()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ShowImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAnnouncement,
    required TResult Function() close,
    required TResult Function() clearBannerId,
    required TResult Function() clearClosedTime,
    required TResult Function() show,
    required TResult Function(
            DateTimeStringValue dateTime, StorageType storageType)
        setClosedTime,
    required TResult Function() getClosedTime,
    required TResult Function(SalesOrg salesOrg) getMaintenanceBanners,
    required TResult Function(bool preferSalesOrgLanguage) changePreferLanguage,
    required TResult Function(String id) closedBannerId,
  }) {
    return show();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAnnouncement,
    TResult? Function()? close,
    TResult? Function()? clearBannerId,
    TResult? Function()? clearClosedTime,
    TResult? Function()? show,
    TResult? Function(DateTimeStringValue dateTime, StorageType storageType)?
        setClosedTime,
    TResult? Function()? getClosedTime,
    TResult? Function(SalesOrg salesOrg)? getMaintenanceBanners,
    TResult? Function(bool preferSalesOrgLanguage)? changePreferLanguage,
    TResult? Function(String id)? closedBannerId,
  }) {
    return show?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAnnouncement,
    TResult Function()? close,
    TResult Function()? clearBannerId,
    TResult Function()? clearClosedTime,
    TResult Function()? show,
    TResult Function(DateTimeStringValue dateTime, StorageType storageType)?
        setClosedTime,
    TResult Function()? getClosedTime,
    TResult Function(SalesOrg salesOrg)? getMaintenanceBanners,
    TResult Function(bool preferSalesOrgLanguage)? changePreferLanguage,
    TResult Function(String id)? closedBannerId,
    required TResult orElse(),
  }) {
    if (show != null) {
      return show();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAnnouncement value) getAnnouncement,
    required TResult Function(_Close value) close,
    required TResult Function(_ClearBannerId value) clearBannerId,
    required TResult Function(_ClearClosedTime value) clearClosedTime,
    required TResult Function(_Show value) show,
    required TResult Function(_SetDontShowDateTime value) setClosedTime,
    required TResult Function(_GetDontShowDateTime value) getClosedTime,
    required TResult Function(_GetMaintenanceBanners value)
        getMaintenanceBanners,
    required TResult Function(_ChangePreferLanguage value) changePreferLanguage,
    required TResult Function(_ClosedBannerId value) closedBannerId,
  }) {
    return show(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAnnouncement value)? getAnnouncement,
    TResult? Function(_Close value)? close,
    TResult? Function(_ClearBannerId value)? clearBannerId,
    TResult? Function(_ClearClosedTime value)? clearClosedTime,
    TResult? Function(_Show value)? show,
    TResult? Function(_SetDontShowDateTime value)? setClosedTime,
    TResult? Function(_GetDontShowDateTime value)? getClosedTime,
    TResult? Function(_GetMaintenanceBanners value)? getMaintenanceBanners,
    TResult? Function(_ChangePreferLanguage value)? changePreferLanguage,
    TResult? Function(_ClosedBannerId value)? closedBannerId,
  }) {
    return show?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAnnouncement value)? getAnnouncement,
    TResult Function(_Close value)? close,
    TResult Function(_ClearBannerId value)? clearBannerId,
    TResult Function(_ClearClosedTime value)? clearClosedTime,
    TResult Function(_Show value)? show,
    TResult Function(_SetDontShowDateTime value)? setClosedTime,
    TResult Function(_GetDontShowDateTime value)? getClosedTime,
    TResult Function(_GetMaintenanceBanners value)? getMaintenanceBanners,
    TResult Function(_ChangePreferLanguage value)? changePreferLanguage,
    TResult Function(_ClosedBannerId value)? closedBannerId,
    required TResult orElse(),
  }) {
    if (show != null) {
      return show(this);
    }
    return orElse();
  }
}

abstract class _Show implements AnnouncementEvent {
  const factory _Show() = _$ShowImpl;
}

/// @nodoc
abstract class _$$SetDontShowDateTimeImplCopyWith<$Res> {
  factory _$$SetDontShowDateTimeImplCopyWith(_$SetDontShowDateTimeImpl value,
          $Res Function(_$SetDontShowDateTimeImpl) then) =
      __$$SetDontShowDateTimeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTimeStringValue dateTime, StorageType storageType});
}

/// @nodoc
class __$$SetDontShowDateTimeImplCopyWithImpl<$Res>
    extends _$AnnouncementEventCopyWithImpl<$Res, _$SetDontShowDateTimeImpl>
    implements _$$SetDontShowDateTimeImplCopyWith<$Res> {
  __$$SetDontShowDateTimeImplCopyWithImpl(_$SetDontShowDateTimeImpl _value,
      $Res Function(_$SetDontShowDateTimeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? storageType = null,
  }) {
    return _then(_$SetDontShowDateTimeImpl(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      storageType: null == storageType
          ? _value.storageType
          : storageType // ignore: cast_nullable_to_non_nullable
              as StorageType,
    ));
  }
}

/// @nodoc

class _$SetDontShowDateTimeImpl implements _SetDontShowDateTime {
  const _$SetDontShowDateTimeImpl(
      {required this.dateTime, required this.storageType});

  @override
  final DateTimeStringValue dateTime;
  @override
  final StorageType storageType;

  @override
  String toString() {
    return 'AnnouncementEvent.setClosedTime(dateTime: $dateTime, storageType: $storageType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetDontShowDateTimeImpl &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.storageType, storageType) ||
                other.storageType == storageType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateTime, storageType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetDontShowDateTimeImplCopyWith<_$SetDontShowDateTimeImpl> get copyWith =>
      __$$SetDontShowDateTimeImplCopyWithImpl<_$SetDontShowDateTimeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAnnouncement,
    required TResult Function() close,
    required TResult Function() clearBannerId,
    required TResult Function() clearClosedTime,
    required TResult Function() show,
    required TResult Function(
            DateTimeStringValue dateTime, StorageType storageType)
        setClosedTime,
    required TResult Function() getClosedTime,
    required TResult Function(SalesOrg salesOrg) getMaintenanceBanners,
    required TResult Function(bool preferSalesOrgLanguage) changePreferLanguage,
    required TResult Function(String id) closedBannerId,
  }) {
    return setClosedTime(dateTime, storageType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAnnouncement,
    TResult? Function()? close,
    TResult? Function()? clearBannerId,
    TResult? Function()? clearClosedTime,
    TResult? Function()? show,
    TResult? Function(DateTimeStringValue dateTime, StorageType storageType)?
        setClosedTime,
    TResult? Function()? getClosedTime,
    TResult? Function(SalesOrg salesOrg)? getMaintenanceBanners,
    TResult? Function(bool preferSalesOrgLanguage)? changePreferLanguage,
    TResult? Function(String id)? closedBannerId,
  }) {
    return setClosedTime?.call(dateTime, storageType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAnnouncement,
    TResult Function()? close,
    TResult Function()? clearBannerId,
    TResult Function()? clearClosedTime,
    TResult Function()? show,
    TResult Function(DateTimeStringValue dateTime, StorageType storageType)?
        setClosedTime,
    TResult Function()? getClosedTime,
    TResult Function(SalesOrg salesOrg)? getMaintenanceBanners,
    TResult Function(bool preferSalesOrgLanguage)? changePreferLanguage,
    TResult Function(String id)? closedBannerId,
    required TResult orElse(),
  }) {
    if (setClosedTime != null) {
      return setClosedTime(dateTime, storageType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAnnouncement value) getAnnouncement,
    required TResult Function(_Close value) close,
    required TResult Function(_ClearBannerId value) clearBannerId,
    required TResult Function(_ClearClosedTime value) clearClosedTime,
    required TResult Function(_Show value) show,
    required TResult Function(_SetDontShowDateTime value) setClosedTime,
    required TResult Function(_GetDontShowDateTime value) getClosedTime,
    required TResult Function(_GetMaintenanceBanners value)
        getMaintenanceBanners,
    required TResult Function(_ChangePreferLanguage value) changePreferLanguage,
    required TResult Function(_ClosedBannerId value) closedBannerId,
  }) {
    return setClosedTime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAnnouncement value)? getAnnouncement,
    TResult? Function(_Close value)? close,
    TResult? Function(_ClearBannerId value)? clearBannerId,
    TResult? Function(_ClearClosedTime value)? clearClosedTime,
    TResult? Function(_Show value)? show,
    TResult? Function(_SetDontShowDateTime value)? setClosedTime,
    TResult? Function(_GetDontShowDateTime value)? getClosedTime,
    TResult? Function(_GetMaintenanceBanners value)? getMaintenanceBanners,
    TResult? Function(_ChangePreferLanguage value)? changePreferLanguage,
    TResult? Function(_ClosedBannerId value)? closedBannerId,
  }) {
    return setClosedTime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAnnouncement value)? getAnnouncement,
    TResult Function(_Close value)? close,
    TResult Function(_ClearBannerId value)? clearBannerId,
    TResult Function(_ClearClosedTime value)? clearClosedTime,
    TResult Function(_Show value)? show,
    TResult Function(_SetDontShowDateTime value)? setClosedTime,
    TResult Function(_GetDontShowDateTime value)? getClosedTime,
    TResult Function(_GetMaintenanceBanners value)? getMaintenanceBanners,
    TResult Function(_ChangePreferLanguage value)? changePreferLanguage,
    TResult Function(_ClosedBannerId value)? closedBannerId,
    required TResult orElse(),
  }) {
    if (setClosedTime != null) {
      return setClosedTime(this);
    }
    return orElse();
  }
}

abstract class _SetDontShowDateTime implements AnnouncementEvent {
  const factory _SetDontShowDateTime(
      {required final DateTimeStringValue dateTime,
      required final StorageType storageType}) = _$SetDontShowDateTimeImpl;

  DateTimeStringValue get dateTime;
  StorageType get storageType;
  @JsonKey(ignore: true)
  _$$SetDontShowDateTimeImplCopyWith<_$SetDontShowDateTimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetDontShowDateTimeImplCopyWith<$Res> {
  factory _$$GetDontShowDateTimeImplCopyWith(_$GetDontShowDateTimeImpl value,
          $Res Function(_$GetDontShowDateTimeImpl) then) =
      __$$GetDontShowDateTimeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetDontShowDateTimeImplCopyWithImpl<$Res>
    extends _$AnnouncementEventCopyWithImpl<$Res, _$GetDontShowDateTimeImpl>
    implements _$$GetDontShowDateTimeImplCopyWith<$Res> {
  __$$GetDontShowDateTimeImplCopyWithImpl(_$GetDontShowDateTimeImpl _value,
      $Res Function(_$GetDontShowDateTimeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetDontShowDateTimeImpl implements _GetDontShowDateTime {
  const _$GetDontShowDateTimeImpl();

  @override
  String toString() {
    return 'AnnouncementEvent.getClosedTime()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetDontShowDateTimeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAnnouncement,
    required TResult Function() close,
    required TResult Function() clearBannerId,
    required TResult Function() clearClosedTime,
    required TResult Function() show,
    required TResult Function(
            DateTimeStringValue dateTime, StorageType storageType)
        setClosedTime,
    required TResult Function() getClosedTime,
    required TResult Function(SalesOrg salesOrg) getMaintenanceBanners,
    required TResult Function(bool preferSalesOrgLanguage) changePreferLanguage,
    required TResult Function(String id) closedBannerId,
  }) {
    return getClosedTime();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAnnouncement,
    TResult? Function()? close,
    TResult? Function()? clearBannerId,
    TResult? Function()? clearClosedTime,
    TResult? Function()? show,
    TResult? Function(DateTimeStringValue dateTime, StorageType storageType)?
        setClosedTime,
    TResult? Function()? getClosedTime,
    TResult? Function(SalesOrg salesOrg)? getMaintenanceBanners,
    TResult? Function(bool preferSalesOrgLanguage)? changePreferLanguage,
    TResult? Function(String id)? closedBannerId,
  }) {
    return getClosedTime?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAnnouncement,
    TResult Function()? close,
    TResult Function()? clearBannerId,
    TResult Function()? clearClosedTime,
    TResult Function()? show,
    TResult Function(DateTimeStringValue dateTime, StorageType storageType)?
        setClosedTime,
    TResult Function()? getClosedTime,
    TResult Function(SalesOrg salesOrg)? getMaintenanceBanners,
    TResult Function(bool preferSalesOrgLanguage)? changePreferLanguage,
    TResult Function(String id)? closedBannerId,
    required TResult orElse(),
  }) {
    if (getClosedTime != null) {
      return getClosedTime();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAnnouncement value) getAnnouncement,
    required TResult Function(_Close value) close,
    required TResult Function(_ClearBannerId value) clearBannerId,
    required TResult Function(_ClearClosedTime value) clearClosedTime,
    required TResult Function(_Show value) show,
    required TResult Function(_SetDontShowDateTime value) setClosedTime,
    required TResult Function(_GetDontShowDateTime value) getClosedTime,
    required TResult Function(_GetMaintenanceBanners value)
        getMaintenanceBanners,
    required TResult Function(_ChangePreferLanguage value) changePreferLanguage,
    required TResult Function(_ClosedBannerId value) closedBannerId,
  }) {
    return getClosedTime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAnnouncement value)? getAnnouncement,
    TResult? Function(_Close value)? close,
    TResult? Function(_ClearBannerId value)? clearBannerId,
    TResult? Function(_ClearClosedTime value)? clearClosedTime,
    TResult? Function(_Show value)? show,
    TResult? Function(_SetDontShowDateTime value)? setClosedTime,
    TResult? Function(_GetDontShowDateTime value)? getClosedTime,
    TResult? Function(_GetMaintenanceBanners value)? getMaintenanceBanners,
    TResult? Function(_ChangePreferLanguage value)? changePreferLanguage,
    TResult? Function(_ClosedBannerId value)? closedBannerId,
  }) {
    return getClosedTime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAnnouncement value)? getAnnouncement,
    TResult Function(_Close value)? close,
    TResult Function(_ClearBannerId value)? clearBannerId,
    TResult Function(_ClearClosedTime value)? clearClosedTime,
    TResult Function(_Show value)? show,
    TResult Function(_SetDontShowDateTime value)? setClosedTime,
    TResult Function(_GetDontShowDateTime value)? getClosedTime,
    TResult Function(_GetMaintenanceBanners value)? getMaintenanceBanners,
    TResult Function(_ChangePreferLanguage value)? changePreferLanguage,
    TResult Function(_ClosedBannerId value)? closedBannerId,
    required TResult orElse(),
  }) {
    if (getClosedTime != null) {
      return getClosedTime(this);
    }
    return orElse();
  }
}

abstract class _GetDontShowDateTime implements AnnouncementEvent {
  const factory _GetDontShowDateTime() = _$GetDontShowDateTimeImpl;
}

/// @nodoc
abstract class _$$GetMaintenanceBannersImplCopyWith<$Res> {
  factory _$$GetMaintenanceBannersImplCopyWith(
          _$GetMaintenanceBannersImpl value,
          $Res Function(_$GetMaintenanceBannersImpl) then) =
      __$$GetMaintenanceBannersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrg salesOrg});
}

/// @nodoc
class __$$GetMaintenanceBannersImplCopyWithImpl<$Res>
    extends _$AnnouncementEventCopyWithImpl<$Res, _$GetMaintenanceBannersImpl>
    implements _$$GetMaintenanceBannersImplCopyWith<$Res> {
  __$$GetMaintenanceBannersImplCopyWithImpl(_$GetMaintenanceBannersImpl _value,
      $Res Function(_$GetMaintenanceBannersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
  }) {
    return _then(_$GetMaintenanceBannersImpl(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ));
  }
}

/// @nodoc

class _$GetMaintenanceBannersImpl implements _GetMaintenanceBanners {
  const _$GetMaintenanceBannersImpl({required this.salesOrg});

  @override
  final SalesOrg salesOrg;

  @override
  String toString() {
    return 'AnnouncementEvent.getMaintenanceBanners(salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMaintenanceBannersImpl &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetMaintenanceBannersImplCopyWith<_$GetMaintenanceBannersImpl>
      get copyWith => __$$GetMaintenanceBannersImplCopyWithImpl<
          _$GetMaintenanceBannersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAnnouncement,
    required TResult Function() close,
    required TResult Function() clearBannerId,
    required TResult Function() clearClosedTime,
    required TResult Function() show,
    required TResult Function(
            DateTimeStringValue dateTime, StorageType storageType)
        setClosedTime,
    required TResult Function() getClosedTime,
    required TResult Function(SalesOrg salesOrg) getMaintenanceBanners,
    required TResult Function(bool preferSalesOrgLanguage) changePreferLanguage,
    required TResult Function(String id) closedBannerId,
  }) {
    return getMaintenanceBanners(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAnnouncement,
    TResult? Function()? close,
    TResult? Function()? clearBannerId,
    TResult? Function()? clearClosedTime,
    TResult? Function()? show,
    TResult? Function(DateTimeStringValue dateTime, StorageType storageType)?
        setClosedTime,
    TResult? Function()? getClosedTime,
    TResult? Function(SalesOrg salesOrg)? getMaintenanceBanners,
    TResult? Function(bool preferSalesOrgLanguage)? changePreferLanguage,
    TResult? Function(String id)? closedBannerId,
  }) {
    return getMaintenanceBanners?.call(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAnnouncement,
    TResult Function()? close,
    TResult Function()? clearBannerId,
    TResult Function()? clearClosedTime,
    TResult Function()? show,
    TResult Function(DateTimeStringValue dateTime, StorageType storageType)?
        setClosedTime,
    TResult Function()? getClosedTime,
    TResult Function(SalesOrg salesOrg)? getMaintenanceBanners,
    TResult Function(bool preferSalesOrgLanguage)? changePreferLanguage,
    TResult Function(String id)? closedBannerId,
    required TResult orElse(),
  }) {
    if (getMaintenanceBanners != null) {
      return getMaintenanceBanners(salesOrg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAnnouncement value) getAnnouncement,
    required TResult Function(_Close value) close,
    required TResult Function(_ClearBannerId value) clearBannerId,
    required TResult Function(_ClearClosedTime value) clearClosedTime,
    required TResult Function(_Show value) show,
    required TResult Function(_SetDontShowDateTime value) setClosedTime,
    required TResult Function(_GetDontShowDateTime value) getClosedTime,
    required TResult Function(_GetMaintenanceBanners value)
        getMaintenanceBanners,
    required TResult Function(_ChangePreferLanguage value) changePreferLanguage,
    required TResult Function(_ClosedBannerId value) closedBannerId,
  }) {
    return getMaintenanceBanners(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAnnouncement value)? getAnnouncement,
    TResult? Function(_Close value)? close,
    TResult? Function(_ClearBannerId value)? clearBannerId,
    TResult? Function(_ClearClosedTime value)? clearClosedTime,
    TResult? Function(_Show value)? show,
    TResult? Function(_SetDontShowDateTime value)? setClosedTime,
    TResult? Function(_GetDontShowDateTime value)? getClosedTime,
    TResult? Function(_GetMaintenanceBanners value)? getMaintenanceBanners,
    TResult? Function(_ChangePreferLanguage value)? changePreferLanguage,
    TResult? Function(_ClosedBannerId value)? closedBannerId,
  }) {
    return getMaintenanceBanners?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAnnouncement value)? getAnnouncement,
    TResult Function(_Close value)? close,
    TResult Function(_ClearBannerId value)? clearBannerId,
    TResult Function(_ClearClosedTime value)? clearClosedTime,
    TResult Function(_Show value)? show,
    TResult Function(_SetDontShowDateTime value)? setClosedTime,
    TResult Function(_GetDontShowDateTime value)? getClosedTime,
    TResult Function(_GetMaintenanceBanners value)? getMaintenanceBanners,
    TResult Function(_ChangePreferLanguage value)? changePreferLanguage,
    TResult Function(_ClosedBannerId value)? closedBannerId,
    required TResult orElse(),
  }) {
    if (getMaintenanceBanners != null) {
      return getMaintenanceBanners(this);
    }
    return orElse();
  }
}

abstract class _GetMaintenanceBanners implements AnnouncementEvent {
  const factory _GetMaintenanceBanners({required final SalesOrg salesOrg}) =
      _$GetMaintenanceBannersImpl;

  SalesOrg get salesOrg;
  @JsonKey(ignore: true)
  _$$GetMaintenanceBannersImplCopyWith<_$GetMaintenanceBannersImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangePreferLanguageImplCopyWith<$Res> {
  factory _$$ChangePreferLanguageImplCopyWith(_$ChangePreferLanguageImpl value,
          $Res Function(_$ChangePreferLanguageImpl) then) =
      __$$ChangePreferLanguageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool preferSalesOrgLanguage});
}

/// @nodoc
class __$$ChangePreferLanguageImplCopyWithImpl<$Res>
    extends _$AnnouncementEventCopyWithImpl<$Res, _$ChangePreferLanguageImpl>
    implements _$$ChangePreferLanguageImplCopyWith<$Res> {
  __$$ChangePreferLanguageImplCopyWithImpl(_$ChangePreferLanguageImpl _value,
      $Res Function(_$ChangePreferLanguageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preferSalesOrgLanguage = null,
  }) {
    return _then(_$ChangePreferLanguageImpl(
      preferSalesOrgLanguage: null == preferSalesOrgLanguage
          ? _value.preferSalesOrgLanguage
          : preferSalesOrgLanguage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChangePreferLanguageImpl implements _ChangePreferLanguage {
  const _$ChangePreferLanguageImpl({required this.preferSalesOrgLanguage});

  @override
  final bool preferSalesOrgLanguage;

  @override
  String toString() {
    return 'AnnouncementEvent.changePreferLanguage(preferSalesOrgLanguage: $preferSalesOrgLanguage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePreferLanguageImpl &&
            (identical(other.preferSalesOrgLanguage, preferSalesOrgLanguage) ||
                other.preferSalesOrgLanguage == preferSalesOrgLanguage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, preferSalesOrgLanguage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePreferLanguageImplCopyWith<_$ChangePreferLanguageImpl>
      get copyWith =>
          __$$ChangePreferLanguageImplCopyWithImpl<_$ChangePreferLanguageImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAnnouncement,
    required TResult Function() close,
    required TResult Function() clearBannerId,
    required TResult Function() clearClosedTime,
    required TResult Function() show,
    required TResult Function(
            DateTimeStringValue dateTime, StorageType storageType)
        setClosedTime,
    required TResult Function() getClosedTime,
    required TResult Function(SalesOrg salesOrg) getMaintenanceBanners,
    required TResult Function(bool preferSalesOrgLanguage) changePreferLanguage,
    required TResult Function(String id) closedBannerId,
  }) {
    return changePreferLanguage(preferSalesOrgLanguage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAnnouncement,
    TResult? Function()? close,
    TResult? Function()? clearBannerId,
    TResult? Function()? clearClosedTime,
    TResult? Function()? show,
    TResult? Function(DateTimeStringValue dateTime, StorageType storageType)?
        setClosedTime,
    TResult? Function()? getClosedTime,
    TResult? Function(SalesOrg salesOrg)? getMaintenanceBanners,
    TResult? Function(bool preferSalesOrgLanguage)? changePreferLanguage,
    TResult? Function(String id)? closedBannerId,
  }) {
    return changePreferLanguage?.call(preferSalesOrgLanguage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAnnouncement,
    TResult Function()? close,
    TResult Function()? clearBannerId,
    TResult Function()? clearClosedTime,
    TResult Function()? show,
    TResult Function(DateTimeStringValue dateTime, StorageType storageType)?
        setClosedTime,
    TResult Function()? getClosedTime,
    TResult Function(SalesOrg salesOrg)? getMaintenanceBanners,
    TResult Function(bool preferSalesOrgLanguage)? changePreferLanguage,
    TResult Function(String id)? closedBannerId,
    required TResult orElse(),
  }) {
    if (changePreferLanguage != null) {
      return changePreferLanguage(preferSalesOrgLanguage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAnnouncement value) getAnnouncement,
    required TResult Function(_Close value) close,
    required TResult Function(_ClearBannerId value) clearBannerId,
    required TResult Function(_ClearClosedTime value) clearClosedTime,
    required TResult Function(_Show value) show,
    required TResult Function(_SetDontShowDateTime value) setClosedTime,
    required TResult Function(_GetDontShowDateTime value) getClosedTime,
    required TResult Function(_GetMaintenanceBanners value)
        getMaintenanceBanners,
    required TResult Function(_ChangePreferLanguage value) changePreferLanguage,
    required TResult Function(_ClosedBannerId value) closedBannerId,
  }) {
    return changePreferLanguage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAnnouncement value)? getAnnouncement,
    TResult? Function(_Close value)? close,
    TResult? Function(_ClearBannerId value)? clearBannerId,
    TResult? Function(_ClearClosedTime value)? clearClosedTime,
    TResult? Function(_Show value)? show,
    TResult? Function(_SetDontShowDateTime value)? setClosedTime,
    TResult? Function(_GetDontShowDateTime value)? getClosedTime,
    TResult? Function(_GetMaintenanceBanners value)? getMaintenanceBanners,
    TResult? Function(_ChangePreferLanguage value)? changePreferLanguage,
    TResult? Function(_ClosedBannerId value)? closedBannerId,
  }) {
    return changePreferLanguage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAnnouncement value)? getAnnouncement,
    TResult Function(_Close value)? close,
    TResult Function(_ClearBannerId value)? clearBannerId,
    TResult Function(_ClearClosedTime value)? clearClosedTime,
    TResult Function(_Show value)? show,
    TResult Function(_SetDontShowDateTime value)? setClosedTime,
    TResult Function(_GetDontShowDateTime value)? getClosedTime,
    TResult Function(_GetMaintenanceBanners value)? getMaintenanceBanners,
    TResult Function(_ChangePreferLanguage value)? changePreferLanguage,
    TResult Function(_ClosedBannerId value)? closedBannerId,
    required TResult orElse(),
  }) {
    if (changePreferLanguage != null) {
      return changePreferLanguage(this);
    }
    return orElse();
  }
}

abstract class _ChangePreferLanguage implements AnnouncementEvent {
  const factory _ChangePreferLanguage(
          {required final bool preferSalesOrgLanguage}) =
      _$ChangePreferLanguageImpl;

  bool get preferSalesOrgLanguage;
  @JsonKey(ignore: true)
  _$$ChangePreferLanguageImplCopyWith<_$ChangePreferLanguageImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClosedBannerIdImplCopyWith<$Res> {
  factory _$$ClosedBannerIdImplCopyWith(_$ClosedBannerIdImpl value,
          $Res Function(_$ClosedBannerIdImpl) then) =
      __$$ClosedBannerIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$ClosedBannerIdImplCopyWithImpl<$Res>
    extends _$AnnouncementEventCopyWithImpl<$Res, _$ClosedBannerIdImpl>
    implements _$$ClosedBannerIdImplCopyWith<$Res> {
  __$$ClosedBannerIdImplCopyWithImpl(
      _$ClosedBannerIdImpl _value, $Res Function(_$ClosedBannerIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$ClosedBannerIdImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ClosedBannerIdImpl implements _ClosedBannerId {
  const _$ClosedBannerIdImpl({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'AnnouncementEvent.closedBannerId(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosedBannerIdImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClosedBannerIdImplCopyWith<_$ClosedBannerIdImpl> get copyWith =>
      __$$ClosedBannerIdImplCopyWithImpl<_$ClosedBannerIdImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAnnouncement,
    required TResult Function() close,
    required TResult Function() clearBannerId,
    required TResult Function() clearClosedTime,
    required TResult Function() show,
    required TResult Function(
            DateTimeStringValue dateTime, StorageType storageType)
        setClosedTime,
    required TResult Function() getClosedTime,
    required TResult Function(SalesOrg salesOrg) getMaintenanceBanners,
    required TResult Function(bool preferSalesOrgLanguage) changePreferLanguage,
    required TResult Function(String id) closedBannerId,
  }) {
    return closedBannerId(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAnnouncement,
    TResult? Function()? close,
    TResult? Function()? clearBannerId,
    TResult? Function()? clearClosedTime,
    TResult? Function()? show,
    TResult? Function(DateTimeStringValue dateTime, StorageType storageType)?
        setClosedTime,
    TResult? Function()? getClosedTime,
    TResult? Function(SalesOrg salesOrg)? getMaintenanceBanners,
    TResult? Function(bool preferSalesOrgLanguage)? changePreferLanguage,
    TResult? Function(String id)? closedBannerId,
  }) {
    return closedBannerId?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAnnouncement,
    TResult Function()? close,
    TResult Function()? clearBannerId,
    TResult Function()? clearClosedTime,
    TResult Function()? show,
    TResult Function(DateTimeStringValue dateTime, StorageType storageType)?
        setClosedTime,
    TResult Function()? getClosedTime,
    TResult Function(SalesOrg salesOrg)? getMaintenanceBanners,
    TResult Function(bool preferSalesOrgLanguage)? changePreferLanguage,
    TResult Function(String id)? closedBannerId,
    required TResult orElse(),
  }) {
    if (closedBannerId != null) {
      return closedBannerId(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAnnouncement value) getAnnouncement,
    required TResult Function(_Close value) close,
    required TResult Function(_ClearBannerId value) clearBannerId,
    required TResult Function(_ClearClosedTime value) clearClosedTime,
    required TResult Function(_Show value) show,
    required TResult Function(_SetDontShowDateTime value) setClosedTime,
    required TResult Function(_GetDontShowDateTime value) getClosedTime,
    required TResult Function(_GetMaintenanceBanners value)
        getMaintenanceBanners,
    required TResult Function(_ChangePreferLanguage value) changePreferLanguage,
    required TResult Function(_ClosedBannerId value) closedBannerId,
  }) {
    return closedBannerId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAnnouncement value)? getAnnouncement,
    TResult? Function(_Close value)? close,
    TResult? Function(_ClearBannerId value)? clearBannerId,
    TResult? Function(_ClearClosedTime value)? clearClosedTime,
    TResult? Function(_Show value)? show,
    TResult? Function(_SetDontShowDateTime value)? setClosedTime,
    TResult? Function(_GetDontShowDateTime value)? getClosedTime,
    TResult? Function(_GetMaintenanceBanners value)? getMaintenanceBanners,
    TResult? Function(_ChangePreferLanguage value)? changePreferLanguage,
    TResult? Function(_ClosedBannerId value)? closedBannerId,
  }) {
    return closedBannerId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAnnouncement value)? getAnnouncement,
    TResult Function(_Close value)? close,
    TResult Function(_ClearBannerId value)? clearBannerId,
    TResult Function(_ClearClosedTime value)? clearClosedTime,
    TResult Function(_Show value)? show,
    TResult Function(_SetDontShowDateTime value)? setClosedTime,
    TResult Function(_GetDontShowDateTime value)? getClosedTime,
    TResult Function(_GetMaintenanceBanners value)? getMaintenanceBanners,
    TResult Function(_ChangePreferLanguage value)? changePreferLanguage,
    TResult Function(_ClosedBannerId value)? closedBannerId,
    required TResult orElse(),
  }) {
    if (closedBannerId != null) {
      return closedBannerId(this);
    }
    return orElse();
  }
}

abstract class _ClosedBannerId implements AnnouncementEvent {
  const factory _ClosedBannerId({required final String id}) =
      _$ClosedBannerIdImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$ClosedBannerIdImplCopyWith<_$ClosedBannerIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnnouncementState {
  Announcement get announcement => throw _privateConstructorUsedError;
  MaintenanceItem get maintenanceItem => throw _privateConstructorUsedError;
  List<String> get listBannersIdClosed => throw _privateConstructorUsedError;
  DateTimeStringValue get lastClosedTimeOrder =>
      throw _privateConstructorUsedError;
  DateTimeStringValue get lastClosedTimePayment =>
      throw _privateConstructorUsedError;
  DateTimeStringValue get lastClosedTimeReturns =>
      throw _privateConstructorUsedError;
  bool get preferSalesOrgLanguage => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isClosed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnnouncementStateCopyWith<AnnouncementState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementStateCopyWith<$Res> {
  factory $AnnouncementStateCopyWith(
          AnnouncementState value, $Res Function(AnnouncementState) then) =
      _$AnnouncementStateCopyWithImpl<$Res, AnnouncementState>;
  @useResult
  $Res call(
      {Announcement announcement,
      MaintenanceItem maintenanceItem,
      List<String> listBannersIdClosed,
      DateTimeStringValue lastClosedTimeOrder,
      DateTimeStringValue lastClosedTimePayment,
      DateTimeStringValue lastClosedTimeReturns,
      bool preferSalesOrgLanguage,
      bool isLoading,
      bool isClosed});

  $AnnouncementCopyWith<$Res> get announcement;
  $MaintenanceItemCopyWith<$Res> get maintenanceItem;
}

/// @nodoc
class _$AnnouncementStateCopyWithImpl<$Res, $Val extends AnnouncementState>
    implements $AnnouncementStateCopyWith<$Res> {
  _$AnnouncementStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? announcement = null,
    Object? maintenanceItem = null,
    Object? listBannersIdClosed = null,
    Object? lastClosedTimeOrder = null,
    Object? lastClosedTimePayment = null,
    Object? lastClosedTimeReturns = null,
    Object? preferSalesOrgLanguage = null,
    Object? isLoading = null,
    Object? isClosed = null,
  }) {
    return _then(_value.copyWith(
      announcement: null == announcement
          ? _value.announcement
          : announcement // ignore: cast_nullable_to_non_nullable
              as Announcement,
      maintenanceItem: null == maintenanceItem
          ? _value.maintenanceItem
          : maintenanceItem // ignore: cast_nullable_to_non_nullable
              as MaintenanceItem,
      listBannersIdClosed: null == listBannersIdClosed
          ? _value.listBannersIdClosed
          : listBannersIdClosed // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastClosedTimeOrder: null == lastClosedTimeOrder
          ? _value.lastClosedTimeOrder
          : lastClosedTimeOrder // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      lastClosedTimePayment: null == lastClosedTimePayment
          ? _value.lastClosedTimePayment
          : lastClosedTimePayment // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      lastClosedTimeReturns: null == lastClosedTimeReturns
          ? _value.lastClosedTimeReturns
          : lastClosedTimeReturns // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      preferSalesOrgLanguage: null == preferSalesOrgLanguage
          ? _value.preferSalesOrgLanguage
          : preferSalesOrgLanguage // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isClosed: null == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AnnouncementCopyWith<$Res> get announcement {
    return $AnnouncementCopyWith<$Res>(_value.announcement, (value) {
      return _then(_value.copyWith(announcement: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaintenanceItemCopyWith<$Res> get maintenanceItem {
    return $MaintenanceItemCopyWith<$Res>(_value.maintenanceItem, (value) {
      return _then(_value.copyWith(maintenanceItem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnnouncementStateImplCopyWith<$Res>
    implements $AnnouncementStateCopyWith<$Res> {
  factory _$$AnnouncementStateImplCopyWith(_$AnnouncementStateImpl value,
          $Res Function(_$AnnouncementStateImpl) then) =
      __$$AnnouncementStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Announcement announcement,
      MaintenanceItem maintenanceItem,
      List<String> listBannersIdClosed,
      DateTimeStringValue lastClosedTimeOrder,
      DateTimeStringValue lastClosedTimePayment,
      DateTimeStringValue lastClosedTimeReturns,
      bool preferSalesOrgLanguage,
      bool isLoading,
      bool isClosed});

  @override
  $AnnouncementCopyWith<$Res> get announcement;
  @override
  $MaintenanceItemCopyWith<$Res> get maintenanceItem;
}

/// @nodoc
class __$$AnnouncementStateImplCopyWithImpl<$Res>
    extends _$AnnouncementStateCopyWithImpl<$Res, _$AnnouncementStateImpl>
    implements _$$AnnouncementStateImplCopyWith<$Res> {
  __$$AnnouncementStateImplCopyWithImpl(_$AnnouncementStateImpl _value,
      $Res Function(_$AnnouncementStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? announcement = null,
    Object? maintenanceItem = null,
    Object? listBannersIdClosed = null,
    Object? lastClosedTimeOrder = null,
    Object? lastClosedTimePayment = null,
    Object? lastClosedTimeReturns = null,
    Object? preferSalesOrgLanguage = null,
    Object? isLoading = null,
    Object? isClosed = null,
  }) {
    return _then(_$AnnouncementStateImpl(
      announcement: null == announcement
          ? _value.announcement
          : announcement // ignore: cast_nullable_to_non_nullable
              as Announcement,
      maintenanceItem: null == maintenanceItem
          ? _value.maintenanceItem
          : maintenanceItem // ignore: cast_nullable_to_non_nullable
              as MaintenanceItem,
      listBannersIdClosed: null == listBannersIdClosed
          ? _value._listBannersIdClosed
          : listBannersIdClosed // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastClosedTimeOrder: null == lastClosedTimeOrder
          ? _value.lastClosedTimeOrder
          : lastClosedTimeOrder // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      lastClosedTimePayment: null == lastClosedTimePayment
          ? _value.lastClosedTimePayment
          : lastClosedTimePayment // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      lastClosedTimeReturns: null == lastClosedTimeReturns
          ? _value.lastClosedTimeReturns
          : lastClosedTimeReturns // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      preferSalesOrgLanguage: null == preferSalesOrgLanguage
          ? _value.preferSalesOrgLanguage
          : preferSalesOrgLanguage // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isClosed: null == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AnnouncementStateImpl extends _AnnouncementState {
  const _$AnnouncementStateImpl(
      {required this.announcement,
      required this.maintenanceItem,
      required final List<String> listBannersIdClosed,
      required this.lastClosedTimeOrder,
      required this.lastClosedTimePayment,
      required this.lastClosedTimeReturns,
      required this.preferSalesOrgLanguage,
      required this.isLoading,
      required this.isClosed})
      : _listBannersIdClosed = listBannersIdClosed,
        super._();

  @override
  final Announcement announcement;
  @override
  final MaintenanceItem maintenanceItem;
  final List<String> _listBannersIdClosed;
  @override
  List<String> get listBannersIdClosed {
    if (_listBannersIdClosed is EqualUnmodifiableListView)
      return _listBannersIdClosed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listBannersIdClosed);
  }

  @override
  final DateTimeStringValue lastClosedTimeOrder;
  @override
  final DateTimeStringValue lastClosedTimePayment;
  @override
  final DateTimeStringValue lastClosedTimeReturns;
  @override
  final bool preferSalesOrgLanguage;
  @override
  final bool isLoading;
  @override
  final bool isClosed;

  @override
  String toString() {
    return 'AnnouncementState(announcement: $announcement, maintenanceItem: $maintenanceItem, listBannersIdClosed: $listBannersIdClosed, lastClosedTimeOrder: $lastClosedTimeOrder, lastClosedTimePayment: $lastClosedTimePayment, lastClosedTimeReturns: $lastClosedTimeReturns, preferSalesOrgLanguage: $preferSalesOrgLanguage, isLoading: $isLoading, isClosed: $isClosed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnnouncementStateImpl &&
            (identical(other.announcement, announcement) ||
                other.announcement == announcement) &&
            (identical(other.maintenanceItem, maintenanceItem) ||
                other.maintenanceItem == maintenanceItem) &&
            const DeepCollectionEquality()
                .equals(other._listBannersIdClosed, _listBannersIdClosed) &&
            (identical(other.lastClosedTimeOrder, lastClosedTimeOrder) ||
                other.lastClosedTimeOrder == lastClosedTimeOrder) &&
            (identical(other.lastClosedTimePayment, lastClosedTimePayment) ||
                other.lastClosedTimePayment == lastClosedTimePayment) &&
            (identical(other.lastClosedTimeReturns, lastClosedTimeReturns) ||
                other.lastClosedTimeReturns == lastClosedTimeReturns) &&
            (identical(other.preferSalesOrgLanguage, preferSalesOrgLanguage) ||
                other.preferSalesOrgLanguage == preferSalesOrgLanguage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isClosed, isClosed) ||
                other.isClosed == isClosed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      announcement,
      maintenanceItem,
      const DeepCollectionEquality().hash(_listBannersIdClosed),
      lastClosedTimeOrder,
      lastClosedTimePayment,
      lastClosedTimeReturns,
      preferSalesOrgLanguage,
      isLoading,
      isClosed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnnouncementStateImplCopyWith<_$AnnouncementStateImpl> get copyWith =>
      __$$AnnouncementStateImplCopyWithImpl<_$AnnouncementStateImpl>(
          this, _$identity);
}

abstract class _AnnouncementState extends AnnouncementState {
  const factory _AnnouncementState(
      {required final Announcement announcement,
      required final MaintenanceItem maintenanceItem,
      required final List<String> listBannersIdClosed,
      required final DateTimeStringValue lastClosedTimeOrder,
      required final DateTimeStringValue lastClosedTimePayment,
      required final DateTimeStringValue lastClosedTimeReturns,
      required final bool preferSalesOrgLanguage,
      required final bool isLoading,
      required final bool isClosed}) = _$AnnouncementStateImpl;
  const _AnnouncementState._() : super._();

  @override
  Announcement get announcement;
  @override
  MaintenanceItem get maintenanceItem;
  @override
  List<String> get listBannersIdClosed;
  @override
  DateTimeStringValue get lastClosedTimeOrder;
  @override
  DateTimeStringValue get lastClosedTimePayment;
  @override
  DateTimeStringValue get lastClosedTimeReturns;
  @override
  bool get preferSalesOrgLanguage;
  @override
  bool get isLoading;
  @override
  bool get isClosed;
  @override
  @JsonKey(ignore: true)
  _$$AnnouncementStateImplCopyWith<_$AnnouncementStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
