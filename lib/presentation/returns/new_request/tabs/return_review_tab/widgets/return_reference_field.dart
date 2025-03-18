part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_review_tab/return_review_tab.dart';

class _ReturnReferenceField extends StatelessWidget {
  const _ReturnReferenceField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewRequestBloc, NewRequestState>(
      buildWhen: (previous, current) =>
          previous.returnReference != current.returnReference,
      builder: (context, state) {
        return TextFieldWithLabel(
          initValue: state.returnReference,
          fieldKey: WidgetKeys.returnReferenceField,
          labelText: context.tr('Return reference (optional)'),
          onChanged: (value) => context.read<NewRequestBloc>().add(
                NewRequestEvent.returnReferenceChanged(value),
              ),
          decoration:
              InputDecoration(hintText: context.tr('Enter return reference')),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.deny(ZPRegexes.hyperlinkRegExp),
          ],
          isEnabled: true,
          maxLength: 35,
        );
      },
    );
  }
}
