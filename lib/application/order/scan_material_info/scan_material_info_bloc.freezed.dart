// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_material_info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScanMaterialInfoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisationConfigs salesOrgConfigs)
        initialized,
    required TResult Function(MaterialFilter materialFilter)
        scanMaterialNumberFromCamera,
    required TResult Function() disableScan,
    required TResult Function() scanImageFromDeviceStorage,
    required TResult Function(Ean scannedRes) emitScannedData,
    required TResult Function(bool torchState) updateTorchState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisationConfigs salesOrgConfigs)?
        initialized,
    TResult? Function(MaterialFilter materialFilter)?
        scanMaterialNumberFromCamera,
    TResult? Function()? disableScan,
    TResult? Function()? scanImageFromDeviceStorage,
    TResult? Function(Ean scannedRes)? emitScannedData,
    TResult? Function(bool torchState)? updateTorchState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisationConfigs salesOrgConfigs)?
        initialized,
    TResult Function(MaterialFilter materialFilter)?
        scanMaterialNumberFromCamera,
    TResult Function()? disableScan,
    TResult Function()? scanImageFromDeviceStorage,
    TResult Function(Ean scannedRes)? emitScannedData,
    TResult Function(bool torchState)? updateTorchState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_scanMaterialNumberFromCamera value)
        scanMaterialNumberFromCamera,
    required TResult Function(_disableScan value) disableScan,
    required TResult Function(_scanImageFromDeviceStorage value)
        scanImageFromDeviceStorage,
    required TResult Function(_emitScannedData value) emitScannedData,
    required TResult Function(_UpdateTorchState value) updateTorchState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_scanMaterialNumberFromCamera value)?
        scanMaterialNumberFromCamera,
    TResult? Function(_disableScan value)? disableScan,
    TResult? Function(_scanImageFromDeviceStorage value)?
        scanImageFromDeviceStorage,
    TResult? Function(_emitScannedData value)? emitScannedData,
    TResult? Function(_UpdateTorchState value)? updateTorchState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_scanMaterialNumberFromCamera value)?
        scanMaterialNumberFromCamera,
    TResult Function(_disableScan value)? disableScan,
    TResult Function(_scanImageFromDeviceStorage value)?
        scanImageFromDeviceStorage,
    TResult Function(_emitScannedData value)? emitScannedData,
    TResult Function(_UpdateTorchState value)? updateTorchState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanMaterialInfoEventCopyWith<$Res> {
  factory $ScanMaterialInfoEventCopyWith(ScanMaterialInfoEvent value,
          $Res Function(ScanMaterialInfoEvent) then) =
      _$ScanMaterialInfoEventCopyWithImpl<$Res, ScanMaterialInfoEvent>;
}

/// @nodoc
class _$ScanMaterialInfoEventCopyWithImpl<$Res,
        $Val extends ScanMaterialInfoEvent>
    implements $ScanMaterialInfoEventCopyWith<$Res> {
  _$ScanMaterialInfoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$initializedImplCopyWith<$Res> {
  factory _$$initializedImplCopyWith(
          _$initializedImpl value, $Res Function(_$initializedImpl) then) =
      __$$initializedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {User user,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      SalesOrganisationConfigs salesOrgConfigs});

  $UserCopyWith<$Res> get user;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs;
}

/// @nodoc
class __$$initializedImplCopyWithImpl<$Res>
    extends _$ScanMaterialInfoEventCopyWithImpl<$Res, _$initializedImpl>
    implements _$$initializedImplCopyWith<$Res> {
  __$$initializedImplCopyWithImpl(
      _$initializedImpl _value, $Res Function(_$initializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? salesOrgConfigs = null,
  }) {
    return _then(_$initializedImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      salesOrgConfigs: null == salesOrgConfigs
          ? _value.salesOrgConfigs
          : salesOrgConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
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
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.salesOrgConfigs,
        (value) {
      return _then(_value.copyWith(salesOrgConfigs: value));
    });
  }
}

/// @nodoc

class _$initializedImpl implements _initialized {
  const _$initializedImpl(
      {required this.user,
      required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.salesOrgConfigs});

  @override
  final User user;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final SalesOrganisationConfigs salesOrgConfigs;

