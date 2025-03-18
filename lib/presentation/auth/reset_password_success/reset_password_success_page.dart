import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/logo.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class ResetPasswordSuccess extends StatelessWidget {
  final bool isFirstLogin;
  const ResetPasswordSuccess({super.key, this.isFirstLogin = false});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !isFirstLogin,
      child: Scaffold(
        body: isFirstLogin
            ? _ResetPasswordSuccessBodyContent.firstLogin()
            : _ResetPasswordSuccessBodyContent.resetPassword(context: context),
      ),
    );
  }
}

class _ResetPasswordSuccessBodyContent extends StatelessWidget {
  final Widget logo;
  final Widget trailingWidget;
  final Widget? loginButton;
  const _ResetPasswordSuccessBodyContent({
    required this.logo,
    required this.trailingWidget,
    this.loginButton,
  });

  factory _ResetPasswordSuccessBodyContent.firstLogin() =>
      _ResetPasswordSuccessBodyContent(
        logo: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset(
              SvgImage.ezrxPlusLogo,
              height: 40,
              width: 120,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        trailingWidget: const _CountDownSection(),
      );

  factory _ResetPasswordSuccessBodyContent.resetPassword({
    required BuildContext context,
  }) =>
      _ResetPasswordSuccessBodyContent(
        logo: const Logo(
          title: 'Reset password',
        ),
        trailingWidget: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 20),
          child: Text(
            context.tr('You have successfully changed \n your password.'),
            textAlign: TextAlign.center,
            key: WidgetKeys.resetPasswordPageBodyText,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        loginButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: ElevatedButton(
            key: WidgetKeys.changePasswordButton,
            onPressed: () =>
                context.router.popUntilRouteWithName(LoginPageRoute.name),
            child: Text(context.tr('Login')),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AnnouncementBanner(
      currentPath: context.router.currentPath,
      child: ListView(
        children: <Widget>[
          logo,
          SvgPicture.asset(
            SvgImage.resetPasswordSuccessLogo,
            key: WidgetKeys.noRecordsFoundSearchIcon,
            height: 120,
          ),
          const SizedBox(height: 10),
          Text(
            context.tr('New password saved!'),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          trailingWidget,
          loginButton ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class _CountDownSection extends StatefulWidget {
  const _CountDownSection();

  @override
  State<_CountDownSection> createState() => _CountDownSectionState();
}

class _CountDownSectionState extends State<_CountDownSection> {
  static const maxSeconds = 5;
  int remainingSeconds = maxSeconds;
  Timer? countdownTimer;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  void startCountdown() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingSeconds > 0) {
          remainingSeconds--;
        } else {
          timer.cancel();
          context.read<UserBloc>().add(const UserEvent.fetch());
          context.router.popUntilRouteWithName(HomeNavigationTabbarRoute.name);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      context.tr(
        'Redirecting to homepage in {remainingSeconds} seconds',
        namedArgs: {
          'remainingSeconds': remainingSeconds.toString(),
        },
      ),
      key: WidgetKeys.resetPasswordPageBodyTextForFirstLogin,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
