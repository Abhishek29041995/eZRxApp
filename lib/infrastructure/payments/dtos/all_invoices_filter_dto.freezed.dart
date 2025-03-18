// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_invoices_filter_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AllInvoicesFilterDto _$AllInvoicesFilterDtoFromJson(Map<String, dynamic> json) {
  return _AllInvoicesFilterDto.fromJson(json);
}

/// @nodoc
mixin _$AllInvoicesFilterDto {
  @JsonKey(name: 'dueDateFrom', defaultValue: '')
  String get dueDateFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'dueDateTo', defaultValue: '')
  String get dueDateTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'documentDateFrom', defaultValue: '')
  String get documentDateFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'documentDateTo', defaultValue: '')
  String get documentDateTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'amountValueFrom', defaultValue: '')
  String get amountValueFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'amountValueTo', defaultValue: '')
  String get amountValueTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'filterStatuses', defaultValue: '')
  String get filterStatuses => throw _privateConstructorUsedError;
  @JsonKey(name: 'accountingDocument', defaultValue: '')
  String get searchKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllInvoicesFilterDtoCopyWith<AllInvoicesFilterDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllInvoicesFilterDtoCopyWith<$Res> {
  factory $AllInvoicesFilterDtoCopyWith(AllInvoicesFilterDto value,
          $Res Function(AllInvoicesFilterDto) then) =
      _$AllInvoicesFilterDtoCopyWithImpl<$Res, AllInvoicesFilterDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'dueDateFrom', defaultValue: '') String dueDateFrom,
      @JsonKey(name: 'dueDateTo', defaultValue: '') String dueDateTo,
      @JsonKey(name: 'documentDateFrom', defaultValue: '')
      String documentDateFrom,
      @JsonKey(name: 'documentDateTo', defaultValue: '') String documentDateTo,
      @JsonKey(name: 'amountValueFrom', defaultValue: '')
      String amountValueFrom,
      @JsonKey(name: 'amountValueTo', defaultValue: '') String amountValueTo,
      @JsonKey(name: 'filterStatuses', defaultValue: '') String filterStatuses,
      @JsonKey(name: 'accountingDocument', defaultValue: '') String searchKey});
}

/// @nodoc
class _$AllInvoicesFilterDtoCopyWithImpl<$Res,
        $Val extends AllInvoicesFilterDto>
    implements $AllInvoicesFilterDtoCopyWith<$Res> {
  _$AllInvoicesFilterDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dueDateFrom = null,
    Object? dueDateTo = null,
    Object? documentDateFrom = null,
    Object? documentDateTo = null,
    Object? amountValueFrom = null,
    Object? amountValueTo = null,
    Object? filterStatuses = null,
    Object? searchKey = null,
  }) {
    return _then(_value.copyWith(
      dueDateFrom: null == dueDateFrom
          ? _value.dueDateFrom
          : dueDateFrom // ignore: cast_nullable_to_non_nullable
              as String,
      dueDateTo: null == dueDateTo
          ? _value.dueDateTo
          : dueDateTo // ignore: cast_nullable_to_non_nullable
              as String,
      documentDateFrom: null == documentDateFrom
          ? _value.documentDateFrom
          : documentDateFrom // ignore: cast_nullable_to_non_nullable
              as String,
      documentDateTo: null == documentDateTo
          ? _value.documentDateTo
          : documentDateTo // ignore: cast_nullable_to_non_nullable
              as String,
      amountValueFrom: null == amountValueFrom
          ? _value.amountValueFrom
          : amountValueFrom // ignore: cast_nullable_to_non_nullable
              as String,
      amountValueTo: null == amountValueTo
          ? _value.amountValueTo
          : amountValueTo // ignore: cast_nullable_to_non_nullable
              as String,
      filterStatuses: null == filterStatuses
          ? _value.filterStatuses
          : filterStatuses // ignore: cast_nullable_to_non_nullable
              as String,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllInvoicesFilterDtoImplCopyWith<$Res>
    implements $AllInvoicesFilterDtoCopyWith<$Res> {
  factory _$$AllInvoicesFilterDtoImplCopyWith(_$AllInvoicesFilterDtoImpl value,
          $Res Function(_$AllInvoicesFilterDtoImpl) then) =
      __$$AllInvoicesFilterDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'dueDateFrom', defaultValue: '') String dueDateFrom,
      @JsonKey(name: 'dueDateTo', defaultValue: '') String dueDateTo,
      @JsonKey(name: 'documentDateFrom', defaultValue: '')
      String documentDateFrom,
      @JsonKey(name: 'documentDateTo', defaultValue: '') String documentDateTo,
      @JsonKey(name: 'amountValueFrom', defaultValue: '')
      String amountValueFrom,
      @JsonKey(name: 'amountValueTo', defaultValue: '') String amountValueTo,
      @JsonKey(name: 'filterStatuses', defaultValue: '') String filterStatuses,
      @JsonKey(name: 'accountingDocument', defaultValue: '') String searchKey});
}

