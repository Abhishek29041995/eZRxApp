// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_instruction_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BankInstructionDTO _$BankInstructionDTOFromJson(Map<String, dynamic> json) {
  return _BankInstructionDTO.fromJson(json);
}

/// @nodoc
mixin _$BankInstructionDTO {
  @JsonKey(name: 'bank', defaultValue: '')
  String get bank => throw _privateConstructorUsedError;
  @JsonKey(name: 'transferMethods', defaultValue: [])
  List<TransferMethodDTO> get transferMethods =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankInstructionDTOCopyWith<BankInstructionDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankInstructionDTOCopyWith<$Res> {
  factory $BankInstructionDTOCopyWith(
          BankInstructionDTO value, $Res Function(BankInstructionDTO) then) =
      _$BankInstructionDTOCopyWithImpl<$Res, BankInstructionDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'bank', defaultValue: '') String bank,
      @JsonKey(name: 'transferMethods', defaultValue: [])
      List<TransferMethodDTO> transferMethods});
}

/// @nodoc
class _$BankInstructionDTOCopyWithImpl<$Res, $Val extends BankInstructionDTO>
    implements $BankInstructionDTOCopyWith<$Res> {
  _$BankInstructionDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bank = null,
    Object? transferMethods = null,
  }) {
    return _then(_value.copyWith(
      bank: null == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as String,
      transferMethods: null == transferMethods
          ? _value.transferMethods
          : transferMethods // ignore: cast_nullable_to_non_nullable
              as List<TransferMethodDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankInstructionDTOImplCopyWith<$Res>
    implements $BankInstructionDTOCopyWith<$Res> {
  factory _$$BankInstructionDTOImplCopyWith(_$BankInstructionDTOImpl value,
          $Res Function(_$BankInstructionDTOImpl) then) =
      __$$BankInstructionDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'bank', defaultValue: '') String bank,
      @JsonKey(name: 'transferMethods', defaultValue: [])
      List<TransferMethodDTO> transferMethods});
}

/// @nodoc
class __$$BankInstructionDTOImplCopyWithImpl<$Res>
    extends _$BankInstructionDTOCopyWithImpl<$Res, _$BankInstructionDTOImpl>
    implements _$$BankInstructionDTOImplCopyWith<$Res> {
  __$$BankInstructionDTOImplCopyWithImpl(_$BankInstructionDTOImpl _value,
      $Res Function(_$BankInstructionDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bank = null,
    Object? transferMethods = null,
  }) {
    return _then(_$BankInstructionDTOImpl(
      bank: null == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as String,
      transferMethods: null == transferMethods
          ? _value._transferMethods
          : transferMethods // ignore: cast_nullable_to_non_nullable
              as List<TransferMethodDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BankInstructionDTOImpl extends _BankInstructionDTO {
  const _$BankInstructionDTOImpl(
      {@JsonKey(name: 'bank', defaultValue: '') required this.bank,
      @JsonKey(name: 'transferMethods', defaultValue: [])
      required final List<TransferMethodDTO> transferMethods})
      : _transferMethods = transferMethods,
        super._();

  factory _$BankInstructionDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankInstructionDTOImplFromJson(json);

  @override
  @JsonKey(name: 'bank', defaultValue: '')
  final String bank;
  final List<TransferMethodDTO> _transferMethods;
  @override
  @JsonKey(name: 'transferMethods', defaultValue: [])
  List<TransferMethodDTO> get transferMethods {
    if (_transferMethods is EqualUnmodifiableListView) return _transferMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transferMethods);
  }

  @override
  String toString() {
    return 'BankInstructionDTO(bank: $bank, transferMethods: $transferMethods)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankInstructionDTOImpl &&
            (identical(other.bank, bank) || other.bank == bank) &&
            const DeepCollectionEquality()
                .equals(other._transferMethods, _transferMethods));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, bank, const DeepCollectionEquality().hash(_transferMethods));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BankInstructionDTOImplCopyWith<_$BankInstructionDTOImpl> get copyWith =>
      __$$BankInstructionDTOImplCopyWithImpl<_$BankInstructionDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankInstructionDTOImplToJson(
      this,
    );
  }
}

abstract class _BankInstructionDTO extends BankInstructionDTO {
  const factory _BankInstructionDTO(
          {@JsonKey(name: 'bank', defaultValue: '') required final String bank,
          @JsonKey(name: 'transferMethods', defaultValue: [])
          required final List<TransferMethodDTO> transferMethods}) =
      _$BankInstructionDTOImpl;
  const _BankInstructionDTO._() : super._();

  factory _BankInstructionDTO.fromJson(Map<String, dynamic> json) =
      _$BankInstructionDTOImpl.fromJson;

  @override
  @JsonKey(name: 'bank', defaultValue: '')
  String get bank;
  @override
  @JsonKey(name: 'transferMethods', defaultValue: [])
  List<TransferMethodDTO> get transferMethods;
  @override
  @JsonKey(ignore: true)
  _$$BankInstructionDTOImplCopyWith<_$BankInstructionDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TransferMethodDTO _$TransferMethodDTOFromJson(Map<String, dynamic> json) {
  return _TransferMethodDTO.fromJson(json);
}

/// @nodoc
mixin _$TransferMethodDTO {
  @JsonKey(name: 'title', defaultValue: '')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentInstructions', defaultValue: [])
  List<InstructionDetailsDTO> get paymentInstructions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransferMethodDTOCopyWith<TransferMethodDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferMethodDTOCopyWith<$Res> {
  factory $TransferMethodDTOCopyWith(
          TransferMethodDTO value, $Res Function(TransferMethodDTO) then) =
      _$TransferMethodDTOCopyWithImpl<$Res, TransferMethodDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'title', defaultValue: '') String title,
      @JsonKey(name: 'paymentInstructions', defaultValue: [])
      List<InstructionDetailsDTO> paymentInstructions});
}

