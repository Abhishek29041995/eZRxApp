// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_instruction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BankInstruction {
  String get bank => throw _privateConstructorUsedError;
  List<TransferMethod> get transferMethods =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BankInstructionCopyWith<BankInstruction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankInstructionCopyWith<$Res> {
  factory $BankInstructionCopyWith(
          BankInstruction value, $Res Function(BankInstruction) then) =
      _$BankInstructionCopyWithImpl<$Res, BankInstruction>;
  @useResult
  $Res call({String bank, List<TransferMethod> transferMethods});
}

/// @nodoc
class _$BankInstructionCopyWithImpl<$Res, $Val extends BankInstruction>
    implements $BankInstructionCopyWith<$Res> {
  _$BankInstructionCopyWithImpl(this._value, this._then);

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
              as List<TransferMethod>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankInstructionImplCopyWith<$Res>
    implements $BankInstructionCopyWith<$Res> {
  factory _$$BankInstructionImplCopyWith(_$BankInstructionImpl value,
          $Res Function(_$BankInstructionImpl) then) =
      __$$BankInstructionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String bank, List<TransferMethod> transferMethods});
}

/// @nodoc
class __$$BankInstructionImplCopyWithImpl<$Res>
    extends _$BankInstructionCopyWithImpl<$Res, _$BankInstructionImpl>
    implements _$$BankInstructionImplCopyWith<$Res> {
  __$$BankInstructionImplCopyWithImpl(
      _$BankInstructionImpl _value, $Res Function(_$BankInstructionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bank = null,
    Object? transferMethods = null,
  }) {
    return _then(_$BankInstructionImpl(
      bank: null == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as String,
      transferMethods: null == transferMethods
          ? _value._transferMethods
          : transferMethods // ignore: cast_nullable_to_non_nullable
              as List<TransferMethod>,
    ));
  }
}

/// @nodoc

class _$BankInstructionImpl extends _BankInstruction {
  const _$BankInstructionImpl(
      {required this.bank, required final List<TransferMethod> transferMethods})
      : _transferMethods = transferMethods,
        super._();

  @override
  final String bank;
  final List<TransferMethod> _transferMethods;
  @override
  List<TransferMethod> get transferMethods {
    if (_transferMethods is EqualUnmodifiableListView) return _transferMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transferMethods);
  }

  @override
  String toString() {
    return 'BankInstruction(bank: $bank, transferMethods: $transferMethods)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankInstructionImpl &&
            (identical(other.bank, bank) || other.bank == bank) &&
            const DeepCollectionEquality()
                .equals(other._transferMethods, _transferMethods));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, bank, const DeepCollectionEquality().hash(_transferMethods));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BankInstructionImplCopyWith<_$BankInstructionImpl> get copyWith =>
      __$$BankInstructionImplCopyWithImpl<_$BankInstructionImpl>(
          this, _$identity);
}

abstract class _BankInstruction extends BankInstruction {
  const factory _BankInstruction(
          {required final String bank,
          required final List<TransferMethod> transferMethods}) =
      _$BankInstructionImpl;
  const _BankInstruction._() : super._();

  @override
  String get bank;
  @override
  List<TransferMethod> get transferMethods;
  @override
  @JsonKey(ignore: true)
  _$$BankInstructionImplCopyWith<_$BankInstructionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TransferMethod {
  String get title => throw _privateConstructorUsedError;
  List<InstructionDetail> get paymentInstructions =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransferMethodCopyWith<TransferMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferMethodCopyWith<$Res> {
  factory $TransferMethodCopyWith(
          TransferMethod value, $Res Function(TransferMethod) then) =
      _$TransferMethodCopyWithImpl<$Res, TransferMethod>;
  @useResult
  $Res call({String title, List<InstructionDetail> paymentInstructions});
}

/// @nodoc
class _$TransferMethodCopyWithImpl<$Res, $Val extends TransferMethod>
    implements $TransferMethodCopyWith<$Res> {
  _$TransferMethodCopyWithImpl(this._value, this._then);

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
              as List<InstructionDetail>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransferMethodImplCopyWith<$Res>
    implements $TransferMethodCopyWith<$Res> {
  factory _$$TransferMethodImplCopyWith(_$TransferMethodImpl value,
          $Res Function(_$TransferMethodImpl) then) =
      __$$TransferMethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<InstructionDetail> paymentInstructions});
}

/// @nodoc
class __$$TransferMethodImplCopyWithImpl<$Res>
    extends _$TransferMethodCopyWithImpl<$Res, _$TransferMethodImpl>
    implements _$$TransferMethodImplCopyWith<$Res> {
  __$$TransferMethodImplCopyWithImpl(
      _$TransferMethodImpl _value, $Res Function(_$TransferMethodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? paymentInstructions = null,
  }) {
    return _then(_$TransferMethodImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      paymentInstructions: null == paymentInstructions
          ? _value._paymentInstructions
          : paymentInstructions // ignore: cast_nullable_to_non_nullable
              as List<InstructionDetail>,
    ));
  }
}

