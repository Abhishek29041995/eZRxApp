part of 'package:ezrxmobile/presentation/auth/reset_password/reset_password_page.dart';

class _ResetPasswordButton extends StatelessWidget {
  final bool isFirstLogin;
  const _ResetPasswordButton({this.isFirstLogin = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting ||
          previous.showNewPasswordPatternMismatchError !=
              current.showNewPasswordPatternMismatchError,
      builder: ((context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(padding12),
              child: Column(
                children: [
                  ElevatedButton(
                    key: WidgetKeys.resetPasswordButton,
                    onPressed: state.isSubmitting
                        ? null
                        : () => context.read<ResetPasswordBloc>().add(
                              isFirstLogin
                                  ? const ResetPasswordEvent
                                      .changePasswordForFirstTime()
                                  : const ResetPasswordEvent.resetPassword(),
                            ),
                    child: LoadingShimmer.withChild(
                      enabled: state.isSubmitting,
                      child: Text(
                        isFirstLogin
                            ? context.tr('Update password')
                            : context.tr('Reset password'),
                      ),
                    ),
                  ),
                  if (!isFirstLogin) ...[
                    const SizedBox(height: padding12),
                    const SizedBox(
                      width: double.infinity,
                      child: BackToLogin(),
                    ),
                  ],
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