/// @nodoc
class _$TransferMethodDTOCopyWithImpl<$Res, $Val extends TransferMethodDTO>
    implements $TransferMethodDTOCopyWith<$Res> {
  _$TransferMethodDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? paymentInstructions = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      paymentInstructions: null == paymentInstructions
          ? _value.paymentInstructions
          : paymentInstructions // ignore: cast_nullable_to_non_nullable
              as List<InstructionDetailsDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransferMethodDTOImplCopyWith<$Res>
    implements $TransferMethodDTOCopyWith<$Res> {
  factory _$$TransferMethodDTOImplCopyWith(_$TransferMethodDTOImpl value,
          $Res Function(_$TransferMethodDTOImpl) then) =
      __$$TransferMethodDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'title', defaultValue: '') String title,
      @JsonKey(name: 'paymentInstructions', defaultValue: [])
      List<InstructionDetailsDTO> paymentInstructions});
}

/// @nodoc
class __$$TransferMethodDTOImplCopyWithImpl<$Res>
    extends _$TransferMethodDTOCopyWithImpl<$Res, _$TransferMethodDTOImpl>
    implements _$$TransferMethodDTOImplCopyWith<$Res> {
  __$$TransferMethodDTOImplCopyWithImpl(_$TransferMethodDTOImpl _value,
      $Res Function(_$TransferMethodDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? paymentInstructions = null,
  }) {
    return _then(_$TransferMethodDTOImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      paymentInstructions: null == paymentInstructions
          ? _value._paymentInstructions
          : paymentInstructions // ignore: cast_nullable_to_non_nullable
              as List<InstructionDetailsDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransferMethodDTOImpl extends _TransferMethodDTO {
  const _$TransferMethodDTOImpl(
      {@JsonKey(name: 'title', defaultValue: '') required this.title,
      @JsonKey(name: 'paymentInstructions', defaultValue: [])
      required final List<InstructionDetailsDTO> paymentInstructions})
      : _paymentInstructions = paymentInstructions,
        super._();

  factory _$TransferMethodDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransferMethodDTOImplFromJson(json);

  @override
  @JsonKey(name: 'title', defaultValue: '')
  final String title;
  final List<InstructionDetailsDTO> _paymentInstructions;
  @override
  @JsonKey(name: 'paymentInstructions', defaultValue: [])
  List<InstructionDetailsDTO> get paymentInstructions {
    if (_paymentInstructions is EqualUnmodifiableListView)
      return _paymentInstructions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentInstructions);
  }

  @override
  String toString() {
    return 'TransferMethodDTO(title: $title, paymentInstructions: $paymentInstructions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferMethodDTOImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._paymentInstructions, _paymentInstructions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title,
      const DeepCollectionEquality().hash(_paymentInstructions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferMethodDTOImplCopyWith<_$TransferMethodDTOImpl> get copyWith =>
      __$$TransferMethodDTOImplCopyWithImpl<_$TransferMethodDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransferMethodDTOImplToJson(
      this,
    );
  }
}

abstract class _TransferMethodDTO extends TransferMethodDTO {
  const factory _TransferMethodDTO(
      {@JsonKey(name: 'title', defaultValue: '') required final String title,
      @JsonKey(name: 'paymentInstructions', defaultValue: [])
      required final List<InstructionDetailsDTO>
          paymentInstructions}) = _$TransferMethodDTOImpl;
  const _TransferMethodDTO._() : super._();

  factory _TransferMethodDTO.fromJson(Map<String, dynamic> json) =
      _$TransferMethodDTOImpl.fromJson;

  @override
  @JsonKey(name: 'title', defaultValue: '')
  String get title;
  @override
  @JsonKey(name: 'paymentInstructions', defaultValue: [])
  List<InstructionDetailsDTO> get paymentInstructions;
  @override
  @JsonKey(ignore: true)
  _$$TransferMethodDTOImplCopyWith<_$TransferMethodDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InstructionDetailsDTO _$InstructionDetailsDTOFromJson(
    Map<String, dynamic> json) {
  return _InstructionDetailsDTO.fromJson(json);
}

/// @nodoc
mixin _$InstructionDetailsDTO {
  @JsonKey(name: 'instructionType', defaultValue: '')
  String get instructionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'instructions', defaultValue: [])
  List<String> get instructions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InstructionDetailsDTOCopyWith<InstructionDetailsDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstructionDetailsDTOCopyWith<$Res> {
  factory $InstructionDetailsDTOCopyWith(InstructionDetailsDTO value,
          $Res Function(InstructionDetailsDTO) then) =
      _$InstructionDetailsDTOCopyWithImpl<$Res, InstructionDetailsDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'instructionType', defaultValue: '')
      String instructionType,
      @JsonKey(name: 'instructions', defaultValue: [])
      List<String> instructions});
}

/// @nodoc
class _$InstructionDetailsDTOCopyWithImpl<$Res,
        $Val extends InstructionDetailsDTO>
    implements $InstructionDetailsDTOCopyWith<$Res> {
  _$InstructionDetailsDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instructionType = null,
    Object? instructions = null,
  }) {
    return _then(_value.copyWith(
      instructionType: null == instructionType
          ? _value.instructionType
          : instructionType // ignore: cast_nullable_to_non_nullable
              as String,
      instructions: null == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InstructionDetailsDTOImplCopyWith<$Res>
    implements $InstructionDetailsDTOCopyWith<$Res> {
  factory _$$InstructionDetailsDTOImplCopyWith(
          _$InstructionDetailsDTOImpl value,
          $Res Function(_$InstructionDetailsDTOImpl) then) =
      __$$InstructionDetailsDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'instructionType', defaultValue: '')
      String instructionType,
      @JsonKey(name: 'instructions', defaultValue: [])
      List<String> instructions});
}

