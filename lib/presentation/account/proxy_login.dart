//ignore_for_file: unused-files
//TODO: legacy file

// import 'package:auto_route/auto_route.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
// import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
// import 'package:ezrxmobile/application/account/user/user_bloc.dart';
// import 'package:ezrxmobile/application/auth/proxy_login/proxy_login_form_bloc.dart';
// import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
// import 'package:ezrxmobile/domain/utils/error_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
// import 'package:ezrxmobile/domain/auth/value/value_objects.dart';

// class LoginOnBehalfDialog extends StatelessWidget {
//   const LoginOnBehalfDialog({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ProxyLoginFormBloc, ProxyLoginFormState>(
//       buildWhen: (previous, current) =>
//           previous.isSubmitting != current.isSubmitting,
//       builder: (context, state) {
//         return BlocBuilder<ProxyLoginFormBloc, ProxyLoginFormState>(
//           builder: (context, state) {
//             return PlatformAlertDialog(
//               key: const Key('loginOnBehalfPage'),
//               title: Padding(
//                 padding: const EdgeInsets.only(bottom: 15),
//                 child: const Text('Login on behalf').tr(),
//               ),
//               content: const _LoginOnBehalfForm(),
//               actions: <Widget>[
//                 PlatformDialogAction(
//                   key: const Key('cancel'),
//                   child: const Text('Cancel').tr(),
//                   onPressed: () => context.router.pop(),
//                 ),
//                 PlatformDialogAction(
//                   key: const Key('proxyLoginSubmitButton'),
//                   onPressed: () {
//                     if (state.isSubmitting) return;
//                     FocusScope.of(context).unfocus();
//                     context.read<ProxyLoginFormBloc>().add(
//                           ProxyLoginFormEvent.loginWithADButtonPressed(
//                             context.read<EligibilityBloc>().state.user,
//                           ),
//                         );
//                   },
//                   child: const Text('Login').tr(),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }
// }

// class _LoginOnBehalfForm extends StatelessWidget {
//   const _LoginOnBehalfForm({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ProxyLoginFormBloc, ProxyLoginFormState>(
//       listenWhen: (previous, current) =>
//           previous.authFailureOrSuccessOption !=
//           current.authFailureOrSuccessOption,
//       listener: (context, state) {
//         state.authFailureOrSuccessOption.fold(
//           () {},
//           (either) => either.fold(
//             (failure) {
//               ErrorUtils.handleApiFailure(context, failure);
//               context.router.pop();
//             },
//             (_) {
//               context
//                   .read<SalesOrgBloc>()
//                   .add(const SalesOrgEvent.initialized());
//               context
//                   .read<EligibilityBloc>()
//                   .add(const EligibilityEvent.initialized());
//               context
//                   .read<MaterialListBloc>()
//                   .add(const MaterialListEvent.initialized());
//               context.read<UserBloc>().add(const UserEvent.fetch());
//               context.router.pop();
//             },
//           ),
//         );
//       },
//       buildWhen: (previous, current) =>
//           previous.showErrorMessages != current.showErrorMessages,
//       builder: (context, state) {
//         return Form(
//           autovalidateMode: state.showErrorMessages
//               ? AutovalidateMode.always
//               : AutovalidateMode.disabled,
//           child: Material(
//             color: Colors.transparent,
//             child: TextFormField(
//               key: const Key('proxyLoginUsernameField'),
//               keyboardType: TextInputType.emailAddress,
//               autocorrect: false,
//               decoration: InputDecoration(labelText: 'Username'.tr()),
//               onChanged: (value) => context.read<ProxyLoginFormBloc>().add(
//                     ProxyLoginFormEvent.usernameChanged(value),
//                   ),
//               validator: (text) => Username(text ?? '').value.fold(
//                     (f) => f.maybeMap(
//                       empty: (_) => 'Username cannot be empty.'.tr(),
//                       orElse: () => null,
//                     ),
//                     (_) => null,
//                   ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
