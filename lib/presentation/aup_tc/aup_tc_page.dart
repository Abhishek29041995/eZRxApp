import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_icon.dart';
import 'package:ezrxmobile/presentation/core/static_html_viewer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';

@RoutePage()
class AupTCPage extends StatelessWidget {
  final User user;
  final bool isMarketPlace;

  const AupTCPage({
    super.key,
    required this.user,
    required this.isMarketPlace,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BlocProvider(
        create: (context) => locator<AupTcBloc>()..add(AupTcEvent.show(user)),
        child: BlocBuilder<AupTcBloc, AupTcState>(
          buildWhen: (previous, current) => previous.user != current.user,
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                key: WidgetKeys.tncDialogAppBar,
                title: SvgPicture.asset(
                  'assets/svg/ezrx+logo.svg',
                  height: 30,
                  fit: BoxFit.scaleDown,
                ),
                automaticallyImplyLeading: false,
              ),
              body: AnnouncementBanner(
                currentPath: context.router.currentPath,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      isMarketPlace
                          ? RichText(
                              text: TextSpan(
                                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                children: [
                                  const WidgetSpan(
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 4),
                                      child: MarketPlaceIcon(
                                        width: 28,
                                        height: 28,
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text: context.tr('Welcome to Marketplace'),
                                  ),
                                ],
                              ),
                            )
                          : Text(
                              context.tr('Welcome to eZRx+'),
                              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                      const SizedBox(height: 8),
                      Text(
                        context.tr(
                          isMarketPlace
                              ? 'New Marketplace is launched and now you can purchases products from that sold by sellers as well. Before proceed kindly read and agree to the terms of use, acceptable usage policy & regional privacy policy before processing.'
                              : 'As a new user of eZRx+, we will require you to acknowledge the Terms of Use and Regional Privacy Policy before proceeding.',
                        ),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: ZPColors.neutralsGrey1,
                            ),
                      ),
                      const SizedBox(height: 16),
                      if (!isMarketPlace)
                        _ConsentBox(
                          key: WidgetKeys.tncContentBox,
                          user: state.user,
                          url: state.user.tncFile,
                        ),
                      const SizedBox(height: 16),
                      _ConsentBox(
                        key: WidgetKeys.privacyContentBox,
                        user: state.user,
                        url: isMarketPlace
                            ? state.user.marketPlacePrivacyPolicyFile
                            : state.user.privacyPolicyFile,
                      ),
                      const SizedBox(height: 16),
                      _TermsOfUseConsentCheckBox(isMarketPlace),
                      const SizedBox(height: 8),
                      _PrivacyPolicyConsentCheckBox(isMarketPlace),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: AcceptButton(isMarketPlace: isMarketPlace),
            );
          },
        ),
      ),
    );
  }
}

class _TermsOfUseConsentCheckBox extends StatelessWidget {
  const _TermsOfUseConsentCheckBox(this.isMarketPlace);

  final bool isMarketPlace;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AupTcBloc, AupTcState>(
      buildWhen: (previous, current) =>
          previous.tncConsent != current.tncConsent,
      builder: (context, state) {
        return ListTileTheme(
          data: const ListTileThemeData(
            titleAlignment: ListTileTitleAlignment.top,
            contentPadding: EdgeInsets.zero,
            minVerticalPadding: 0,
          ),
          child: CheckboxListTile(
            key: WidgetKeys.tncCheckBox,
            contentPadding: const EdgeInsets.all(0),
            value: state.tncConsent,
            title: Text(
              context.tr(
                isMarketPlace
                    ? 'I have read and hereby agree to the additional terms (shared above) that apply to my use of Marketplace.'
                    : 'I have read and hereby agree to the Terms of Use and Acceptable Use Policy.',
              ),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: ZPColors.darkerGrey,
                  ),
            ),
            onChanged: (value) {
              context.read<AupTcBloc>().add(
                    AupTcEvent.termsOfUseConsent(
                      newValue: value!,
                    ),
                  );
            },
            visualDensity: VisualDensity.compact,
            controlAffinity: ListTileControlAffinity.leading,
          ),
        );
      },
    );
  }
}

class _PrivacyPolicyConsentCheckBox extends StatelessWidget {
  const _PrivacyPolicyConsentCheckBox(this.isMarketPlace);