  @override
  String toString() {
    return 'ScanMaterialInfoEvent.initialized(user: $user, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, salesOrgConfigs: $salesOrgConfigs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$initializedImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.salesOrgConfigs, salesOrgConfigs) ||
                other.salesOrgConfigs == salesOrgConfigs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, salesOrganisation,
      customerCodeInfo, shipToInfo, salesOrgConfigs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$initializedImplCopyWith<_$initializedImpl> get copyWith =>
      __$$initializedImplCopyWithImpl<_$initializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisationConfigs salesOrgConfigs)
        initialized,
    required TResult Function(MaterialFilter materialFilter)
        scanMaterialNumberFromCamera,
    required TResult Function() disableScan,
    required TResult Function() scanImageFromDeviceStorage,
    required TResult Function(Ean scannedRes) emitScannedData,
    required TResult Function(bool torchState) updateTorchState,
  }) {
    return initialized(
        user, salesOrganisation, customerCodeInfo, shipToInfo, salesOrgConfigs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisationConfigs salesOrgConfigs)?
        initialized,
    TResult? Function(MaterialFilter materialFilter)?
        scanMaterialNumberFromCamera,
    TResult? Function()? disableScan,
    TResult? Function()? scanImageFromDeviceStorage,
    TResult? Function(Ean scannedRes)? emitScannedData,
    TResult? Function(bool torchState)? updateTorchState,
  }) {
    return initialized?.call(
        user, salesOrganisation, customerCodeInfo, shipToInfo, salesOrgConfigs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisationConfigs salesOrgConfigs)?
        initialized,
    TResult Function(MaterialFilter materialFilter)?
        scanMaterialNumberFromCamera,
    TResult Function()? disableScan,
    TResult Function()? scanImageFromDeviceStorage,
    TResult Function(Ean scannedRes)? emitScannedData,
    TResult Function(bool torchState)? updateTorchState,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(user, salesOrganisation, customerCodeInfo, shipToInfo,
          salesOrgConfigs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_scanMaterialNumberFromCamera value)
        scanMaterialNumberFromCamera,
    required TResult Function(_disableScan value) disableScan,
    required TResult Function(_scanImageFromDeviceStorage value)
        scanImageFromDeviceStorage,
    required TResult Function(_emitScannedData value) emitScannedData,
    required TResult Function(_UpdateTorchState value) updateTorchState,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_scanMaterialNumberFromCamera value)?
        scanMaterialNumberFromCamera,
    TResult? Function(_disableScan value)? disableScan,
    TResult? Function(_scanImageFromDeviceStorage value)?
        scanImageFromDeviceStorage,
    TResult? Function(_emitScannedData value)? emitScannedData,
    TResult? Function(_UpdateTorchState value)? updateTorchState,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_scanMaterialNumberFromCamera value)?
        scanMaterialNumberFromCamera,
    TResult Function(_disableScan value)? disableScan,
    TResult Function(_scanImageFromDeviceStorage value)?
        scanImageFromDeviceStorage,
    TResult Function(_emitScannedData value)? emitScannedData,
    TResult Function(_UpdateTorchState value)? updateTorchState,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _initialized implements ScanMaterialInfoEvent {
  const factory _initialized(
          {required final User user,
          required final SalesOrganisation salesOrganisation,
          required final CustomerCodeInfo customerCodeInfo,
          required final ShipToInfo shipToInfo,
          required final SalesOrganisationConfigs salesOrgConfigs}) =
      _$initializedImpl;

  User get user;
  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  SalesOrganisationConfigs get salesOrgConfigs;
  @JsonKey(ignore: true)
  _$$initializedImplCopyWith<_$initializedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$scanMaterialNumberFromCameraImplCopyWith<$Res> {
  factory _$$scanMaterialNumberFromCameraImplCopyWith(
          _$scanMaterialNumberFromCameraImpl value,
          $Res Function(_$scanMaterialNumberFromCameraImpl) then) =
      __$$scanMaterialNumberFromCameraImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialFilter materialFilter});

  $MaterialFilterCopyWith<$Res> get materialFilter;
}

