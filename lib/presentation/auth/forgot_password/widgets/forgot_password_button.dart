part of 'package:ezrxmobile/presentation/auth/forgot_password/forgot_password_page.dart';

class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return ElevatedButton(
          key: WidgetKeys.nextButton,
          onPressed: state.isSubmitting
              ? null
              : () {
                  FocusScope.of(context).unfocus();
                  context.read<ForgotPasswordBloc>().add(
                        const ForgotPasswordEvent.requestPasswordReset(),
                      );
                },
          child: LoadingShimmer.withChild(
            enabled: state.isSubmitting,
            child: Text(context.tr('Next')),
          ),
        );
      },
    );
  }
}
