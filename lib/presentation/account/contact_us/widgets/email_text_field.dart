part of 'package:ezrxmobile/presentation/account/contact_us/contact_us_page.dart';

class _EmailTextField extends StatelessWidget {
  const _EmailTextField();

  String _initialValue({required BuildContext context}) {
    final existingEmail = context.read<ContactUsBloc>().state.contactUs.email;
    if (existingEmail.getOrDefaultValue('').isEmpty) {
      final displayEmail = context
          .read<EligibilityBloc>()
          .state
          .user
          .email
          .getOrDefaultValue('');
      context.read<ContactUsBloc>().add(
            ContactUsEvent.onEmailChange(newValue: displayEmail),
          );

      return displayEmail;
    } else {
      return existingEmail.getValue();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactUsBloc, ContactUsState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting ||
          previous.showErrorMessage != current.showErrorMessage,
      builder: (context, state) {
        return TextFieldWithLabel(
          fieldKey: WidgetKeys.emailKey,
          labelText: 'Email Address'.tr(),
          mandatory: true,
          initValue: _initialValue(context: context),
          validator: (_) =>
              context.read<ContactUsBloc>().state.contactUs.email.value.fold(
                    (f) => f.maybeMap(
                      empty: (_) => 'Email is required.'.tr(),
                      invalidEmail: (_) => 'Enter a valid email address.'.tr(),
                      orElse: () => null,
                    ),
                    (_) => null,
                  ),
          isEnabled: !state.isSubmitting,
          maxLines: 1,
          keyboardType: TextInputType.text,
          onChanged: (value) => context.read<ContactUsBloc>().add(
                ContactUsEvent.onEmailChange(
                  newValue: value,
                ),
              ),
          decoration: InputDecoration(
            hintText: 'Enter your E-mail'.tr(),
          ),
        );
      },
    );
  }
}
