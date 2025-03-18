part of 'package:ezrxmobile/presentation/account/contact_us/contact_us_page.dart';

class _UsernameTextField extends StatelessWidget {
  const _UsernameTextField();

  String _initialValue({required BuildContext context}) {
    final existingName = context.read<ContactUsBloc>().state.contactUs.username;

    if (existingName.getOrDefaultValue('').isEmpty) {
      final displayFullName =
          context.read<EligibilityBloc>().state.user.fullName.displayFullName;
      context.read<ContactUsBloc>().add(
            ContactUsEvent.onUsernameChange(newValue: displayFullName),
          );

      return displayFullName;
    } else {
      return existingName.getValue();
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
          fieldKey: WidgetKeys.userNameKey,
          labelText: 'Name'.tr(),
          mandatory: true,
          initValue: _initialValue(context: context),
          validator: (_) =>
              context.read<ContactUsBloc>().state.contactUs.username.value.fold(
                    (f) => f.maybeMap(
                      empty: (_) => 'Name is required.'.tr(),
                      orElse: () => null,
                    ),
                    (_) => null,
                  ),
          isEnabled: !state.isSubmitting,
          maxLines: 1,
          keyboardType: TextInputType.text,
          onChanged: (value) => context.read<ContactUsBloc>().add(
                ContactUsEvent.onUsernameChange(
                  newValue: value,
                ),
              ),
          decoration: InputDecoration(
            hintText: 'Enter your full name'.tr(),
          ),
        );
      },
    );
  }
}