/// @nodoc
class __$$InstructionDetailsDTOImplCopyWithImpl<$Res>
    extends _$InstructionDetailsDTOCopyWithImpl<$Res,
        _$InstructionDetailsDTOImpl>
    implements _$$InstructionDetailsDTOImplCopyWith<$Res> {
  __$$InstructionDetailsDTOImplCopyWithImpl(_$InstructionDetailsDTOImpl _value,
      $Res Function(_$InstructionDetailsDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instructionType = null,
    Object? instructions = null,
  }) {
    return _then(_$InstructionDetailsDTOImpl(
      instructionType: null == instructionType
          ? _value.instructionType
          : instructionType // ignore: cast_nullable_to_non_nullable
              as String,
      instructions: null == instructions
          ? _value._instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InstructionDetailsDTOImpl extends _InstructionDetailsDTO {
  const _$InstructionDetailsDTOImpl(
      {@JsonKey(name: 'instructionType', defaultValue: '')
      required this.instructionType,
      @JsonKey(name: 'instructions', defaultValue: [])
      required final List<String> instructions})
      : _instructions = instructions,
        super._();

  factory _$InstructionDetailsDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$InstructionDetailsDTOImplFromJson(json);

  @override
  @JsonKey(name: 'instructionType', defaultValue: '')
  final String instructionType;
  final List<String> _instructions;
  @override
  @JsonKey(name: 'instructions', defaultValue: [])
  List<String> get instructions {
    if (_instructions is EqualUnmodifiableListView) return _instructions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_instructions);
  }

  @override
  String toString() {
    return 'InstructionDetailsDTO(instructionType: $instructionType, instructions: $instructions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstructionDetailsDTOImpl &&
            (identical(other.instructionType, instructionType) ||
                other.instructionType == instructionType) &&
            const DeepCollectionEquality()
                .equals(other._instructions, _instructions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, instructionType,
      const DeepCollectionEquality().hash(_instructions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InstructionDetailsDTOImplCopyWith<_$InstructionDetailsDTOImpl>
      get copyWith => __$$InstructionDetailsDTOImplCopyWithImpl<
          _$InstructionDetailsDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InstructionDetailsDTOImplToJson(
      this,
    );
  }
}

abstract class _InstructionDetailsDTO extends InstructionDetailsDTO {
  const factory _InstructionDetailsDTO(
      {@JsonKey(name: 'instructionType', defaultValue: '')
      required final String instructionType,
      @JsonKey(name: 'instructions', defaultValue: [])
      required final List<String> instructions}) = _$InstructionDetailsDTOImpl;
  const _InstructionDetailsDTO._() : super._();

  factory _InstructionDetailsDTO.fromJson(Map<String, dynamic> json) =
      _$InstructionDetailsDTOImpl.fromJson;

  @override
  @JsonKey(name: 'instructionType', defaultValue: '')
  String get instructionType;
  @override
  @JsonKey(name: 'instructions', defaultValue: [])
  List<String> get instructions;
  @override
  @JsonKey(ignore: true)
  _$$InstructionDetailsDTOImplCopyWith<_$InstructionDetailsDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