/// @nodoc

class _$TransferMethodImpl extends _TransferMethod {
  const _$TransferMethodImpl(
      {required this.title,
      required final List<InstructionDetail> paymentInstructions})
      : _paymentInstructions = paymentInstructions,
        super._();

  @override
  final String title;
  final List<InstructionDetail> _paymentInstructions;
  @override
  List<InstructionDetail> get paymentInstructions {
    if (_paymentInstructions is EqualUnmodifiableListView)
      return _paymentInstructions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentInstructions);
  }

  @override
  String toString() {
    return 'TransferMethod(title: $title, paymentInstructions: $paymentInstructions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferMethodImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._paymentInstructions, _paymentInstructions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title,
      const DeepCollectionEquality().hash(_paymentInstructions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferMethodImplCopyWith<_$TransferMethodImpl> get copyWith =>
      __$$TransferMethodImplCopyWithImpl<_$TransferMethodImpl>(
          this, _$identity);
}

abstract class _TransferMethod extends TransferMethod {
  const factory _TransferMethod(
          {required final String title,
          required final List<InstructionDetail> paymentInstructions}) =
      _$TransferMethodImpl;
  const _TransferMethod._() : super._();

  @override
  String get title;
  @override
  List<InstructionDetail> get paymentInstructions;
  @override
  @JsonKey(ignore: true)
  _$$TransferMethodImplCopyWith<_$TransferMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InstructionDetail {
  String get instructionType => throw _privateConstructorUsedError;
  List<String> get instructions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InstructionDetailCopyWith<InstructionDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstructionDetailCopyWith<$Res> {
  factory $InstructionDetailCopyWith(
          InstructionDetail value, $Res Function(InstructionDetail) then) =
      _$InstructionDetailCopyWithImpl<$Res, InstructionDetail>;
  @useResult
  $Res call({String instructionType, List<String> instructions});
}

/// @nodoc
class _$InstructionDetailCopyWithImpl<$Res, $Val extends InstructionDetail>
    implements $InstructionDetailCopyWith<$Res> {
  _$InstructionDetailCopyWithImpl(this._value, this._then);

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
abstract class _$$InstructionDetailImplCopyWith<$Res>
    implements $InstructionDetailCopyWith<$Res> {
  factory _$$InstructionDetailImplCopyWith(_$InstructionDetailImpl value,
          $Res Function(_$InstructionDetailImpl) then) =
      __$$InstructionDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String instructionType, List<String> instructions});
}

/// @nodoc
class __$$InstructionDetailImplCopyWithImpl<$Res>
    extends _$InstructionDetailCopyWithImpl<$Res, _$InstructionDetailImpl>
    implements _$$InstructionDetailImplCopyWith<$Res> {
  __$$InstructionDetailImplCopyWithImpl(_$InstructionDetailImpl _value,
      $Res Function(_$InstructionDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instructionType = null,
    Object? instructions = null,
  }) {
    return _then(_$InstructionDetailImpl(
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

class _$InstructionDetailImpl extends _InstructionDetail {
  const _$InstructionDetailImpl(
      {required this.instructionType, required final List<String> instructions})
      : _instructions = instructions,
        super._();

  @override
  final String instructionType;
  final List<String> _instructions;
  @override
  List<String> get instructions {
    if (_instructions is EqualUnmodifiableListView) return _instructions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_instructions);
  }

  @override
  String toString() {
    return 'InstructionDetail(instructionType: $instructionType, instructions: $instructions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstructionDetailImpl &&
            (identical(other.instructionType, instructionType) ||
                other.instructionType == instructionType) &&
            const DeepCollectionEquality()
                .equals(other._instructions, _instructions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, instructionType,
      const DeepCollectionEquality().hash(_instructions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InstructionDetailImplCopyWith<_$InstructionDetailImpl> get copyWith =>
      __$$InstructionDetailImplCopyWithImpl<_$InstructionDetailImpl>(
          this, _$identity);
}

abstract class _InstructionDetail extends InstructionDetail {
  const factory _InstructionDetail(
      {required final String instructionType,
      required final List<String> instructions}) = _$InstructionDetailImpl;
  const _InstructionDetail._() : super._();

  @override
  String get instructionType;
  @override
  List<String> get instructions;
  @override
  @JsonKey(ignore: true)
  _$$InstructionDetailImplCopyWith<_$InstructionDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