/// @nodoc
class __$$scanMaterialNumberFromCameraImplCopyWithImpl<$Res>
    extends _$ScanMaterialInfoEventCopyWithImpl<$Res,
        _$scanMaterialNumberFromCameraImpl>
    implements _$$scanMaterialNumberFromCameraImplCopyWith<$Res> {
  __$$scanMaterialNumberFromCameraImplCopyWithImpl(
      _$scanMaterialNumberFromCameraImpl _value,
      $Res Function(_$scanMaterialNumberFromCameraImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialFilter = null,
  }) {
    return _then(_$scanMaterialNumberFromCameraImpl(
      materialFilter: null == materialFilter
          ? _value.materialFilter
          : materialFilter // ignore: cast_nullable_to_non_nullable
              as MaterialFilter,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialFilterCopyWith<$Res> get materialFilter {
    return $MaterialFilterCopyWith<$Res>(_value.materialFilter, (value) {
      return _then(_value.copyWith(materialFilter: value));
    });
  }
}

/// @nodoc

class _$scanMaterialNumberFromCameraImpl
    implements _scanMaterialNumberFromCamera {
  const _$scanMaterialNumberFromCameraImpl({required this.materialFilter});

  @override
  final MaterialFilter materialFilter;

  @override
  String toString() {
    return 'ScanMaterialInfoEvent.scanMaterialNumberFromCamera(materialFilter: $materialFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$scanMaterialNumberFromCameraImpl &&
            (identical(other.materialFilter, materialFilter) ||
                other.materialFilter == materialFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$scanMaterialNumberFromCameraImplCopyWith<
          _$scanMaterialNumberFromCameraImpl>
      get copyWith => __$$scanMaterialNumberFromCameraImplCopyWithImpl<
          _$scanMaterialNumberFromCameraImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisationConfigs salesOrgConfigs)
        initialized,
    required TResult Function(MaterialFilter materialFilter)
        scanMaterialNumberFromCamera,
    required TResult Function() disableScan,
    required TResult Function() scanImageFromDeviceStorage,
    required TResult Function(Ean scannedRes) emitScannedData,
    required TResult Function(bool torchState) updateTorchState,
  }) {
    return scanMaterialNumberFromCamera(materialFilter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisationConfigs salesOrgConfigs)?
        initialized,
    TResult? Function(MaterialFilter materialFilter)?
        scanMaterialNumberFromCamera,
    TResult? Function()? disableScan,
    TResult? Function()? scanImageFromDeviceStorage,
    TResult? Function(Ean scannedRes)? emitScannedData,
    TResult? Function(bool torchState)? updateTorchState,
  }) {
    return scanMaterialNumberFromCamera?.call(materialFilter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisationConfigs salesOrgConfigs)?
        initialized,
    TResult Function(MaterialFilter materialFilter)?
        scanMaterialNumberFromCamera,
    TResult Function()? disableScan,
    TResult Function()? scanImageFromDeviceStorage,
    TResult Function(Ean scannedRes)? emitScannedData,
    TResult Function(bool torchState)? updateTorchState,
    required TResult orElse(),
  }) {
    if (scanMaterialNumberFromCamera != null) {
      return scanMaterialNumberFromCamera(materialFilter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_scanMaterialNumberFromCamera value)
        scanMaterialNumberFromCamera,
    required TResult Function(_disableScan value) disableScan,
    required TResult Function(_scanImageFromDeviceStorage value)
        scanImageFromDeviceStorage,
    required TResult Function(_emitScannedData value) emitScannedData,
    required TResult Function(_UpdateTorchState value) updateTorchState,
  }) {
    return scanMaterialNumberFromCamera(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_scanMaterialNumberFromCamera value)?
        scanMaterialNumberFromCamera,
    TResult? Function(_disableScan value)? disableScan,
    TResult? Function(_scanImageFromDeviceStorage value)?
        scanImageFromDeviceStorage,
    TResult? Function(_emitScannedData value)? emitScannedData,
    TResult? Function(_UpdateTorchState value)? updateTorchState,
  }) {
    return scanMaterialNumberFromCamera?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_scanMaterialNumberFromCamera value)?
        scanMaterialNumberFromCamera,
    TResult Function(_disableScan value)? disableScan,
    TResult Function(_scanImageFromDeviceStorage value)?
        scanImageFromDeviceStorage,
    TResult Function(_emitScannedData value)? emitScannedData,
    TResult Function(_UpdateTorchState value)? updateTorchState,
    required TResult orElse(),
  }) {
    if (scanMaterialNumberFromCamera != null) {
      return scanMaterialNumberFromCamera(this);
    }
    return orElse();
  }
}

abstract class _scanMaterialNumberFromCamera implements ScanMaterialInfoEvent {
  const factory _scanMaterialNumberFromCamera(
          {required final MaterialFilter materialFilter}) =
      _$scanMaterialNumberFromCameraImpl;