  final bool isMarketPlace;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AupTcBloc, AupTcState>(
      buildWhen: (previous, current) =>
          previous.privacyConsent != current.privacyConsent,
      builder: (context, state) {
        return ListTileTheme(
          data: const ListTileThemeData(
            titleAlignment: ListTileTitleAlignment.top,
            contentPadding: EdgeInsets.zero,
            minVerticalPadding: 0,
          ),
          child: CheckboxListTile(
            key: WidgetKeys.privacyCheckBox,
            contentPadding: const EdgeInsets.all(0),
            value: state.privacyConsent,
            title: Text(
              context.tr(
                isMarketPlace
                    ? 'I acknowledge and agree that the Regional Privacy Policy and Acceptable Use Policy for eZRx+ likewise applies to my usage of Marketplace. I consent to my personal data being processed by Marketplace in accordance with the Regional Privacy Policy.'
                    : 'I have read and hereby consent to my personal data being processed in accordance with the Regional Privacy Policy.',
              ),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: ZPColors.darkerGrey,
                  ),
            ),
            onChanged: (value) {
              context.read<AupTcBloc>().add(
                    AupTcEvent.privacyPolicyConsent(
                      newValue: value!,
                    ),
                  );
            },
            visualDensity: VisualDensity.compact,
            controlAffinity: ListTileControlAffinity.leading,
          ),
        );
      },
    );
  }
}

class _ConsentBox extends StatelessWidget {
  const _ConsentBox({
    super.key,
    required this.url,
    required this.user,
  });

  final String url;
  final User user;

  @override
  Widget build(BuildContext context) {
    if (user == User.empty()) return const SizedBox.shrink();

    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(3),
        height: MediaQuery.sizeOf(context).height * .20,
        decoration: BoxDecoration(
          color: ZPColors.white,
          border: Border.all(color: ZPColors.lightGray),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: StaticHtmlViewer(
          key: WidgetKeys.aupTcWebView,
          htmlPath: url,
        ),
      ),
    );
  }
}

class AcceptButton extends StatelessWidget {
  final bool isMarketPlace;

  const AcceptButton({
    required this.isMarketPlace,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        if (!isMarketPlace)
          BlocListener<UserBloc, UserState>(
            listenWhen: (pre, cur) =>
                pre.showTermsAndConditionDialog !=
                    cur.showTermsAndConditionDialog &&
                !cur.showTermsAndConditionDialog,
            listener: (context, _) {
              context.router
                  .popUntilRouteWithName(HomeNavigationTabbarRoute.name);
            },
          ),
        if (isMarketPlace)
          BlocListener<EligibilityBloc, EligibilityState>(
            listenWhen: (pre, cur) =>
                pre.showMarketPlaceTnc != cur.showMarketPlaceTnc &&
                !cur.showMarketPlaceTnc,
            listener: (context, _) {
              context.router.popForced();
            },
          ),
      ],
      child: BlocConsumer<UserBloc, UserState>(
        listenWhen: (previous, current) =>
            previous.isLoading != current.isLoading && !current.isLoading,
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) => ErrorUtils.handleApiFailure(context, failure),
              (_) {},
            ),
          );
        },
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        builder: (context, userState) {
          return BlocBuilder<AupTcBloc, AupTcState>(
            buildWhen: (previous, current) =>
                previous.userConsentAll != current.userConsentAll,
            builder: (context, state) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        key: WidgetKeys.tncDialogAcceptButton,
                        onPressed: () {
                          if (userState.isLoading) return;
                          if (!state.userConsentAll) {
                            CustomSnackBar(
                              key: WidgetKeys.consentAllWarningMessage,
                              messageText: context.tr(
                                'You need to read and accept full Terms of use and Privacy Policy before continue.',
                              ),
                            ).show(context);

                            return;
                          }

                          if (isMarketPlace) {
                            context.read<UserBloc>().add(
                                  UserEvent.setMarketPlaceTncAcceptance(
                                    MarketPlaceTnCAcceptance.accept(),
                                  ),
                                );
                          } else {
                            context.read<UserBloc>().add(
                                  const UserEvent.acceptTnc(),
                                );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(350, 40),
                          backgroundColor: state.userConsentAll
                              ? ZPColors.primary
                              : ZPColors.unselectedLabelColor,
                        ),
                        child: LoadingShimmer.withChild(
                          enabled: userState.isLoading,
                          child: Text(
                            context.tr('Accept'),
                          ),
                        ),
                      ),
                      TextButton(
                        key: WidgetKeys.tncDialogCancelButton,
                        onPressed: (userState.isLoading || state.userConsentAll)
                            ? null
                            : () {
                                if (isMarketPlace) {
                                  context.read<UserBloc>().add(
                                        UserEvent.setMarketPlaceTncAcceptance(
                                          MarketPlaceTnCAcceptance.reject(),
                                        ),
                                      );
                                } else {
                                  context.read<AuthBloc>().add(
                                        const AuthEvent.logout(),
                                      );
                                }
                              },
                        child: LoadingShimmer.withChild(
                          enabled: userState.isLoading,
                          child: Text(
                            isMarketPlace
                                ? context.tr('Skip & only see ZP products')
                                : context.tr('Cancel'),
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: state.userConsentAll
                                      ? ZPColors.lightGray
                                      : ZPColors.extraDarkGreen,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
