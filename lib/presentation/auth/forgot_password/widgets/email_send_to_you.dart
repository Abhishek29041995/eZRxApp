part of 'package:ezrxmobile/presentation/auth/forgot_password/forgot_password_confirmation_page.dart';

class _EmailSendToYou extends StatelessWidget {
  const _EmailSendToYou();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          context.tr('Email sent to you!'),
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        const SizedBox(height: 5),
        RichText(
          text: TextSpan(
            text: context.tr(
              'An email with instructions for resetting your password has been sent to your email address',
            ),
            style: Theme.of(context).textTheme.bodyLarge,
            children: <TextSpan>[
              TextSpan(
                text:
                    ' ${context.read<ForgotPasswordBloc>().state.resetPasswordResponse.email}',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: ZPColors.skyBlueColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
