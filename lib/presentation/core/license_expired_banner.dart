import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
import 'package:ezrxmobile/presentation/core/color_container.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LicenseExpiredBanner extends StatelessWidget {
  const LicenseExpiredBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerLicenseBloc, CustomerLicenseState>(
      buildWhen: (previous, current) =>
          previous.isLicenseExpired != current.isLicenseExpired,
      builder: (context, state) {
        return state.isLicenseExpired
            ? ColorContainer(
                key: WidgetKeys.licenseExpiredBanner,
                color: ZPColors.errorSnackBarColor,
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 18,
                ),
                circularRadius: 0,
                children: [
                  Text(
                    context.tr(
                      'You have licenses that are about to expire or has expired.',
                    ),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    context.tr(
                      'To continue using eZRx+, please renew your license.',
                    ),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextButton(
                    key: WidgetKeys.viewLicenseButton,
                    style: ButtonStyle(
                      padding: WidgetStateProperty.all(EdgeInsets.zero),
                    ),
                    child: Text(
                      context.tr('View license'),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: ZPColors.primary,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                    onPressed: () =>
                        context.router.push(const ProfilePageRoute()),
                  ),
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}
