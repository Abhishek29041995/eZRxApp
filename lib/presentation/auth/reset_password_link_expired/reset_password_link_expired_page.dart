import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/logo.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ResetPasswordLinkExpiredPage extends StatelessWidget {
  const ResetPasswordLinkExpiredPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: ZPColors.accentColor,
        toolbarHeight: 1,
      ),
      body: ListView(
        children: [
          Logo(
            title: context.tr('Forgot password'),
          ),
          Padding(
            padding: const EdgeInsets.all(padding24),
            child: Column(
              children: [
                const Icon(
                  Icons.error_rounded,
                  size: 80,
                  color: ZPColors.warning,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: padding12,
                    bottom: padding6,
                  ),
                  child: Text(
                    context.tr('Reset password link expired'),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 20,
                        ),
                  ),
                ),
                Text(
                  context.tr(
                    'The link you are attempting to use to reset your password has expired. Please use new link to reset your password.',
                  ),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: ZPColors.passwordValidationsColor,
                      ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: padding24),
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      context.router.pushAndPopUntil(
                        const ForgetPasswordPageRoute(),
                        predicate: (route) =>
                            route.settings.name ==
                            const LoginPageRoute().routeName,
                      );
                    },
                    child: Text(context.tr('Reset password')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
