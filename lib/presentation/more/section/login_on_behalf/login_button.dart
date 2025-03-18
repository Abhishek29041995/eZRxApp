part of 'package:ezrxmobile/presentation/more/section/login_on_behalf_sheet.dart';

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProxyLoginFormBloc, ProxyLoginFormState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return Expanded(
          child: ElevatedButton(
            key: WidgetKeys.loginOnBehalfLoginButtonKey,
            onPressed: () {
              if (state.isSubmitting) return;
              FocusScope.of(context).unfocus();
              context.read<ProxyLoginFormBloc>().add(
                    ProxyLoginFormEvent.loginWithADButtonPressed(
                      user: context.read<EligibilityBloc>().state.user,
                    ),
                  );
            },
            child: Text('Log in'.tr()),
          ),
        );
      },
    );
  }
}
