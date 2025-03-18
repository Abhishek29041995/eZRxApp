import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/proxy_login/proxy_login_form_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/more/section/national_privacy_commission_section.dart';
import 'package:ezrxmobile/presentation/more/section/login_on_behalf_sheet.dart';
import 'package:ezrxmobile/presentation/more/section/profile_tile_section.dart';
import 'package:ezrxmobile/presentation/more/section/version_display.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/more/section/help_and_support_section.dart';
import 'package:ezrxmobile/presentation/more/section/service_tile_section.dart';
import 'package:ezrxmobile/presentation/more/section/settings_title_section.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

part 'section/login_on_behalf/login_on_behalf.dart';

@RoutePage()
class MoreTab extends StatelessWidget {
  const MoreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.tr('More'),
          style: Theme.of(context).textTheme.labelLarge,
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: AnnouncementBanner(
        key: WidgetKeys.moreScreen,
        currentPath: const MoreTabRoute().routeName,
        child: ListView(
          key: WidgetKeys.scrollList,
          children: [
            const ProfileTile(),
            const SizedBox(height: padding12),
            const ServiceTile(),
            const Divider(
              color: ZPColors.accentColor,
              endIndent: padding12,
              indent: padding12,
              height: padding24,
            ),
            const SettingsTile(),
            const SizedBox(
              height: padding12,
            ),
            const HelpAndSupportTile(),
            const NationalPrivacyCommissionSection(),
            const Divider(
              color: ZPColors.accentColor,
              endIndent: padding12,
              indent: padding12,
              height: 1,
            ),
            const VersionDisplay(),
            const SizedBox(
              height: padding12,
            ),
            const LoginOnBehalf(),
            ListTile(
              key: WidgetKeys.logOutTile,
              visualDensity: VisualDensity.compact,
              contentPadding: const EdgeInsets.symmetric(horizontal: padding12),
              minVerticalPadding: 0,
              dense: true,
              leading: const Icon(
                Icons.logout_outlined,
                color: ZPColors.red,
              ),
              onTap: () => context.read<AuthBloc>().add(
                    const AuthEvent.logout(),
                  ),
              title: Text(
                context.tr(
                  'Log out',
                ),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ZPColors.red,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
