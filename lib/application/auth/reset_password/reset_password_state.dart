part of 'reset_password_bloc.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const ResetPasswordState._();
  const factory ResetPasswordState({
    required User user,
    required bool isOldPasswordObscure,
    required bool isNewPasswordObscure,
    required bool isConfirmPasswordObscure,
    required Password oldPassword,
    required Password newPassword,
    required Password confirmPassword,
    required bool isSubmitting,
    required Option<Either<ApiFailure, ResetPassword>>
        passwordResetFailureOrSuccessOption,
    required String resetPasswordKey,
    required bool showErrorMessages,
  }) = _ResetPassword;

  factory ResetPasswordState.initial() => ResetPasswordState(
        user: User.empty(),
        oldPassword: Password.login(''),
        newPassword: Password.resetV2(
          '',
          '',
          '',
        ),
        confirmPassword: Password.confirm('', ''),
        passwordResetFailureOrSuccessOption: none(),
        isOldPasswordObscure: true,
        isNewPasswordObscure: true,
        isConfirmPasswordObscure: true,
        isSubmitting: false,
        showErrorMessages: false,
        resetPasswordKey: '',
      );

  bool newPasswordMustNotContainTwoConsecutiveCharsOfUserNameOrName({
    required User user,
  }) {
    final input = newPassword.getValidPassword;

    return input.isNotEmpty &&
        !_checkInLowerCase(input, user.username.getValue()) &&
        !_checkInLowerCase(input, user.fullName.firstName) &&
        !_checkInLowerCase(input, user.fullName.lastName);
  }

  bool get showNewPasswordPatternMismatchError =>
      !newPassword.isValid() && showErrorMessages;

  bool _checkInLowerCase(String input, String value) {
    final lowerCaseInput = input.toLowerCase();

    for (var i = 0; i <= value.length - 3; i++) {
      final substring =
          value.characters.getRange(i, i + 3).string.toLowerCase();
      if (lowerCaseInput.contains(substring)) return true;
    }

    return false;
  }
}
