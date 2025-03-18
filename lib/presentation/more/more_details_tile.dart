import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/ez_point/ez_point_bloc.dart';
import 'package:ezrxmobile/application/account/notification_settings/notification_settings_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/chatbot/chat_bot_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoreDetailsTile {
  final Key? key;
  final Widget icon;
  final String label;
  final void Function() onTap;

  const MoreDetailsTile({
    this.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  factory MoreDetailsTile.faq(BuildContext context) => MoreDetailsTile(
        icon: const Icon(
          Icons.contact_support_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'FAQ',
        onTap: () => context.navigateTo(
          const FAQPageRoute(),
        ),
      );

  factory MoreDetailsTile.aboutUs(BuildContext context) => MoreDetailsTile(
        icon: const Icon(
          Icons.info_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'About us',
        onTap: () => context.navigateTo(const AboutUsPageRoute()),
      );

  factory MoreDetailsTile.chatSupport(BuildContext context) => MoreDetailsTile(
        icon: const Icon(
          Icons.forum_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'Chat support',
        onTap: () => context.read<ChatBotBloc>().add(
              const ChatBotEvent.startChatbot(),
            ),
      );

  factory MoreDetailsTile.userGuide(BuildContext context) => MoreDetailsTile(
        key: WidgetKeys.userGuideTile,
        icon: const Icon(
          Icons.menu_book_outlined,
          //TODO : will update it after Design Them update the Figma
          color: ZPColors.greenIconColor,
        ),
        label: 'User guide',
        onTap: () => context.navigateTo(
          PdfViewPageRoute(
            url: locator<Config>().getUserGuidePdfUrl(
              context
                  .read<EligibilityBloc>()
                  .state
                  .salesOrg
                  .country
                  .toLowerCase(),
            ),
            titleText: 'User guide',
          ),
        ),
      );

  factory MoreDetailsTile.termsOfUse(BuildContext context) => MoreDetailsTile(
        icon: const Icon(
          Icons.description_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'Terms of use',
        onTap: () => context.navigateTo(
          StaticHtmlViewerRoute(
            title: 'Terms of Use',
            htmlPath: context.read<EligibilityBloc>().state.user.tncStaticFile,
          ),
        ),
      );

  factory MoreDetailsTile.privacyPolicy(BuildContext context) =>
      MoreDetailsTile(
        icon: const Icon(
          Icons.privacy_tip_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'Privacy policy',
        onTap: () => context.navigateTo(
          StaticHtmlViewerRoute(
            title: 'Privacy policy',
            htmlPath: context
                .read<EligibilityBloc>()
                .state
                .user
                .privacyPolicyStaticFile,
          ),
        ),
      );

  factory MoreDetailsTile.contactUs(BuildContext context) => MoreDetailsTile(
        key: WidgetKeys.contactUsTile,
        icon: const Icon(
          Icons.mail_outline,
          color: ZPColors.greenIconColor,
        ),
        onTap: () {
          context.navigateTo(
            ContactUsPageRoute(
              appMarket:
                  context.read<EligibilityBloc>().state.salesOrg.appMarket,
            ),
          );
        },
        label: 'Contact us',
      );

  factory MoreDetailsTile.acceptableUsePolicy(BuildContext context) =>
      MoreDetailsTile(
        key: WidgetKeys.acceptableUsePolicy,
        icon: const SizedBox.shrink(),
        label: 'Acceptable Use Policy',
        onTap: () => context.navigateTo(
          StaticHtmlViewerRoute(
            title: 'Acceptable Use Policy',
            htmlPath: context
                .read<EligibilityBloc>()
                .state
                .user
                .acceptableUsePolicyFile,
          ),
        ),
      );

  factory MoreDetailsTile.orderTab(BuildContext context) => MoreDetailsTile(
        key: WidgetKeys.orderTile,
        icon: const Icon(
          Icons.receipt_long_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'Orders',
        onTap: () => context.navigateTo(
          const OrdersTabRoute(),
        ),
      );

  factory MoreDetailsTile.returnsTab(BuildContext context) => MoreDetailsTile(
        key: WidgetKeys.returnsTile,
        icon: SvgPicture.asset(
          'assets/svg/more_return.svg',
          height: 24,
          fit: BoxFit.contain,
        ),
        label: 'Returns',
        onTap: () => context.navigateTo(
          const ReturnRootRoute(),
        ),
      );

  factory MoreDetailsTile.paymentsTab(BuildContext context) => MoreDetailsTile(
        key: WidgetKeys.paymentsTile,
        icon: const Icon(
          Icons.account_balance_wallet_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'Payments',
        onTap: () {
          context.navigateTo(PaymentPageRoute(isMarketPlace: false));
        },
      );

  factory MoreDetailsTile.marketplacePaymentsTab(BuildContext context) =>
      MoreDetailsTile(
        key: WidgetKeys.mpPaymentsTile,
        icon: const Icon(
          Icons.account_balance_wallet_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'MP Payments',
        onTap: () {
          context.navigateTo(PaymentPageRoute(isMarketPlace: true));
        },
      );

  factory MoreDetailsTile.eZPointTab(BuildContext context) => MoreDetailsTile(
        key: WidgetKeys.eZPointTile,
        icon: const Icon(
          Icons.emoji_events_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'eZPoint',
        onTap: () {
          context.read<EZPointBloc>().add(
                EZPointEvent.fetch(
                  customerCodeInfo:
                      context.read<EligibilityBloc>().state.customerCodeInfo,
                ),
              );
          context.router.push(
            const EZPointWebviewPageRoute(),
          );
        },
      );

  factory MoreDetailsTile.announcementAndArticleTab(BuildContext context) =>
      MoreDetailsTile(
        key: WidgetKeys.announcementArticleTile,
        icon: const Icon(
          Icons.campaign_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'Announcements & articles',
        onTap: () => context.navigateTo(const AnnouncementsPageRoute()),
      );

  factory MoreDetailsTile.profile(BuildContext context) => MoreDetailsTile(
        key: WidgetKeys.profileTile,
        icon: const Icon(
          Icons.perm_identity_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'Profile',
        onTap: () {
          context.read<UserBloc>().add(
                UserEvent.selectLanguage(
                  context.read<UserBloc>().state.user.preferredLanguage,
                ),
              );
          context.navigateTo(
            const ProfilePageRoute(),
          );
        },
      );

  factory MoreDetailsTile.security(BuildContext context) => MoreDetailsTile(
        key: WidgetKeys.securityTile,
        icon: const Icon(
          Icons.https_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'Security',
        onTap: () => context.navigateTo(const ChangePasswordPageRoute()),
      );

  factory MoreDetailsTile.notifications(BuildContext context) =>
      MoreDetailsTile(
        icon: const Icon(
          Icons.notifications_none_outlined,
          color: ZPColors.greenIconColor,
        ),
        key: WidgetKeys.notificationTile,
        label: 'Notifications',
        onTap: () {
          context.read<NotificationSettingsBloc>().add(
                const NotificationSettingsEvent.fetch(),
              );
          context.navigateTo(const NotificationSettingsPageRoute());
        },
      );

  factory MoreDetailsTile.privacyConsent(BuildContext context) =>
      MoreDetailsTile(
        icon: const Icon(
          Icons.notifications_none_outlined,
          color: ZPColors.greenIconColor,
        ),
        key: WidgetKeys.privacyConsentTile,
        label: 'Privacy consent',
        onTap: () {
          context.navigateTo(const PrivacyConsentPageRoute());
        },
      );
  factory MoreDetailsTile.eZCSTickets(BuildContext context) => MoreDetailsTile(
        icon: const Icon(
          Icons.confirmation_number_outlined,
          color: ZPColors.greenIconColor,
        ),
        key: WidgetKeys.ezcsTicketTile,
        label: 'eZCS Tickets',
        onTap: () {
          //TODO(Hob): Navigate to eZCS tickets listing
          context.navigateTo(SubmitTicketPageRoute(chatUrl: ''));
        },
      );
}