  MaterialFilter get materialFilter;
  @JsonKey(ignore: true)
  _$$scanMaterialNumberFromCameraImplCopyWith<
          _$scanMaterialNumberFromCameraImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$disableScanImplCopyWith<$Res> {
  factory _$$disableScanImplCopyWith(
          _$disableScanImpl value, $Res Function(_$disableScanImpl) then) =
      __$$disableScanImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$disableScanImplCopyWithImpl<$Res>
    extends _$ScanMaterialInfoEventCopyWithImpl<$Res, _$disableScanImpl>
    implements _$$disableScanImplCopyWith<$Res> {
  __$$disableScanImplCopyWithImpl(
      _$disableScanImpl _value, $Res Function(_$disableScanImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$disableScanImpl implements _disableScan {
  const _$disableScanImpl();

  @override
  String toString() {
    return 'ScanMaterialInfoEvent.disableScan()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$disableScanImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisationConfigs salesOrgConfigs)
        initialized,
    required TResult Function(MaterialFilter materialFilter)
        scanMaterialNumberFromCamera,
    required TResult Function() disableScan,
    required TResult Function() scanImageFromDeviceStorage,
    required TResult Function(Ean scannedRes) emitScannedData,
    required TResult Function(bool torchState) updateTorchState,
  }) {
    return disableScan();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisationConfigs salesOrgConfigs)?
        initialized,
    TResult? Function(MaterialFilter materialFilter)?
        scanMaterialNumberFromCamera,
    TResult? Function()? disableScan,
    TResult? Function()? scanImageFromDeviceStorage,
    TResult? Function(Ean scannedRes)? emitScannedData,
    TResult? Function(bool torchState)? updateTorchState,
  }) {
    return disableScan?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisationConfigs salesOrgConfigs)?
        initialized,
    TResult Function(MaterialFilter materialFilter)?
        scanMaterialNumberFromCamera,
    TResult Function()? disableScan,
    TResult Function()? scanImageFromDeviceStorage,
    TResult Function(Ean scannedRes)? emitScannedData,
    TResult Function(bool torchState)? updateTorchState,
    required TResult orElse(),
  }) {
    if (disableScan != null) {
      return disableScan();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_scanMaterialNumberFromCamera value)
        scanMaterialNumberFromCamera,
    required TResult Function(_disableScan value) disableScan,
    required TResult Function(_scanImageFromDeviceStorage value)
        scanImageFromDeviceStorage,
    required TResult Function(_emitScannedData value) emitScannedData,
    required TResult Function(_UpdateTorchState value) updateTorchState,
  }) {
    return disableScan(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_scanMaterialNumberFromCamera value)?
        scanMaterialNumberFromCamera,
    TResult? Function(_disableScan value)? disableScan,
    TResult? Function(_scanImageFromDeviceStorage value)?
        scanImageFromDeviceStorage,
    TResult? Function(_emitScannedData value)? emitScannedData,
    TResult? Function(_UpdateTorchState value)? updateTorchState,
  }) {
    return disableScan?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_scanMaterialNumberFromCamera value)?
        scanMaterialNumberFromCamera,
    TResult Function(_disableScan value)? disableScan,
    TResult Function(_scanImageFromDeviceStorage value)?
        scanImageFromDeviceStorage,
    TResult Function(_emitScannedData value)? emitScannedData,
    TResult Function(_UpdateTorchState value)? updateTorchState,
    required TResult orElse(),
  }) {
    if (disableScan != null) {
      return disableScan(this);
    }
    return orElse();
  }
}

abstract class _disableScan implements ScanMaterialInfoEvent {
  const factory _disableScan() = _$disableScanImpl;
}

/// @nodoc
abstract class _$$scanImageFromDeviceStorageImplCopyWith<$Res> {
  factory _$$scanImageFromDeviceStorageImplCopyWith(
          _$scanImageFromDeviceStorageImpl value,
          $Res Function(_$scanImageFromDeviceStorageImpl) then) =
      __$$scanImageFromDeviceStorageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$scanImageFromDeviceStorageImplCopyWithImpl<$Res>
    extends _$ScanMaterialInfoEventCopyWithImpl<$Res,
        _$scanImageFromDeviceStorageImpl>
    implements _$$scanImageFromDeviceStorageImplCopyWith<$Res> {
  __$$scanImageFromDeviceStorageImplCopyWithImpl(
      _$scanImageFromDeviceStorageImpl _value,
      $Res Function(_$scanImageFromDeviceStorageImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$scanImageFromDeviceStorageImpl implements _scanImageFromDeviceStorage {
  const _$scanImageFromDeviceStorageImpl();

  @override
  String toString() {
    return 'ScanMaterialInfoEvent.scanImageFromDeviceStorage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$scanImageFromDeviceStorageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisationConfigs salesOrgConfigs)
        initialized,
    required TResult Function(MaterialFilter materialFilter)
        scanMaterialNumberFromCamera,
    required TResult Function() disableScan,
    required TResult Function() scanImageFromDeviceStorage,
    required TResult Function(Ean scannedRes) emitScannedData,
    required TResult Function(bool torchState) updateTorchState,
  }) {
    return scanImageFromDeviceStorage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisationConfigs salesOrgConfigs)?
        initialized,
    TResult? Function(MaterialFilter materialFilter)?
        scanMaterialNumberFromCamera,
    TResult? Function()? disableScan,
    TResult? Function()? scanImageFromDeviceStorage,
    TResult? Function(Ean scannedRes)? emitScannedData,
    TResult? Function(bool torchState)? updateTorchState,
  }) {
    return scanImageFromDeviceStorage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisationConfigs salesOrgConfigs)?
        initialized,
    TResult Function(MaterialFilter materialFilter)?
        scanMaterialNumberFromCamera,
    TResult Function()? disableScan,
    TResult Function()? scanImageFromDeviceStorage,
    TResult Function(Ean scannedRes)? emitScannedData,
    TResult Function(bool torchState)? updateTorchState,
    required TResult orElse(),
  }) {
    if (scanImageFromDeviceStorage != null) {
      return scanImageFromDeviceStorage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_scanMaterialNumberFromCamera value)
        scanMaterialNumberFromCamera,
    required TResult Function(_disableScan value) disableScan,
    required TResult Function(_scanImageFromDeviceStorage value)
        scanImageFromDeviceStorage,
    required TResult Function(_emitScannedData value) emitScannedData,
    required TResult Function(_UpdateTorchState value) updateTorchState,
  }) {
    return scanImageFromDeviceStorage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_scanMaterialNumberFromCamera value)?
        scanMaterialNumberFromCamera,
    TResult? Function(_disableScan value)? disableScan,
    TResult? Function(_scanImageFromDeviceStorage value)?
        scanImageFromDeviceStorage,
    TResult? Function(_emitScannedData value)? emitScannedData,
    TResult? Function(_UpdateTorchState value)? updateTorchState,
  }) {
    return scanImageFromDeviceStorage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_scanMaterialNumberFromCamera value)?
        scanMaterialNumberFromCamera,
    TResult Function(_disableScan value)? disableScan,
    TResult Function(_scanImageFromDeviceStorage value)?
        scanImageFromDeviceStorage,
    TResult Function(_emitScannedData value)? emitScannedData,
    TResult Function(_UpdateTorchState value)? updateTorchState,
    required TResult orElse(),
  }) {
    if (scanImageFromDeviceStorage != null) {
      return scanImageFromDeviceStorage(this);
    }
    return orElse();
  }
}

