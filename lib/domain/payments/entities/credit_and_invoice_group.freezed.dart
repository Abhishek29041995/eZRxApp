// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_and_invoice_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreditAndInvoiceGroup {
  DateTimeStringValue get dueDate => throw _privateConstructorUsedError;
  List<CreditAndInvoiceItem> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreditAndInvoiceGroupCopyWith<CreditAndInvoiceGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditAndInvoiceGroupCopyWith<$Res> {
  factory $CreditAndInvoiceGroupCopyWith(CreditAndInvoiceGroup value,
          $Res Function(CreditAndInvoiceGroup) then) =
      _$CreditAndInvoiceGroupCopyWithImpl<$Res, CreditAndInvoiceGroup>;
  @useResult
  $Res call({DateTimeStringValue dueDate, List<CreditAndInvoiceItem> items});
}

/// @nodoc
class _$CreditAndInvoiceGroupCopyWithImpl<$Res,
        $Val extends CreditAndInvoiceGroup>
    implements $CreditAndInvoiceGroupCopyWith<$Res> {
  _$CreditAndInvoiceGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dueDate = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CreditAndInvoiceItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreditAndInvoiceGroupImplCopyWith<$Res>
    implements $CreditAndInvoiceGroupCopyWith<$Res> {
  factory _$$CreditAndInvoiceGroupImplCopyWith(
          _$CreditAndInvoiceGroupImpl value,
          $Res Function(_$CreditAndInvoiceGroupImpl) then) =
      __$$CreditAndInvoiceGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTimeStringValue dueDate, List<CreditAndInvoiceItem> items});
}

/// @nodoc
class __$$CreditAndInvoiceGroupImplCopyWithImpl<$Res>
    extends _$CreditAndInvoiceGroupCopyWithImpl<$Res,
        _$CreditAndInvoiceGroupImpl>
    implements _$$CreditAndInvoiceGroupImplCopyWith<$Res> {
  __$$CreditAndInvoiceGroupImplCopyWithImpl(_$CreditAndInvoiceGroupImpl _value,
      $Res Function(_$CreditAndInvoiceGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dueDate = null,
    Object? items = null,
  }) {
    return _then(_$CreditAndInvoiceGroupImpl(
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CreditAndInvoiceItem>,
    ));
  }
}

/// @nodoc

class _$CreditAndInvoiceGroupImpl implements _CreditAndInvoiceGroup {
  _$CreditAndInvoiceGroupImpl(
      {required this.dueDate, required final List<CreditAndInvoiceItem> items})
      : _items = items;

  @override
  final DateTimeStringValue dueDate;
  final List<CreditAndInvoiceItem> _items;
  @override
  List<CreditAndInvoiceItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'CreditAndInvoiceGroup(dueDate: $dueDate, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreditAndInvoiceGroupImpl &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, dueDate, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreditAndInvoiceGroupImplCopyWith<_$CreditAndInvoiceGroupImpl>
      get copyWith => __$$CreditAndInvoiceGroupImplCopyWithImpl<
          _$CreditAndInvoiceGroupImpl>(this, _$identity);
}

abstract class _CreditAndInvoiceGroup implements CreditAndInvoiceGroup {
  factory _CreditAndInvoiceGroup(
          {required final DateTimeStringValue dueDate,
          required final List<CreditAndInvoiceItem> items}) =
      _$CreditAndInvoiceGroupImpl;

  @override
  DateTimeStringValue get dueDate;
  @override
  List<CreditAndInvoiceItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$CreditAndInvoiceGroupImplCopyWith<_$CreditAndInvoiceGroupImpl>
      get copyWith => throw _privateConstructorUsedError;
}
