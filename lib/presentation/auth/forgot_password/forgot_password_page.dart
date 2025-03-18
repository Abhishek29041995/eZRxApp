import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/logo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/application/auth/forgot_password/forgot_password_bloc.dart';
import 'package:ezrxmobile/presentation/auth/forgot_password/widgets/back_to_login_button.dart';

part 'package:ezrxmobile/presentation/auth/forgot_password/widgets/user_name_field.dart';

part 'package:ezrxmobile/presentation/auth/forgot_password/widgets/forgot_password_button.dart';

@RoutePage()
class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: ZPColors.accentColor,
        toolbarHeight: 1,
      ),
      body: Column(
        children: [
          Logo(
            title: context.tr('Forgot password'),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: padding12),
              children: [
                Text(
                  context.tr(
                    'Let us know your eZRx+ username and we`ll send you a verification email.',
                  ),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: ZPColors.passwordValidationsColor,
                      ),
                ),
                const SizedBox(height: padding24),
                _UsernameField(
                  controller: TextEditingController(),
                ),
                const SizedBox(height: padding24),
                const _ForgotPasswordButton(),
                const SizedBox(height: padding12),
                const BackToLogin(),
                const SizedBox(height: padding24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
