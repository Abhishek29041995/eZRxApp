import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/proxy_login/proxy_login_form_bloc.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:ezrxmobile/presentation/more/section/login_on_behalf/cancel_button.dart';
part 'package:ezrxmobile/presentation/more/section/login_on_behalf/login_button.dart';

class LoginOnBehalfSheet extends StatelessWidget {
  const LoginOnBehalfSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProxyLoginFormBloc, ProxyLoginFormState>(
      listenWhen: (previous, current) =>
          previous.authFailureOrSuccessOption !=
          current.authFailureOrSuccessOption,
      listener: (context, state) => state.authFailureOrSuccessOption.fold(
        () {},
        (either) => either.fold(
          (failure) => ErrorUtils.handleApiFailure(context, failure),
          (_) {
            context.read<SalesOrgBloc>().add(const SalesOrgEvent.initialized());
            context
                .read<EligibilityBloc>()
                .add(const EligibilityEvent.initialized());
            context.read<UserBloc>().add(
                  const UserEvent.fetch(),
                );
            context.router.popForced();
          },
        ),
      ),
      buildWhen: (previous, current) =>
          previous.showErrorMessages != current.showErrorMessages,
      builder: (context, state) {
        return Form(
          key: WidgetKeys.proxyLoginSheet,
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.tr('Log in on behalf'),
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: ZPColors.primary),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFieldWithLabel(
                  fieldKey: WidgetKeys.proxyLoginUserNameField,
                  mandatory: true,
                  labelText: context.tr('Username'),
                  isEnabled: !state.isSubmitting,
                  inputFormatters: [
                    TextInputFormatter.withFunction(
                      (oldValue, newValue) => TextEditingValue(
                        text: newValue.text.toLowerCase(),
                        selection: newValue.selection,
                      ),
                    ),
                  ],
                  onChanged: (value) => context.read<ProxyLoginFormBloc>().add(
                        ProxyLoginFormEvent.usernameChanged(value),
                      ),
                  validator: (value) => Username(value ?? '').value.fold(
                        (f) => f.maybeMap(
                          empty: (_) => context.tr('Username cannot be empty.'),
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
                  decoration: InputDecoration(
                    hintText: context.tr('Enter username'),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _CancelButton(),
                    SizedBox(
                      width: 10,
                    ),
                    _LoginButton(),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
