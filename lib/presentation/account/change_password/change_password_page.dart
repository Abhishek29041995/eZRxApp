import 'package:ezrxmobile/presentation/core/validation_failed_warning.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/password_validation.dart';
import 'package:ezrxmobile/presentation/core/password_text_field.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
part 'package:ezrxmobile/presentation/account/change_password/widgets/change_password_form.dart';
part 'package:ezrxmobile/presentation/account/change_password//widgets/save_clear_changes_section.dart';

@RoutePage()
class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.commonAppBar(
        title: Text(context.tr('Security')),
        leadingWidget: IconButton(
          key: WidgetKeys.backButton,
          icon: const Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
            context
                .read<ResetPasswordBloc>()
                .add(const ResetPasswordEvent.clear());
            context.router.maybePop();
          },
        ),
        customerBlockedOrSuspended:
            context.read<EligibilityBloc>().state.customerBlockOrSuspended,
      ),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: ListView(
          padding: const EdgeInsets.all(padding12),
          children: <Widget>[
            Text(
              context.tr('Change Password'),
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: padding12),
              child: Text(
                context.tr(
                  'We recommend you to change your password every 3 months',
                ),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.changePasswordRecommendationColor,
                    ),
              ),
            ),
            const _ChangePasswordForm(),
            PasswordValidation(
              user: context.read<EligibilityBloc>().state.user,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const _SaveClearChangesSection(),
    );
  }
}
