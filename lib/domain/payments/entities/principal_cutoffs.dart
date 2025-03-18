import 'package:freezed_annotation/freezed_annotation.dart';

part 'principal_cutoffs.freezed.dart';

@freezed
class PrincipalCutoffs with _$PrincipalCutoffs {
  const PrincipalCutoffs._();

  const factory PrincipalCutoffs({
    required int total,
  }) = _PrincipalCutoffs;

  factory PrincipalCutoffs.empty() => const PrincipalCutoffs(
        total: 0,
      );

  bool get canMakePayment => total == 0;
}