abstract class _scanImageFromDeviceStorage implements ScanMaterialInfoEvent {
  const factory _scanImageFromDeviceStorage() =
      _$scanImageFromDeviceStorageImpl;
}

/// @nodoc
abstract class _$$emitScannedDataImplCopyWith<$Res> {
  factory _$$emitScannedDataImplCopyWith(_$emitScannedDataImpl value,
          $Res Function(_$emitScannedDataImpl) then) =
      __$$emitScannedDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Ean scannedRes});
}

/// @nodoc
class __$$emitScannedDataImplCopyWithImpl<$Res>
    extends _$ScanMaterialInfoEventCopyWithImpl<$Res, _$emitScannedDataImpl>
    implements _$$emitScannedDataImplCopyWith<$Res> {
  __$$emitScannedDataImplCopyWithImpl(
      _$emitScannedDataImpl _value, $Res Function(_$emitScannedDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scannedRes = null,
  }) {
    return _then(_$emitScannedDataImpl(
      scannedRes: null == scannedRes
          ? _value.scannedRes
          : scannedRes // ignore: cast_nullable_to_non_nullable
              as Ean,
    ));
  }
}

/// @nodoc

class _$emitScannedDataImpl implements _emitScannedData {
  const _$emitScannedDataImpl({required this.scannedRes});

  @override
  final Ean scannedRes;

  @override
  String toString() {
    return 'ScanMaterialInfoEvent.emitScannedData(scannedRes: $scannedRes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$emitScannedDataImpl &&
            (identical(other.scannedRes, scannedRes) ||
                other.scannedRes == scannedRes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, scannedRes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$emitScannedDataImplCopyWith<_$emitScannedDataImpl> get copyWith =>
      __$$emitScannedDataImplCopyWithImpl<_$emitScannedDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisationConfigs salesOrgConfigs)
        initialized,
    required TResult Function(MaterialFilter materialFilter)
        scanMaterialNumberFromCamera,
    required TResult Function() disableScan,
    required TResult Function() scanImageFromDeviceStorage,
    required TResult Function(Ean scannedRes) emitScannedData,
    required TResult Function(bool torchState) updateTorchState,
  }) {
    return emitScannedData(scannedRes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisationConfigs salesOrgConfigs)?
        initialized,
    TResult? Function(MaterialFilter materialFilter)?
        scanMaterialNumberFromCamera,
    TResult? Function()? disableScan,
    TResult? Function()? scanImageFromDeviceStorage,
    TResult? Function(Ean scannedRes)? emitScannedData,
    TResult? Function(bool torchState)? updateTorchState,
  }) {
    return emitScannedData?.call(scannedRes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisationConfigs salesOrgConfigs)?
        initialized,
    TResult Function(MaterialFilter materialFilter)?
        scanMaterialNumberFromCamera,
    TResult Function()? disableScan,
    TResult Function()? scanImageFromDeviceStorage,
    TResult Function(Ean scannedRes)? emitScannedData,
    TResult Function(bool torchState)? updateTorchState,
    required TResult orElse(),
  }) {
    if (emitScannedData != null) {
      return emitScannedData(scannedRes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_scanMaterialNumberFromCamera value)
        scanMaterialNumberFromCamera,
    required TResult Function(_disableScan value) disableScan,
    required TResult Function(_scanImageFromDeviceStorage value)
        scanImageFromDeviceStorage,
    required TResult Function(_emitScannedData value) emitScannedData,
    required TResult Function(_UpdateTorchState value) updateTorchState,
  }) {
    return emitScannedData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_scanMaterialNumberFromCamera value)?
        scanMaterialNumberFromCamera,
    TResult? Function(_disableScan value)? disableScan,
    TResult? Function(_scanImageFromDeviceStorage value)?
        scanImageFromDeviceStorage,
    TResult? Function(_emitScannedData value)? emitScannedData,
    TResult? Function(_UpdateTorchState value)? updateTorchState,
  }) {
    return emitScannedData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_scanMaterialNumberFromCamera value)?
        scanMaterialNumberFromCamera,
    TResult Function(_disableScan value)? disableScan,
    TResult Function(_scanImageFromDeviceStorage value)?
        scanImageFromDeviceStorage,
    TResult Function(_emitScannedData value)? emitScannedData,
    TResult Function(_UpdateTorchState value)? updateTorchState,
    required TResult orElse(),
  }) {
    if (emitScannedData != null) {
      return emitScannedData(this);
    }
    return orElse();
  }
}

