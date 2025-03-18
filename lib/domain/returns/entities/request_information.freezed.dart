// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_information.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RequestInformation {
  ReturnRequestInformationHeader get requestInformationHeader =>
      throw _privateConstructorUsedError;
  List<ReturnRequestInformation> get returnRequestInformationList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RequestInformationCopyWith<RequestInformation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestInformationCopyWith<$Res> {
  factory $RequestInformationCopyWith(
          RequestInformation value, $Res Function(RequestInformation) then) =
      _$RequestInformationCopyWithImpl<$Res, RequestInformation>;
  @useResult
  $Res call(
      {ReturnRequestInformationHeader requestInformationHeader,
      List<ReturnRequestInformation> returnRequestInformationList});

  $ReturnRequestInformationHeaderCopyWith<$Res> get requestInformationHeader;
}

/// @nodoc
class _$RequestInformationCopyWithImpl<$Res, $Val extends RequestInformation>
    implements $RequestInformationCopyWith<$Res> {
  _$RequestInformationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestInformationHeader = null,
    Object? returnRequestInformationList = null,
  }) {
    return _then(_value.copyWith(
      requestInformationHeader: null == requestInformationHeader
          ? _value.requestInformationHeader
          : requestInformationHeader // ignore: cast_nullable_to_non_nullable
              as ReturnRequestInformationHeader,
      returnRequestInformationList: null == returnRequestInformationList
          ? _value.returnRequestInformationList
          : returnRequestInformationList // ignore: cast_nullable_to_non_nullable
              as List<ReturnRequestInformation>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnRequestInformationHeaderCopyWith<$Res> get requestInformationHeader {
    return $ReturnRequestInformationHeaderCopyWith<$Res>(
        _value.requestInformationHeader, (value) {
      return _then(_value.copyWith(requestInformationHeader: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RequestInformationImplCopyWith<$Res>
    implements $RequestInformationCopyWith<$Res> {
  factory _$$RequestInformationImplCopyWith(_$RequestInformationImpl value,
          $Res Function(_$RequestInformationImpl) then) =
      __$$RequestInformationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ReturnRequestInformationHeader requestInformationHeader,
      List<ReturnRequestInformation> returnRequestInformationList});

  @override
  $ReturnRequestInformationHeaderCopyWith<$Res> get requestInformationHeader;
}

/// @nodoc
class __$$RequestInformationImplCopyWithImpl<$Res>
    extends _$RequestInformationCopyWithImpl<$Res, _$RequestInformationImpl>
    implements _$$RequestInformationImplCopyWith<$Res> {
  __$$RequestInformationImplCopyWithImpl(_$RequestInformationImpl _value,
      $Res Function(_$RequestInformationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestInformationHeader = null,
    Object? returnRequestInformationList = null,
  }) {
    return _then(_$RequestInformationImpl(
      requestInformationHeader: null == requestInformationHeader
          ? _value.requestInformationHeader
          : requestInformationHeader // ignore: cast_nullable_to_non_nullable
              as ReturnRequestInformationHeader,
      returnRequestInformationList: null == returnRequestInformationList
          ? _value._returnRequestInformationList
          : returnRequestInformationList // ignore: cast_nullable_to_non_nullable
              as List<ReturnRequestInformation>,
    ));
  }
}

/// @nodoc

class _$RequestInformationImpl extends _RequestInformation {
  _$RequestInformationImpl(
      {required this.requestInformationHeader,
      required final List<ReturnRequestInformation>
          returnRequestInformationList})
      : _returnRequestInformationList = returnRequestInformationList,
        super._();

  @override
  final ReturnRequestInformationHeader requestInformationHeader;
  final List<ReturnRequestInformation> _returnRequestInformationList;
  @override
  List<ReturnRequestInformation> get returnRequestInformationList {
    if (_returnRequestInformationList is EqualUnmodifiableListView)
      return _returnRequestInformationList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_returnRequestInformationList);
  }

  @override
  String toString() {
    return 'RequestInformation(requestInformationHeader: $requestInformationHeader, returnRequestInformationList: $returnRequestInformationList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestInformationImpl &&
            (identical(
                    other.requestInformationHeader, requestInformationHeader) ||
                other.requestInformationHeader == requestInformationHeader) &&
            const DeepCollectionEquality().equals(
                other._returnRequestInformationList,
                _returnRequestInformationList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestInformationHeader,
      const DeepCollectionEquality().hash(_returnRequestInformationList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestInformationImplCopyWith<_$RequestInformationImpl> get copyWith =>
      __$$RequestInformationImplCopyWithImpl<_$RequestInformationImpl>(
          this, _$identity);
}

abstract class _RequestInformation extends RequestInformation {
  factory _RequestInformation(
      {required final ReturnRequestInformationHeader requestInformationHeader,
      required final List<ReturnRequestInformation>
          returnRequestInformationList}) = _$RequestInformationImpl;
  _RequestInformation._() : super._();

  @override
  ReturnRequestInformationHeader get requestInformationHeader;
  @override
  List<ReturnRequestInformation> get returnRequestInformationList;
  @override
  @JsonKey(ignore: true)
  _$$RequestInformationImplCopyWith<_$RequestInformationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
