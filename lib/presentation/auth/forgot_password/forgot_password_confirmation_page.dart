import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/logo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/application/auth/forgot_password/forgot_password_bloc.dart';
import 'package:ezrxmobile/presentation/auth/forgot_password/widgets/back_to_login_button.dart';
import 'package:auto_route/auto_route.dart';

part 'package:ezrxmobile/presentation/auth/forgot_password/widgets/email_send_to_you.dart';

@RoutePage()
class ForgetPasswordConfirmationPage extends StatelessWidget {
  const ForgetPasswordConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: ZPColors.accentColor,
        toolbarHeight: 1,
      ),
      body: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
        listenWhen: (previous, current) =>
            previous.resetPasswordFailureOrSuccessOption !=
            current.resetPasswordFailureOrSuccessOption,
        listener: (context, state) {
          state.resetPasswordFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) => ErrorUtils.handleApiFailure(context, failure),
              (_) {},
            ),
          );
        },
        buildWhen: (previous, current) =>
            previous.isSubmitting != current.isSubmitting,
        builder: (context, state) {
          return state.isSubmitting
              ? LoadingShimmer.logo(
                  key: WidgetKeys.loaderImage,
                )
              : Column(
                  children: <Widget>[
                    Logo(
                      title: context.tr('Forgot password'),
                    ),
                    Expanded(
                      child: ListView(
                        padding:
                            const EdgeInsets.symmetric(horizontal: padding12),
                        children: [
                          const _EmailSendToYou(),
                          SvgPicture.asset(
                            'assets/svg/reset_password_success_banner.svg',
                            height: Responsive.isMobile(context) ? 250 : 400,
                          ),
                          const SizedBox(height: padding12),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: context.tr('Didn’t receive an email?'),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      color: ZPColors.shadesBlack,
                                    ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: context.tr(' '),
                                  ),
                                  TextSpan(
                                    text: context.tr('Resend Email'),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          color: ZPColors.extraDarkGreen,
                                        ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => context
                                          .read<ForgotPasswordBloc>()
                                          .add(
                                            const ForgotPasswordEvent
                                                .requestPasswordReset(),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: padding24),
                          const BackToLogin(),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
