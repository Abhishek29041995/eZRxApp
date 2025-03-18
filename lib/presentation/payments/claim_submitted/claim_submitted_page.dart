import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class ClaimSubmittedPage extends StatelessWidget {
  const ClaimSubmittedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return Scaffold(
      appBar: CustomAppBar.commonAppBar(
        title: Text(
          context.tr('Claim submitted'),
          key: WidgetKeys.claimSubmittedPage,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        titleSpacing: 0,
        leadingWidget: IconButton(
          key: WidgetKeys.closeButton,
          icon: const Icon(
            Icons.close,
          ),
          onPressed: () => context.router.maybePop(),
        ),
        customerBlockedOrSuspended: eligibilityState.customerBlockOrSuspended,
      ),
      body: CustomCard(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              SvgImage.checkCircle,
              alignment: Alignment.center,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 24, 0, 8),
              child: Text(
                '${context.tr('Thank you')} ${eligibilityState.user.username.getOrDefaultValue('')}! \n${context.tr('Your Claim has been submitted')}.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            Text(
              context.tr(
                'eZCS ticket will be automatically created in a few seconds.',
              ),
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: ZPColors.neutralsGrey1),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 24, 0, 16),
              child: OutlinedButton(
                key: WidgetKeys.claimSubmittedViewClaimListButton,
                onPressed: () {
                  context.router
                      .popUntilRouteWithName(ClaimManagementPageRoute.name);
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Text(
                  context.tr('View claim list'),
                  style: const TextStyle(color: ZPColors.primary),
                ),
              ),
            ),
            ElevatedButton(
              key: WidgetKeys.claimSubmittedCreateNewClaimButton,
              onPressed: () {
                context.router.replace(const NewClaimSubmissionPageRoute());
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text(
                context.tr('Create new claim'),
                style: const TextStyle(color: ZPColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
