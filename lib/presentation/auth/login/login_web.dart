//ignore_for_file: unused-code
//ignore_for_file: unused-class
//ignore_for_file: unused-files
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/auth/login/common/announcement.dart';
import 'package:ezrxmobile/presentation/auth/login/common/exrx_apl_logo.dart';
import 'package:ezrxmobile/presentation/auth/login/common/login_button.dart';
import 'package:ezrxmobile/presentation/auth/login/common/market_selector.dart';
import 'package:ezrxmobile/presentation/auth/login/common/password_field.dart';
import 'package:ezrxmobile/presentation/auth/login/common/remember_password.dart';
import 'package:ezrxmobile/presentation/auth/login/common/username_field.dart';
import 'package:ezrxmobile/presentation/core/chatbot/chatbot_widget.dart';
import 'package:ezrxmobile/presentation/core/png_image.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginWeb extends StatelessWidget {
  final LoginFormState state;

  const LoginWeb({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: ResponsiveRowColumn(
            isRow: Responsive.isLargerThan(context, Breakpoint.desktop),
            children: [
              _LoginBanner(
                height: Responsive.isLargerThan(context, Breakpoint.desktop)
                    ? MediaQuery.of(context).size.height
                    : 500,
                width: Responsive.isLargerThan(context, Breakpoint.desktop)
                    ? MediaQuery.of(context).size.width * 0.5
                    : MediaQuery.of(context).size.width,
              ),
              _LoginFormWeb(
                state: state,
              ),
            ],
          ),
        ),
        const Announcement(),
        const ChatBotWidget(),
      ],
    );
  }
}

class _LoginBanner extends StatelessWidget {
  final double width;
  final double height;
  const _LoginBanner({
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          PngImage.loginBannerWeb,
          fit: BoxFit.cover,
          width: width,
          height: height,
        ),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                ZPColors.primary.withOpacity(0.5),
                ZPColors.primary,
              ],
              stops: const [
                0.1,
                0.75,
                0.95,
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              heightFactor: Responsive.isLargerThan(context, Breakpoint.desktop)
                  ? 0.45
                  : 0.6,
              widthFactor: 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ASEAN\'s largest award-winning B2B eCommerce healthcare platform'
                        .tr(),
                    style: Responsive.isLargerThan(context, Breakpoint.desktop)
                        ? Theme.of(context).textTheme.headlineMedium!.copyWith(
                              fontWeight: FontWeight.w700,
                              color: ZPColors.white,
                            )
                        : Theme.of(context).textTheme.headlineSmall!.copyWith(
                              fontWeight: FontWeight.w700,
                              color: ZPColors.white,
                            ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'A simple, seamless self-service experience powered with enhanced features to delight you every time.'
                        .tr(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ZPColors.white,
                        ),
                  ),
                  Text(
                    'Order, track deliveries, and perform product returns anytime anywhere'
                        .tr(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ZPColors.white,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LoginFormWeb extends StatelessWidget {
  final LoginFormState state;
  const _LoginFormWeb({
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: Responsive.isLargerThan(context, Breakpoint.desktop)
          ? MediaQuery.of(context).size.width * 0.5
          : MediaQuery.of(context).size.width,
      height: Responsive.isLargerThan(context, Breakpoint.desktop) ? null : 700,
      child: Form(
        autovalidateMode: state.showErrorMessages
            ? AutovalidateMode.always
            : AutovalidateMode.disabled,
        child: FractionallySizedBox(
          widthFactor: 0.83,
          child: Column(
            mainAxisAlignment:
                Responsive.isLargerThan(context, Breakpoint.desktop)
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Responsive.isLargerThan(
                  context,
                  Breakpoint.desktop,
                )
                    ? 0
                    : 16,
              ),
              const _Logo(),
              const SizedBox(
                height: 25,
              ),
              const _Welcome(),
              const SizedBox(
                height: 25,
              ),
              const MarketSelector(),
              const SizedBox(height: 25),
              const UsernameField(),
              const SizedBox(height: 25),
              const PasswordField(),
              const SizedBox(height: 25),
              const RememberPassword(),
              const SizedBox(height: 15),
              const LoginButton(),
              const SizedBox(height: 25),
              if (!state.currentMarket.isRegistrationRestricted) ...[
                const _TermsOfUse(),
                const SizedBox(height: 6),
                const _CreateAccount(),
              ],
              if (!state.currentMarket.isSSOLoginRestricted)
                const _SSOLogin(
                  key: WidgetKeys.ssoLoginButton,
                ),
              if (state.currentMarket.isID) const EzrxAplLogo(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TermsOfUse extends StatelessWidget {
  const _TermsOfUse();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodySmall,
        children: [
          TextSpan(
            text: 'By signing in, you agree to our '.tr(),
          ),
          TextSpan(
            text: context.tr('Terms of Use'),
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: ZPColors.primary,
                  decoration: TextDecoration.underline,
                ),
          ),
        ],
      ),
    );
  }
}

class _CreateAccount extends StatelessWidget {
  const _CreateAccount();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodySmall,
        children: [
          TextSpan(
            text: 'New to eZRx & Zuellig Pharma? '.tr(),
          ),
          WidgetSpan(
            child: TextButton(
              key: WidgetKeys.createAccountButton,
              child: Text(
                context.tr('Sign Up'),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ZPColors.primary,
                      decoration: TextDecoration.underline,
                    ),
              ),
              onPressed: () {
                context.router.push(
                  WebViewPageRoute(
                    url: locator<Config>().createAccountUrl,
                    titleText: context.tr('Sign Up'),
                  ),
                );
              },
            ),
            alignment: PlaceholderAlignment.middle,
          ),
        ],
      ),
    );
  }
}

class _SSOLogin extends StatelessWidget {
  const _SSOLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ColoredBox(
        color: ZPColors.extraLightGrey5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login via eZLogin'.tr(),
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: ZPColors.primary,
                  ),
            ),
            const SizedBox(
              width: 8,
            ),
            OutlinedButton(
              onPressed: () {
                context
                    .read<LoginFormBloc>()
                    .add(const LoginFormEvent.loginWithOktaButtonPressed());
              },
              child: Row(
                children: [
                  Text(
                    'Single sign-on'.tr(),
                  ),
                  const Icon(Icons.keyboard_arrow_right),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/ezrx+logo.svg',
    );
  }
}

class _Welcome extends StatelessWidget {
  const _Welcome();

  @override
  Widget build(BuildContext context) {
    return Text(
      context.tr('Welcome to eZRx+'),
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w700,
            color: ZPColors.primary,
          ),
    );
  }
}
