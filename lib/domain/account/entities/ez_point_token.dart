import 'package:freezed_annotation/freezed_annotation.dart';

part 'ez_point_token.freezed.dart';

@freezed
class EZPointToken with _$EZPointToken {
  const EZPointToken._();
  factory EZPointToken({
    required String ezPointToken,
  }) = _EZPointToken;

  factory EZPointToken.empty() => EZPointToken(
        ezPointToken: '',
      );

  bool get isNotEmpty => ezPointToken != '';
}
