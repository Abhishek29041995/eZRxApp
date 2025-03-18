//ignore_for_file: unused-files
//TODO: legacy file

// import 'package:auto_route/auto_route.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
// import 'package:ezrxmobile/application/account/user/user_bloc.dart';
// import 'package:ezrxmobile/application/auth/proxy_login/proxy_login_form_bloc.dart';
// import 'package:ezrxmobile/presentation/account/proxy_login.dart';
// import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
// import 'package:ezrxmobile/presentation/more/section/profile_tile_section.dart';
// import 'package:ezrxmobile/presentation/orders/cart/cart_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
// import 'package:url_launcher/url_launcher_string.dart';

// class AccountTab extends StatelessWidget {
//   const AccountTab({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         key: const Key('accountPage'),
//         title: const Text('Account').tr(),
//         automaticallyImplyLeading: false,
//         actions: const [
//           CartButton(),
//         ],
//       ),
//       body: AnnouncementBanner(
//         currentPath: '',
//         // currentPath: const AccountTabRoute().path,
//         child: ListView(
//           children: ListTile.divideTiles(
//             context: context,
//             tiles: [
//               const ProfileTile(),
//               const _LoginOnBehalfTile(),
//               const _SupportTile(),
//               const _AdminPoAttachment(),
//               const _SettingsTile(),
//             ],
//           ).toList(),
//         ),
//       ),
//     );
//   }
// }

// class _LoginOnBehalfTile extends StatelessWidget {
//   const _LoginOnBehalfTile({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<UserBloc, UserState>(
//       buildWhen: (previous, current) => previous.user != current.user,
//       builder: (context, state) {
//         return state.userCanLoginOnBehalf
//             ? ListTile(
//                 key: const Key('loginOnBehalfTile'),
//                 leading: const Icon(Icons.login_outlined),
//                 title: Text(
//                   'Login on behalf',
//                   locale: context.locale,
//                 ).tr(),
//                 onTap: () {
//                   context.read<ProxyLoginFormBloc>().add(
//                         const ProxyLoginFormEvent.initialized(),
//                       );
//                   showPlatformDialog(
//                     context: context,
//                     barrierDismissible: true,
//                     builder: (_) => const LoginOnBehalfDialog(),
//                   );
//                 },
//               )
//             : const SizedBox.shrink();
//       },
//     );
//   }
// }

// class _SettingsTile extends StatelessWidget {
//   const _SettingsTile({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       key: const Key('settingsTile'),
//       leading: const Icon(Icons.settings_outlined),
//       title: Text(
//         'Settings',
//         locale: context.locale,
//       ).tr(),
//       onTap: () => context.router.pushNamed('settings'),
//     );
//   }
// }

// class _SupportTile extends StatelessWidget {
//   const _SupportTile({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SalesOrgBloc, SalesOrgState>(
//       buildWhen: (previous, current) =>
//           previous.salesOrganisation.salesOrg !=
//           current.salesOrganisation.salesOrg,
//       builder: (context, state) {
//         if (!state.salesOrganisation.salesOrg.isSg) {
//           return const SizedBox.shrink();
//         }

//         return ListTile(
//           key: const Key('supportTile'),
//           leading: const Icon(Icons.chat),
//           title: Text(
//             'Support',
//             locale: context.locale,
//           ).tr(),
//           onTap: () {
//             launchUrlString(
//               'https://zuelligpharmacare.freshdesk.com/support/home',
//             );
//           },
//         );
//       },
//     );
//   }
// }

// class _AdminPoAttachment extends StatelessWidget {
//   const _AdminPoAttachment({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<UserBloc, UserState>(
//       builder: (context, state) => state.user.accessRight.adminPOAttachment
//           ? ListTile(
//               key: const Key('admin_po_attachment_tile'),
//               leading: const Icon(Icons.attach_file_outlined),
//               title: Text(
//                 'Po Attachment',
//                 locale: context.locale,
//               ).tr(),
//               onTap: () => context.router.pushNamed('admin_po_attachment'),
//             )
//           : const SizedBox.shrink(),
//     );
//   }
// }
