import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      buildWhen: (previous, current) =>
          previous.passwordVisible != current.passwordVisible ||
          previous.isSubmitting != current.isSubmitting ||
          previous.showErrorMessages != current.showErrorMessages,
      builder: (context, state) {
        return TextFieldWithLabel(
          fieldKey: WidgetKeys.loginUsernameField,
          initValue: state.username.getOrDefaultValue(''),
          labelText: context.tr('Username'),
          mandatory: true,
          decoration: InputDecoration(
            hintText: context.tr('Enter username'),
          ),
          inputFormatters: [
            TextInputFormatter.withFunction(
              (oldValue, newValue) => TextEditingValue(
                text: newValue.text.toLowerCase(),
                selection: newValue.selection,
              ),
            ),
          ],
          validator: (text) => Username(text ?? '').value.fold(
                (f) => f.maybeMap(
                  empty: (_) => 'Username cannot be empty.'.tr(),
                  orElse: () => null,
                ),
                (_) => null,
              ),
          onChanged: (value) => context.read<LoginFormBloc>().add(
                LoginFormEvent.usernameChanged(value),
              ),
          isEnabled: !state.isSubmitting,
        );
      },
    );
  }
}
