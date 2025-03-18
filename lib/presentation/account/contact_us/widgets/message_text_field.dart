part of 'package:ezrxmobile/presentation/account/contact_us/contact_us_page.dart';

class _MessageTextField extends StatelessWidget {
  const _MessageTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactUsBloc, ContactUsState>(
      buildWhen: (previous, current) =>
          previous.showErrorMessage != current.showErrorMessage ||
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return TextFieldWithLabel(
          fieldKey: WidgetKeys.contactMessageKey,
          labelText: 'Message'.tr(),
          mandatory: true,
          validator: (_) =>
              context.read<ContactUsBloc>().state.contactUs.message.value.fold(
                    (f) => f.maybeMap(
                      empty: (_) => 'Message is required.'.tr(),
                      orElse: () => null,
                    ),
                    (_) => null,
                  ),
          isEnabled: !state.isSubmitting,
          maxLines: 6,
          keyboardType: TextInputType.multiline,
          onChanged: (value) => context.read<ContactUsBloc>().add(
                ContactUsEvent.onMessageChange(
                  newValue: value,
                ),
              ),
          decoration: InputDecoration(
            hintText: 'How can we help?'.tr(),
          ),
        );
      },
    );
  }
}