abstract class _emitScannedData implements ScanMaterialInfoEvent {
  const factory _emitScannedData({required final Ean scannedRes}) =
      _$emitScannedDataImpl;

  Ean get scannedRes;
  @JsonKey(ignore: true)
  _$$emitScannedDataImplCopyWith<_$emitScannedDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateTorchStateImplCopyWith<$Res> {
  factory _$$UpdateTorchStateImplCopyWith(_$UpdateTorchStateImpl value,
          $Res Function(_$UpdateTorchStateImpl) then) =
      __$$UpdateTorchStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool torchState});
}

/// @nodoc
class __$$UpdateTorchStateImplCopyWithImpl<$Res>
    extends _$ScanMaterialInfoEventCopyWithImpl<$Res, _$UpdateTorchStateImpl>
    implements _$$UpdateTorchStateImplCopyWith<$Res> {
  __$$UpdateTorchStateImplCopyWithImpl(_$UpdateTorchStateImpl _value,
      $Res Function(_$UpdateTorchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? torchState = null,
  }) {
    return _then(_$UpdateTorchStateImpl(
      torchState: null == torchState
          ? _value.torchState
          : torchState // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UpdateTorchStateImpl implements _UpdateTorchState {
  const _$UpdateTorchStateImpl({required this.torchState});

  @override
  final bool torchState;

  @override
  String toString() {
    return 'ScanMaterialInfoEvent.updateTorchState(torchState: $torchState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTorchStateImpl &&
            (identical(other.torchState, torchState) ||
                other.torchState == torchState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, torchState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTorchStateImplCopyWith<_$UpdateTorchStateImpl> get copyWith =>
      __$$UpdateTorchStateImplCopyWithImpl<_$UpdateTorchStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisationConfigs salesOrgConfigs)
        initialized,
    required TResult Function(MaterialFilter materialFilter)
        scanMaterialNumberFromCamera,
    required TResult Function() disableScan,
    required TResult Function() scanImageFromDeviceStorage,
    required TResult Function(Ean scannedRes) emitScannedData,
    required TResult Function(bool torchState) updateTorchState,
  }) {
    return updateTorchState(torchState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisationConfigs salesOrgConfigs)?
        initialized,
    TResult? Function(MaterialFilter materialFilter)?
        scanMaterialNumberFromCamera,
    TResult? Function()? disableScan,
    TResult? Function()? scanImageFromDeviceStorage,
    TResult? Function(Ean scannedRes)? emitScannedData,
    TResult? Function(bool torchState)? updateTorchState,
  }) {
    return updateTorchState?.call(torchState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            SalesOrganisationConfigs salesOrgConfigs)?
        initialized,
    TResult Function(MaterialFilter materialFilter)?
        scanMaterialNumberFromCamera,
    TResult Function()? disableScan,
    TResult Function()? scanImageFromDeviceStorage,
    TResult Function(Ean scannedRes)? emitScannedData,
    TResult Function(bool torchState)? updateTorchState,
    required TResult orElse(),
  }) {
    if (updateTorchState != null) {
      return updateTorchState(torchState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_scanMaterialNumberFromCamera value)
        scanMaterialNumberFromCamera,
    required TResult Function(_disableScan value) disableScan,
    required TResult Function(_scanImageFromDeviceStorage value)
        scanImageFromDeviceStorage,
    required TResult Function(_emitScannedData value) emitScannedData,
    required TResult Function(_UpdateTorchState value) updateTorchState,
  }) {
    return updateTorchState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_scanMaterialNumberFromCamera value)?
        scanMaterialNumberFromCamera,
    TResult? Function(_disableScan value)? disableScan,
    TResult? Function(_scanImageFromDeviceStorage value)?
        scanImageFromDeviceStorage,
    TResult? Function(_emitScannedData value)? emitScannedData,
    TResult? Function(_UpdateTorchState value)? updateTorchState,
  }) {
    return updateTorchState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_scanMaterialNumberFromCamera value)?
        scanMaterialNumberFromCamera,
    TResult Function(_disableScan value)? disableScan,
    TResult Function(_scanImageFromDeviceStorage value)?
        scanImageFromDeviceStorage,
    TResult Function(_emitScannedData value)? emitScannedData,
    TResult Function(_UpdateTorchState value)? updateTorchState,
    required TResult orElse(),
  }) {
    if (updateTorchState != null) {
      return updateTorchState(this);
    }
    return orElse();
  }
}

