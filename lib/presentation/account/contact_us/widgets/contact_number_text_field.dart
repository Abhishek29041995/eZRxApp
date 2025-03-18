part of 'package:ezrxmobile/presentation/account/contact_us/contact_us_page.dart';

class _ContactNumberTextField extends StatelessWidget {
  const _ContactNumberTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactUsBloc, ContactUsState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting ||
          previous.showErrorMessage != current.showErrorMessage ||
          previous.appMarket != current.appMarket,
      builder: (context, state) {
        return Column(
          key: WidgetKeys.phoneNumberKey,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: context.tr('Contact number'),
                style: Theme.of(context).textTheme.labelSmall,
                children: <TextSpan>[
                  TextSpan(
                    text: ' *',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: ZPColors.red),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            InternationalPhoneNumberInput(
              key: WidgetKeys.genericKey(key: state.appMarket.country),
              countries: [state.appMarket.country],
              onInputValidated: (bool value) {},
              autoValidateMode: state.showErrorMessage
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              ignoreBlank: false,
              onInputChanged: state.isSubmitting
                  ? null
                  : (value) {
                      if (value.phoneNumber == value.dialCode) {
                        context.read<ContactUsBloc>().add(
                              ContactUsEvent.onContactNumberChange(
                                newValue: value.phoneNumber!
                                    .replaceAll(value.dialCode ?? '', ''),
                              ),
                            );
                      } else {
                        context.read<ContactUsBloc>().add(
                              ContactUsEvent.onContactNumberChange(
                                newValue: value.phoneNumber!,
                              ),
                            );
                      }
                    },
              formatInput: false,
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.DROPDOWN,
                leadingPadding: 16,
                showFlags: true,
                setSelectorButtonAsPrefixIcon: true,
              ),
              inputDecoration: InputDecoration(
                hintText: 'Enter your phone number'.tr(),
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              ),
              validator: (_) {
                return context
                    .read<ContactUsBloc>()
                    .state
                    .contactUs
                    .contactNumber
                    .value
                    .fold(
                      (f) => f.maybeMap(
                        empty: (_) => 'Enter a valid contact number.'.tr(),
                        orElse: () => null,
                      ),
                      (_) => null,
                    );
              },
            ),
          ],
        );
      },
    );
  }
}
