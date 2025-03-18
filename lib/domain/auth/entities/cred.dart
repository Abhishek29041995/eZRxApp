import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cred.freezed.dart';

@freezed
class Cred with _$Cred {
  const Cred._();

  const factory Cred({
    required Username username,
    required Password password,
  }) = _Cred;

  factory Cred.empty() => Cred(
        username: Username(''),
        password: Password.login(''),
      );
}
