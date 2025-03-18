import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/privacy_consent/privacy_consent_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PrivacyConsentPage extends StatelessWidget {
  const PrivacyConsentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.privacyConsentPage,
      appBar: CustomAppBar.commonAppBar(
        title: Text(
          context.tr('Privacy consent'),
          style: Theme.of(context).textTheme.labelLarge,
          key: WidgetKeys.privacyConsentAppBarTitle,
        ),
        customerBlockedOrSuspended:
            context.read<EligibilityBloc>().state.customerBlockOrSuspended,
      ),
      body: BlocProvider<PrivacyConsentBloc>(
        create: (context) => locator<PrivacyConsentBloc>()
          ..add(
            const PrivacyConsentEvent.fetch(),
          ),
        child: BlocConsumer<PrivacyConsentBloc, PrivacyConsentState>(
          listenWhen: (previous, current) =>
              previous.submitFailureOrSuccessOption !=
                  current.submitFailureOrSuccessOption ||
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
            state.submitFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (_) {
                  CustomSnackBar(
                    key: WidgetKeys.privacyConsentSuccessSnackBar,
                    textStyle: Theme.of(context).textTheme.titleSmall,
                    messageText:
                        context.tr('Privacy settings saved successfully'),
                  ).show(context);
                },
              ),
            );
          },
          buildWhen: (previous, current) =>
              previous.currentPrivacyControl != current.currentPrivacyControl ||
              previous.isLoading != current.isLoading,
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      Text(
                        context.tr('Transparent & consent management'),
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      RichText(
                        text: TextSpan(
                          text: context.tr(
                            'eZRx uses your data for various purposes including the research and improvement of our platform and services. For more information, please refer to our ',
                          ),
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: ZPColors.neutralsGrey1,
                                  ), // Apply default text style
                          children: [
                            TextSpan(
                              text: context.tr('Privacy policy'),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: ZPColors.primary,
                                    decoration: TextDecoration.underline,
                                  ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.navigateTo(
                                    StaticHtmlViewerRoute(
                                      title: 'Privacy policy',
                                      htmlPath: context
                                          .read<EligibilityBloc>()
                                          .state
                                          .user
                                          .privacyPolicyStaticFile,
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Divider(
                        indent: 0,
                        thickness: 1,
                        endIndent: 0,
                        height: 1,
                        color: ZPColors.extraLightGrey2,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        context.tr('eZRx privacy controls'),
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Text(
                        context.tr('Manage your privacy controls here'),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: ZPColors.neutralsGrey1,
                            ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      ListTileTheme(
                        horizontalTitleGap: padding6,
                        child: CheckboxListTile(
                          key: WidgetKeys.automatedPersonalisationTile,
                          contentPadding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          controlAffinity: ListTileControlAffinity.leading,
                          dense: true,
                          enabled: !state.isLoading,
                          value: state
                              .currentPrivacyControl.automatedPersonalisation,
                          onChanged: (value) =>
                              context.read<PrivacyConsentBloc>().add(
                                    PrivacyConsentEvent
                                        .updateAutomatedPersonalisation(
                                      value: value ?? false,
                                    ),
                                  ),
                          title: Text(
                            context.tr('Automated personalisations'),
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 34),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.tr(
                                'This enables us to provide you with personalised and relevant information (e.g. recommendations and advertisements) based on your past usage of eZRx. Turning this off may reduce the relevance of information that we provide to you but will not prevent you from receiving recommendations and advertisements in general',
                              ),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: ZPColors.neutralsGrey1,
                                  ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              context.tr('Direct marketing'),
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              context.tr(
                                'How we will provide you with marketing information (e.g. special offers, promotions or events by us or our partners)',
                              ),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: ZPColors.neutralsGrey1,
                                  ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            ListTileTheme(
                              horizontalTitleGap: padding6,
                              child: CheckboxListTile(
                                key: WidgetKeys.viaEmailTile,
                                contentPadding: EdgeInsets.zero,
                                visualDensity: VisualDensity.compact,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                dense: true,
                                enabled: !state.isLoading,
                                value: state.currentPrivacyControl.viaEmails,
                                onChanged: (value) =>
                                    context.read<PrivacyConsentBloc>().add(
                                          PrivacyConsentEvent.updateViaEmail(
                                            value: value ?? false,
                                          ),
                                        ),
                                title: Text(
                                  context.tr('Via emails'),
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ),
                            ListTileTheme(
                              horizontalTitleGap: padding6,
                              child: CheckboxListTile(
                                key: WidgetKeys.viaPushNotificationTile,
                                contentPadding: EdgeInsets.zero,
                                visualDensity: VisualDensity.compact,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                dense: true,
                                enabled: !state.isLoading,
                                value: state
                                    .currentPrivacyControl.viaPushNotification,
                                onChanged: (value) =>
                                    context.read<PrivacyConsentBloc>().add(
                                          PrivacyConsentEvent
                                              .updateViaPushNotification(
                                            value: value ?? false,
                                          ),
                                        ),
                                title: Text(
                                  context.tr('Via push notifications'),
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ),
                            ListTileTheme(
                              horizontalTitleGap: padding6,
                              child: CheckboxListTile(
                                key: WidgetKeys.viaSMSTile,
                                contentPadding: EdgeInsets.zero,
                                visualDensity: VisualDensity.compact,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                dense: true,
                                enabled: !state.isLoading,
                                value: state.currentPrivacyControl.viaSMS,
                                onChanged: (value) =>
                                    context.read<PrivacyConsentBloc>().add(
                                          PrivacyConsentEvent.updateViaSMS(
                                            value: value ?? false,
                                          ),
                                        ),
                                title: Text(
                                  context.tr('Via SMS'),
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 80,
                  padding: const EdgeInsets.all(padding12),
                  child: Row(
                    children: [
                      Expanded(
                        child: LoadingShimmer.withChild(
                          enabled: state.isLoading,
                          child: SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              key: WidgetKeys.privacyConsentClearButton,
                              onPressed: () => state.isLoading
                                  ? null
                                  : context.read<PrivacyConsentBloc>().add(
                                        const PrivacyConsentEvent.clear(),
                                      ),
                              child: Text(
                                context.tr('Clear changes'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: padding12,
                      ),
                      Expanded(
                        child: LoadingShimmer.withChild(
                          enabled: state.isLoading,
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              key: WidgetKeys.privacyConsentSubmitButton,
                              onPressed: (state.enableSubmit &&
                                      !state.isLoading)
                                  ? () =>
                                      context.read<PrivacyConsentBloc>().add(
                                            const PrivacyConsentEvent.submit(),
                                          )
                                  : null,
                              child: Text(
                                context.tr('Save'),
                                style: const TextStyle(
                                  color: ZPColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
