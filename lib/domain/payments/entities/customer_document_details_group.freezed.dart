// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_document_details_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomerDocumentDetailGroup {
  PrincipalName get principalName => throw _privateConstructorUsedError;
  List<CustomerDocumentDetail> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerDocumentDetailGroupCopyWith<CustomerDocumentDetailGroup>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerDocumentDetailGroupCopyWith<$Res> {
  factory $CustomerDocumentDetailGroupCopyWith(
          CustomerDocumentDetailGroup value,
          $Res Function(CustomerDocumentDetailGroup) then) =
      _$CustomerDocumentDetailGroupCopyWithImpl<$Res,
          CustomerDocumentDetailGroup>;
  @useResult
  $Res call({PrincipalName principalName, List<CustomerDocumentDetail> items});
}

/// @nodoc
class _$CustomerDocumentDetailGroupCopyWithImpl<$Res,
        $Val extends CustomerDocumentDetailGroup>
    implements $CustomerDocumentDetailGroupCopyWith<$Res> {
  _$CustomerDocumentDetailGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? principalName = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as PrincipalName,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CustomerDocumentDetail>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerDocumentDetailGroupImplCopyWith<$Res>
    implements $CustomerDocumentDetailGroupCopyWith<$Res> {
  factory _$$CustomerDocumentDetailGroupImplCopyWith(
          _$CustomerDocumentDetailGroupImpl value,
          $Res Function(_$CustomerDocumentDetailGroupImpl) then) =
      __$$CustomerDocumentDetailGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PrincipalName principalName, List<CustomerDocumentDetail> items});
}

/// @nodoc
class __$$CustomerDocumentDetailGroupImplCopyWithImpl<$Res>
    extends _$CustomerDocumentDetailGroupCopyWithImpl<$Res,
        _$CustomerDocumentDetailGroupImpl>
    implements _$$CustomerDocumentDetailGroupImplCopyWith<$Res> {
  __$$CustomerDocumentDetailGroupImplCopyWithImpl(
      _$CustomerDocumentDetailGroupImpl _value,
      $Res Function(_$CustomerDocumentDetailGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? principalName = null,
    Object? items = null,
  }) {
    return _then(_$CustomerDocumentDetailGroupImpl(
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as PrincipalName,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CustomerDocumentDetail>,
    ));
  }
}

/// @nodoc

class _$CustomerDocumentDetailGroupImpl
    implements _CustomerDocumentDetailGroup {
  _$CustomerDocumentDetailGroupImpl(
      {required this.principalName,
      required final List<CustomerDocumentDetail> items})
      : _items = items;

  @override
  final PrincipalName principalName;
  final List<CustomerDocumentDetail> _items;
  @override
  List<CustomerDocumentDetail> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'CustomerDocumentDetailGroup(principalName: $principalName, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerDocumentDetailGroupImpl &&
            (identical(other.principalName, principalName) ||
                other.principalName == principalName) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, principalName, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerDocumentDetailGroupImplCopyWith<_$CustomerDocumentDetailGroupImpl>
      get copyWith => __$$CustomerDocumentDetailGroupImplCopyWithImpl<
          _$CustomerDocumentDetailGroupImpl>(this, _$identity);
}

abstract class _CustomerDocumentDetailGroup
    implements CustomerDocumentDetailGroup {
  factory _CustomerDocumentDetailGroup(
          {required final PrincipalName principalName,
          required final List<CustomerDocumentDetail> items}) =
      _$CustomerDocumentDetailGroupImpl;

  @override
  PrincipalName get principalName;
  @override
  List<CustomerDocumentDetail> get items;
  @override
  @JsonKey(ignore: true)
  _$$CustomerDocumentDetailGroupImplCopyWith<_$CustomerDocumentDetailGroupImpl>
      get copyWith => throw _privateConstructorUsedError;
}