abstract class _UpdateTorchState implements ScanMaterialInfoEvent {
  const factory _UpdateTorchState({required final bool torchState}) =
      _$UpdateTorchStateImpl;

  bool get torchState;
  @JsonKey(ignore: true)
  _$$UpdateTorchStateImplCopyWith<_$UpdateTorchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ScanMaterialInfoState {
  MaterialInfo get material => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  SalesOrganisationConfigs get salesOrgConfigs =>
      throw _privateConstructorUsedError;
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isScanInProgress => throw _privateConstructorUsedError;
  bool get isTorchStateEnabled => throw _privateConstructorUsedError;
  MaterialFilter get materialFilter => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScanMaterialInfoStateCopyWith<ScanMaterialInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanMaterialInfoStateCopyWith<$Res> {
  factory $ScanMaterialInfoStateCopyWith(ScanMaterialInfoState value,
          $Res Function(ScanMaterialInfoState) then) =
      _$ScanMaterialInfoStateCopyWithImpl<$Res, ScanMaterialInfoState>;
  @useResult
  $Res call(
      {MaterialInfo material,
      User user,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      SalesOrganisationConfigs salesOrgConfigs,
      ShipToInfo shipToInfo,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool isScanInProgress,
      bool isTorchStateEnabled,
      MaterialFilter materialFilter});

  $MaterialInfoCopyWith<$Res> get material;
  $UserCopyWith<$Res> get user;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $MaterialFilterCopyWith<$Res> get materialFilter;
}

/// @nodoc
class _$ScanMaterialInfoStateCopyWithImpl<$Res,
        $Val extends ScanMaterialInfoState>
    implements $ScanMaterialInfoStateCopyWith<$Res> {
  _$ScanMaterialInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? material = null,
    Object? user = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? salesOrgConfigs = null,
    Object? shipToInfo = null,
    Object? apiFailureOrSuccessOption = null,
    Object? isScanInProgress = null,
    Object? isTorchStateEnabled = null,
    Object? materialFilter = null,
  }) {
    return _then(_value.copyWith(
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrgConfigs: null == salesOrgConfigs
          ? _value.salesOrgConfigs
          : salesOrgConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isScanInProgress: null == isScanInProgress
          ? _value.isScanInProgress
          : isScanInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      isTorchStateEnabled: null == isTorchStateEnabled
          ? _value.isTorchStateEnabled
          : isTorchStateEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      materialFilter: null == materialFilter
          ? _value.materialFilter
          : materialFilter // ignore: cast_nullable_to_non_nullable
              as MaterialFilter,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialInfoCopyWith<$Res> get material {
    return $MaterialInfoCopyWith<$Res>(_value.material, (value) {
      return _then(_value.copyWith(material: value) as $Val);
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
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value) as $Val);
    });
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
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.salesOrgConfigs,
        (value) {
      return _then(_value.copyWith(salesOrgConfigs: value) as $Val);
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
  $MaterialFilterCopyWith<$Res> get materialFilter {
    return $MaterialFilterCopyWith<$Res>(_value.materialFilter, (value) {
      return _then(_value.copyWith(materialFilter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScanMaterialInfoStateImplCopyWith<$Res>
    implements $ScanMaterialInfoStateCopyWith<$Res> {
  factory _$$ScanMaterialInfoStateImplCopyWith(
          _$ScanMaterialInfoStateImpl value,
          $Res Function(_$ScanMaterialInfoStateImpl) then) =
      __$$ScanMaterialInfoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MaterialInfo material,
      User user,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      SalesOrganisationConfigs salesOrgConfigs,
      ShipToInfo shipToInfo,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool isScanInProgress,
      bool isTorchStateEnabled,
      MaterialFilter materialFilter});

  @override
  $MaterialInfoCopyWith<$Res> get material;
  @override
  $UserCopyWith<$Res> get user;
  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs;
  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  @override
  $MaterialFilterCopyWith<$Res> get materialFilter;
}

/// @nodoc
class __$$ScanMaterialInfoStateImplCopyWithImpl<$Res>
    extends _$ScanMaterialInfoStateCopyWithImpl<$Res,
        _$ScanMaterialInfoStateImpl>
    implements _$$ScanMaterialInfoStateImplCopyWith<$Res> {
  __$$ScanMaterialInfoStateImplCopyWithImpl(_$ScanMaterialInfoStateImpl _value,
      $Res Function(_$ScanMaterialInfoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? material = null,
    Object? user = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? salesOrgConfigs = null,
    Object? shipToInfo = null,
    Object? apiFailureOrSuccessOption = null,
    Object? isScanInProgress = null,
    Object? isTorchStateEnabled = null,
    Object? materialFilter = null,
  }) {
    return _then(_$ScanMaterialInfoStateImpl(
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrgConfigs: null == salesOrgConfigs
          ? _value.salesOrgConfigs
          : salesOrgConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isScanInProgress: null == isScanInProgress
          ? _value.isScanInProgress
          : isScanInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      isTorchStateEnabled: null == isTorchStateEnabled
          ? _value.isTorchStateEnabled
          : isTorchStateEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      materialFilter: null == materialFilter
          ? _value.materialFilter
          : materialFilter // ignore: cast_nullable_to_non_nullable
              as MaterialFilter,
    ));
  }
}

/// @nodoc

class _$ScanMaterialInfoStateImpl extends _ScanMaterialInfoState {
  const _$ScanMaterialInfoStateImpl(
      {required this.material,
      required this.user,
      required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.salesOrgConfigs,
      required this.shipToInfo,
      required this.apiFailureOrSuccessOption,
      required this.isScanInProgress,
      required this.isTorchStateEnabled,
      required this.materialFilter})
      : super._();

  @override
  final MaterialInfo material;
  @override
  final User user;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final SalesOrganisationConfigs salesOrgConfigs;
  @override
  final ShipToInfo shipToInfo;
  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;
  @override
  final bool isScanInProgress;
  @override
  final bool isTorchStateEnabled;
  @override
  final MaterialFilter materialFilter;

  @override
  String toString() {
    return 'ScanMaterialInfoState(material: $material, user: $user, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, salesOrgConfigs: $salesOrgConfigs, shipToInfo: $shipToInfo, apiFailureOrSuccessOption: $apiFailureOrSuccessOption, isScanInProgress: $isScanInProgress, isTorchStateEnabled: $isTorchStateEnabled, materialFilter: $materialFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanMaterialInfoStateImpl &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.salesOrgConfigs, salesOrgConfigs) ||
                other.salesOrgConfigs == salesOrgConfigs) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption) &&
            (identical(other.isScanInProgress, isScanInProgress) ||
                other.isScanInProgress == isScanInProgress) &&
            (identical(other.isTorchStateEnabled, isTorchStateEnabled) ||
                other.isTorchStateEnabled == isTorchStateEnabled) &&
            (identical(other.materialFilter, materialFilter) ||
                other.materialFilter == materialFilter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      material,
      user,
      salesOrganisation,
      customerCodeInfo,
      salesOrgConfigs,
      shipToInfo,
      apiFailureOrSuccessOption,
      isScanInProgress,
      isTorchStateEnabled,
      materialFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanMaterialInfoStateImplCopyWith<_$ScanMaterialInfoStateImpl>
      get copyWith => __$$ScanMaterialInfoStateImplCopyWithImpl<
          _$ScanMaterialInfoStateImpl>(this, _$identity);
}

abstract class _ScanMaterialInfoState extends ScanMaterialInfoState {
  const factory _ScanMaterialInfoState(
          {required final MaterialInfo material,
          required final User user,
          required final SalesOrganisation salesOrganisation,
          required final CustomerCodeInfo customerCodeInfo,
          required final SalesOrganisationConfigs salesOrgConfigs,
          required final ShipToInfo shipToInfo,
          required final Option<Either<ApiFailure, dynamic>>
              apiFailureOrSuccessOption,
          required final bool isScanInProgress,
          required final bool isTorchStateEnabled,
          required final MaterialFilter materialFilter}) =
      _$ScanMaterialInfoStateImpl;
  const _ScanMaterialInfoState._() : super._();

  @override
  MaterialInfo get material;
  @override
  User get user;
  @override
  SalesOrganisation get salesOrganisation;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  SalesOrganisationConfigs get salesOrgConfigs;
  @override
  ShipToInfo get shipToInfo;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  bool get isScanInProgress;
  @override
  bool get isTorchStateEnabled;
  @override
  MaterialFilter get materialFilter;
  @override
  @JsonKey(ignore: true)
  _$$ScanMaterialInfoStateImplCopyWith<_$ScanMaterialInfoStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
