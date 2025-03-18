part of 'package:ezrxmobile/presentation/auth/reset_password/reset_password_page.dart';

final _formKey = GlobalKey<FormState>();

class _ResetPasswordForm extends StatelessWidget {
  final bool isFirstLogin;
  const _ResetPasswordForm({this.isFirstLogin = false});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
      listenWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting &&
          !current.isSubmitting,
      listener: (context, state) => {
        state.passwordResetFailureOrSuccessOption.fold(
          () => isFirstLogin
              ? context.router.push(
                  ResetPasswordSuccessRoute(isFirstLogin: isFirstLogin),
                )
              : context.router.replace(
                  ResetPasswordSuccessRoute(isFirstLogin: isFirstLogin),
                ),
          (either) => either.fold(
            (failure) {
              if (failure == const ApiFailure.passwordResetKeyInvalid()) {
                context.router.push(const ResetPasswordLinkExpiredPageRoute());

                return;
              }

              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {},
          ),
        ),
      },
      buildWhen: (previous, current) =>
          previous.showErrorMessages != current.showErrorMessages,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding12),
          child: Form(
            key: _formKey,
            autovalidateMode: state.showErrorMessages
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                  buildWhen: (previous, current) =>
                      previous.isNewPasswordObscure !=
                      current.isNewPasswordObscure,
                  builder: (context, state) {
                    return PasswordTextField(
                      key: WidgetKeys.newPasswordTextField,
                      isPasswordVisible: state.isNewPasswordObscure,
                      labelText: 'New Password',
                      hintText: 'Enter your new password',
                      passwordFieldType: PasswordFieldType.newPassword,
                    );
                  },
                ),
                const SizedBox(height: padding12),
                BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                  buildWhen: (previous, current) =>
                      previous.isConfirmPasswordObscure !=
                      current.isConfirmPasswordObscure,
                  builder: (context, state) {
                    return PasswordTextField(
                      key: WidgetKeys.confirmPasswordField,
                      isPasswordVisible: state.isConfirmPasswordObscure,
                      labelText: 'Confirm new password',
                      hintText: 'Enter your new password again',
                      passwordFieldType: PasswordFieldType.confirmPassword,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
