import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/national_privacy_commission/national_privacy_commission_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/png_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const sealList = [
  PngImage.seal25Jul2024,
  PngImage.seal27Jul2024,
  PngImage.seal24Aug2024,
  PngImage.seal6Dec2024,
];

@RoutePage()
class NationalPrivacyCommissionPage extends StatelessWidget {
  const NationalPrivacyCommissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.commonAppBar(
        titleSpacing: 12,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              key: WidgetKeys.closeButton,
              onPressed: () => context.router.back(),
              iconSize: 24,
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.close),
            ),
            const SizedBox(width: 8),
            Text(
              context.tr('National Privacy Commission'),
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: ZPColors.neutralsBlack),
            ),
          ],
        ),
        customerBlockedOrSuspended:
            context.read<EligibilityBloc>().state.customerBlockOrSuspended,
      ),
      body: BlocConsumer<NationalPrivacyCommissionBloc,
          NationalPrivacyCommissionState>(
        buildWhen: (previous, current) => previous.isSaving != current.isSaving,
        listenWhen: (previous, current) =>
            previous.failureOrSuccessOption != current.failureOrSuccessOption,
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) {},
            ),
          );
        },
        builder: (context, state) {
          return SafeArea(
            child: ListView(
              key: WidgetKeys.nationalPrivacyCommissionPage,
              padding: const EdgeInsets.all(padding12),
              children: [
                Text(
                  context.tr('Save the images and scan for more details'),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: ZPColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        key: WidgetKeys.saveSealImages,
                        onPressed: state.isSaving
                            ? null
                            : () {
                                context
                                    .read<NationalPrivacyCommissionBloc>()
                                    .add(
                                      const NationalPrivacyCommissionEvent
                                          .saveImages(images: sealList),
                                    );
                              },
                        child: LoadingShimmer.withChild(
                          enabled: state.isSaving,
                          child: Text(
                            context.tr('Save to gallery'),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(color: ZPColors.whiteBgCard),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ...List.generate(
                  sealList.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Image.asset(
                      key: WidgetKeys.sealImage(sealList[index]),
                      sealList[index],
                      height: 290,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
