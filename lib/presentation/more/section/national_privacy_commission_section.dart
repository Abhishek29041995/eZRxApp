import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/png_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NationalPrivacyCommissionSection extends StatelessWidget {
  const NationalPrivacyCommissionSection({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.read<EligibilityBloc>().state.salesOrg.isPDOSealEnabled) {
      return ListTile(
        contentPadding: const EdgeInsets.all(padding12),
        minVerticalPadding: 0,
        title: Text(
          context.tr('National Privacy Commission'),
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: ZPColors.changePasswordRecommendationColor),
        ),
        subtitle: ListTile(
          visualDensity: VisualDensity.compact,
          contentPadding: EdgeInsets.zero,
          dense: true,
          key: WidgetKeys.nationalPrivacyCommissionTile,
          onTap: () => context.navigateTo(
            const NationalPrivacyCommissionPageRoute(),
          ),
          trailing: Wrap(
            children: [
              Text(
                context.tr('View seal'),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: ZPColors.extraDarkGreen,
                    ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: ZPColors.black,
              ),
            ],
          ),
          title: Row(
            children: [
              Image.asset(
                PngImage.seals,
                height: 36,
                width: 100,
              ),
            ],
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
