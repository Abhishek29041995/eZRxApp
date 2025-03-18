part of 'package:ezrxmobile/presentation/account/change_password/change_password_page.dart';

final _formKey = GlobalKey<FormState>();

class _ChangePasswordForm extends StatelessWidget {
  const _ChangePasswordForm();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
      listenWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting &&
          !current.isSubmitting,
      listener: (context, state) => {
        state.passwordResetFailureOrSuccessOption.fold(
          () {
            Navigator.of(context).pop();
            CustomSnackBar(
              messageText: context.tr('Password changed successfully'),
            ).show(context);
          },
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {},
          ),
        ),
      },
      buildWhen: (previous, current) =>
          previous.showErrorMessages != current.showErrorMessages,
      builder: (context, state) {
        return Form(
          key: _formKey,
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                buildWhen: (previous, current) =>
                    previous.isOldPasswordObscure !=
                    current.isOldPasswordObscure,
                builder: (context, state) {
                  return PasswordTextField(
                    key: WidgetKeys.currentPasswordField,
                    isPasswordVisible: state.isOldPasswordObscure,
                    labelText: 'Current Password',
                    hintText: 'Your current password',
                    passwordFieldType: PasswordFieldType.oldPassword,
                  );
                },
              ),
              const SizedBox(height: padding24),
              BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                buildWhen: (previous, current) =>
                    previous.isNewPasswordObscure !=
                    current.isNewPasswordObscure,
                builder: (context, state) {
                  return PasswordTextField(
                    key: WidgetKeys.newPasswordTextField,
                    isPasswordVisible: state.isNewPasswordObscure,
                    labelText: 'New Password',
                    hintText: 'Follow instruction below',
                    passwordFieldType: PasswordFieldType.newPassword,
                  );
                },
              ),
              const SizedBox(height: padding24),
              BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                buildWhen: (previous, current) =>
                    previous.isConfirmPasswordObscure !=
                    current.isConfirmPasswordObscure,
                builder: (context, state) {
                  return PasswordTextField(
                    key: WidgetKeys.confirmPasswordField,
                    isPasswordVisible: state.isConfirmPasswordObscure,
                    labelText: 'Enter new password again',
                    hintText: 'Enter new password again',
                    passwordFieldType: PasswordFieldType.confirmPassword,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
