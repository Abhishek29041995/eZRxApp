import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/more/more_details_tile.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HelpAndSupportTile extends StatelessWidget {
  const HelpAndSupportTile({super.key});
  List<MoreDetailsTile> moreHelpAndSupportTiles(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return <MoreDetailsTile>[
      MoreDetailsTile.faq(context),
      MoreDetailsTile.announcementAndArticleTab(context),
      MoreDetailsTile.userGuide(context),
      if (eligibilityState.salesOrg.isAboutUsEnabled)
        MoreDetailsTile.aboutUs(context),
      MoreDetailsTile.chatSupport(context),
      MoreDetailsTile.acceptableUsePolicy(context),
      MoreDetailsTile.termsOfUse(context),
      MoreDetailsTile.privacyPolicy(context),
      MoreDetailsTile.contactUs(context),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(padding12),
      minVerticalPadding: 0,
      title: Text(
        context.tr('Help & Support'),
        style: Theme.of(context).textTheme.labelMedium,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: padding12),
        child: Column(
          children: moreHelpAndSupportTiles(context).map((item) {
            return ListTile(
              visualDensity: VisualDensity.compact,
              contentPadding: EdgeInsets.zero,
              dense: true,
              key: item.key,
              onTap: item.onTap,
              trailing: const Icon(
                Icons.chevron_right_rounded,
                color: ZPColors.black,
              ),
              title: Text(
                context.tr(item.label),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
