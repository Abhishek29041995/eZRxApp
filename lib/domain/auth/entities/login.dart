import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.freezed.dart';

@freezed
class Login with _$Login {
  const Login._();

  const factory Login({
    required JWT access,
    required JWT refresh,
    required User user,
  }) = _Login;

  factory Login.empty() => Login(
        access: JWT(''),
        refresh: JWT(''),
        user: User.empty(),
      );
}
