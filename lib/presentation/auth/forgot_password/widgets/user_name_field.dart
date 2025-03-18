part of 'package:ezrxmobile/presentation/auth/forgot_password/forgot_password_page.dart';

class _UsernameField extends StatelessWidget {
  final TextEditingController controller;

  const _UsernameField({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      buildWhen: (previous, current) =>
          previous.showErrorMessages != current.showErrorMessages,
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: TextFieldWithLabel(
            fieldKey: WidgetKeys.forgotUsernameField,
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
            controller: controller,
            validator: (text) => Username(text ?? '').value.fold(
                  (f) => f.mapOrNull(
                    empty: (_) => context.tr('Username cannot be empty.'),
                  ),
                  (_) => null,
                ),
            onChanged: (value) => context.read<ForgotPasswordBloc>().add(
                  ForgotPasswordEvent.usernameChanged(value),
                ),
            isEnabled: !state.isSubmitting,
          ),
        );
      },
    );
  }
}
