import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_exception.freezed.dart';

@freezed
class AuthException with _$AuthException {
  const factory AuthException.invalidEmailAndPasswordCombination() =
      _InvalidEmailAndPasswordCombination;
  const factory AuthException.accountLocked() = _AccountLocked;
  const factory AuthException.accountExpired() = _AccountExpired;
  const factory AuthException.invalidUserName() = _InvalidUserName;
  const factory AuthException.accountBlocked() = _AccountBlocked;
  const factory AuthException.cannotProxyLoginWithCurrentRole() =
      _CannotProxyLoginWithCurrentRole;
  const factory AuthException.cannotProxyLoginRootAdmin() =
      _CannotProxyLoginRootAdmin;
  const factory AuthException.cannotProxyLoginZPAdminWhenIsZPAdmin() =
      _CannotProxyLoginZPAdminWhenIsZPAdmin;
  const factory AuthException.cannotProxyLoginFromDiffferentSalesOrg() =
      _CannotProxyLoginFromDiffferentSalesOrg;
  const factory AuthException.passwordResetKeyInvalid() =
      _PasswordResetKeyInvalid;
}
