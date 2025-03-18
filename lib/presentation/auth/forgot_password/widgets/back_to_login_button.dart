import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';

class BackToLogin extends StatelessWidget {
  const BackToLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      key: WidgetKeys.loginSubmitButton,
      onPressed: () =>
          context.router.popUntilRouteWithName(LoginPageRoute.name),
      child: Text(
        context.tr('Back To login'),
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}
