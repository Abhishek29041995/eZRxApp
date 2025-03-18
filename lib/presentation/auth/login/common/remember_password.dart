import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/forgot_password/forgot_password_bloc.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RememberPassword extends StatelessWidget {
  const RememberPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      buildWhen: (previous, current) =>
          previous.rememberPassword != current.rememberPassword,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  key: WidgetKeys.loginRememberPasswordCheckbox,
                  value: state.rememberPassword,
                  onChanged: (value) {
                    FocusScope.of(context).unfocus();
                    context.read<LoginFormBloc>().add(
                          const LoginFormEvent.rememberCheckChanged(),
                        );
                  },
                  side: WidgetStateBorderSide.resolveWith(
                    (states) => const BorderSide(
                      width: 2.0,
                      color: ZPColors.lightGray2,
                    ),
                  ),
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                ),
                const SizedBox(width: 5),
                Text(
                  context.tr('Remember me'),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            TextButton(
              key: WidgetKeys.forgotPasswordButton,
              child: Text(
                '${context.tr('Forgot password')}?',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: ZPColors.extraDarkGreen,
                    ),
              ),
              onPressed: () {
                context.read<ForgotPasswordBloc>().add(
                      const ForgotPasswordEvent.initialized(),
                    );
                context.router.push(const ForgetPasswordPageRoute());
              },
            ),
          ],
        );
      },
    );
  }
}