/// @nodoc
class __$$AllInvoicesFilterDtoImplCopyWithImpl<$Res>
    extends _$AllInvoicesFilterDtoCopyWithImpl<$Res, _$AllInvoicesFilterDtoImpl>
    implements _$$AllInvoicesFilterDtoImplCopyWith<$Res> {
  __$$AllInvoicesFilterDtoImplCopyWithImpl(_$AllInvoicesFilterDtoImpl _value,
      $Res Function(_$AllInvoicesFilterDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dueDateFrom = null,
    Object? dueDateTo = null,
    Object? documentDateFrom = null,
    Object? documentDateTo = null,
    Object? amountValueFrom = null,
    Object? amountValueTo = null,
    Object? filterStatuses = null,
    Object? searchKey = null,
  }) {
    return _then(_$AllInvoicesFilterDtoImpl(
      dueDateFrom: null == dueDateFrom
          ? _value.dueDateFrom
          : dueDateFrom // ignore: cast_nullable_to_non_nullable
              as String,
      dueDateTo: null == dueDateTo
          ? _value.dueDateTo
          : dueDateTo // ignore: cast_nullable_to_non_nullable
              as String,
      documentDateFrom: null == documentDateFrom
          ? _value.documentDateFrom
          : documentDateFrom // ignore: cast_nullable_to_non_nullable
              as String,
      documentDateTo: null == documentDateTo
          ? _value.documentDateTo
          : documentDateTo // ignore: cast_nullable_to_non_nullable
              as String,
      amountValueFrom: null == amountValueFrom
          ? _value.amountValueFrom
          : amountValueFrom // ignore: cast_nullable_to_non_nullable
              as String,
      amountValueTo: null == amountValueTo
          ? _value.amountValueTo
          : amountValueTo // ignore: cast_nullable_to_non_nullable
              as String,
      filterStatuses: null == filterStatuses
          ? _value.filterStatuses
          : filterStatuses // ignore: cast_nullable_to_non_nullable
              as String,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AllInvoicesFilterDtoImpl extends _AllInvoicesFilterDto {
  const _$AllInvoicesFilterDtoImpl(
      {@JsonKey(name: 'dueDateFrom', defaultValue: '')
      required this.dueDateFrom,
      @JsonKey(name: 'dueDateTo', defaultValue: '') required this.dueDateTo,
      @JsonKey(name: 'documentDateFrom', defaultValue: '')
      required this.documentDateFrom,
      @JsonKey(name: 'documentDateTo', defaultValue: '')
      required this.documentDateTo,
      @JsonKey(name: 'amountValueFrom', defaultValue: '')
      required this.amountValueFrom,
      @JsonKey(name: 'amountValueTo', defaultValue: '')
      required this.amountValueTo,
      @JsonKey(name: 'filterStatuses', defaultValue: '')
      required this.filterStatuses,
      @JsonKey(name: 'accountingDocument', defaultValue: '')
      required this.searchKey})
      : super._();

  factory _$AllInvoicesFilterDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllInvoicesFilterDtoImplFromJson(json);

  @override
  @JsonKey(name: 'dueDateFrom', defaultValue: '')
  final String dueDateFrom;
  @override
  @JsonKey(name: 'dueDateTo', defaultValue: '')
  final String dueDateTo;
  @override
  @JsonKey(name: 'documentDateFrom', defaultValue: '')
  final String documentDateFrom;
  @override
  @JsonKey(name: 'documentDateTo', defaultValue: '')
  final String documentDateTo;
  @override
  @JsonKey(name: 'amountValueFrom', defaultValue: '')
  final String amountValueFrom;
  @override
  @JsonKey(name: 'amountValueTo', defaultValue: '')
  final String amountValueTo;
  @override
  @JsonKey(name: 'filterStatuses', defaultValue: '')
  final String filterStatuses;
  @override
  @JsonKey(name: 'accountingDocument', defaultValue: '')
  final String searchKey;

  @override
  String toString() {
    return 'AllInvoicesFilterDto(dueDateFrom: $dueDateFrom, dueDateTo: $dueDateTo, documentDateFrom: $documentDateFrom, documentDateTo: $documentDateTo, amountValueFrom: $amountValueFrom, amountValueTo: $amountValueTo, filterStatuses: $filterStatuses, searchKey: $searchKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllInvoicesFilterDtoImpl &&
            (identical(other.dueDateFrom, dueDateFrom) ||
                other.dueDateFrom == dueDateFrom) &&
            (identical(other.dueDateTo, dueDateTo) ||
                other.dueDateTo == dueDateTo) &&
            (identical(other.documentDateFrom, documentDateFrom) ||
                other.documentDateFrom == documentDateFrom) &&
            (identical(other.documentDateTo, documentDateTo) ||
                other.documentDateTo == documentDateTo) &&
            (identical(other.amountValueFrom, amountValueFrom) ||
                other.amountValueFrom == amountValueFrom) &&
            (identical(other.amountValueTo, amountValueTo) ||
                other.amountValueTo == amountValueTo) &&
            (identical(other.filterStatuses, filterStatuses) ||
                other.filterStatuses == filterStatuses) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      dueDateFrom,
      dueDateTo,
      documentDateFrom,
      documentDateTo,
      amountValueFrom,
      amountValueTo,
      filterStatuses,
      searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllInvoicesFilterDtoImplCopyWith<_$AllInvoicesFilterDtoImpl>
      get copyWith =>
          __$$AllInvoicesFilterDtoImplCopyWithImpl<_$AllInvoicesFilterDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllInvoicesFilterDtoImplToJson(
      this,
    );
  }
}

abstract class _AllInvoicesFilterDto extends AllInvoicesFilterDto {
  const factory _AllInvoicesFilterDto(
      {@JsonKey(name: 'dueDateFrom', defaultValue: '')
      required final String dueDateFrom,
      @JsonKey(name: 'dueDateTo', defaultValue: '')
      required final String dueDateTo,
      @JsonKey(name: 'documentDateFrom', defaultValue: '')
      required final String documentDateFrom,
      @JsonKey(name: 'documentDateTo', defaultValue: '')
      required final String documentDateTo,
      @JsonKey(name: 'amountValueFrom', defaultValue: '')
      required final String amountValueFrom,
      @JsonKey(name: 'amountValueTo', defaultValue: '')
      required final String amountValueTo,
      @JsonKey(name: 'filterStatuses', defaultValue: '')
      required final String filterStatuses,
      @JsonKey(name: 'accountingDocument', defaultValue: '')
      required final String searchKey}) = _$AllInvoicesFilterDtoImpl;
  const _AllInvoicesFilterDto._() : super._();

  factory _AllInvoicesFilterDto.fromJson(Map<String, dynamic> json) =
      _$AllInvoicesFilterDtoImpl.fromJson;

  @override
  @JsonKey(name: 'dueDateFrom', defaultValue: '')
  String get dueDateFrom;
  @override
  @JsonKey(name: 'dueDateTo', defaultValue: '')
  String get dueDateTo;
  @override
  @JsonKey(name: 'documentDateFrom', defaultValue: '')
  String get documentDateFrom;
  @override
  @JsonKey(name: 'documentDateTo', defaultValue: '')
  String get documentDateTo;
  @override
  @JsonKey(name: 'amountValueFrom', defaultValue: '')
  String get amountValueFrom;
  @override
  @JsonKey(name: 'amountValueTo', defaultValue: '')
  String get amountValueTo;
  @override
  @JsonKey(name: 'filterStatuses', defaultValue: '')
  String get filterStatuses;
  @override
  @JsonKey(name: 'accountingDocument', defaultValue: '')
  String get searchKey;
  @override
  @JsonKey(ignore: true)
  _$$AllInvoicesFilterDtoImplCopyWith<_$AllInvoicesFilterDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
