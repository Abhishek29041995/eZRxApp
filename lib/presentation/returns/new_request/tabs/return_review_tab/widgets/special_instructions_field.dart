part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_review_tab/return_review_tab.dart';

class SpecialInstructionsField extends StatelessWidget {
  const SpecialInstructionsField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewRequestBloc, NewRequestState>(
      buildWhen: (previous, current) =>
          previous.specialInstructions != current.specialInstructions,
      builder: (context, state) {
        return TextFieldWithLabel(
          initValue: state.specialInstructions,
          fieldKey: WidgetKeys.specialInstructionsField,
          labelText: context.tr('Special instructions (optional)'),
          onChanged: (value) => context.read<NewRequestBloc>().add(
                NewRequestEvent.specialInstructionsChanged(value),
              ),
          decoration:
              InputDecoration(hintText: context.tr('Max. 128 characters')),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.deny(ZPRegexes.hyperlinkRegExp),
          ],
          isEnabled: true,
          maxLength: 128,
        );
      },
    );
  }
}
