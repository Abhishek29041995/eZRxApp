part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_details_tab/return_details_tab.dart';

class _CommentsField extends StatefulWidget {
  const _CommentsField({
    required this.uuid,
  });

  final String uuid;

  @override
  State<_CommentsField> createState() => _CommentsFieldState();
}

class _CommentsFieldState extends State<_CommentsField> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(
      text: context
          .read<NewRequestBloc>()
          .state
          .getReturnItemDetails(widget.uuid)
          .remarks
          .getOrDefaultValue(''),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewRequestBloc, NewRequestState>(
      buildWhen: (previous, current) =>
          previous.getReturnItemDetails(widget.uuid).remarks !=
          current.getReturnItemDetails(widget.uuid).remarks,
      builder: (context, state) {
        return Focus(
          onFocusChange: (value) => value
              ? null
              : _controller.text = state
                  .getReturnItemDetails(widget.uuid)
                  .remarks
                  .getOrDefaultValue(''),
          child: TextFieldWithLabel(
            controller: _controller,
            fieldKey: WidgetKeys.returnCommentField(widget.uuid),
            labelText: context.tr('Comments'),
            onChanged: (value) => context.read<NewRequestBloc>().add(
                  NewRequestEvent.additionInfoChanged(
                    additionInfo: context
                        .read<NewRequestBloc>()
                        .state
                        .getReturnItemDetails(widget.uuid)
                        .copyWith(
                          remarks: Remarks(value),
                        ),
                  ),
                ),
            maxLength: 200,
            decoration: InputDecoration(
              hintText: context.tr('Max. 200 characters (Optional)'),
            ),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.deny(ZPRegexes.specialCharacters),
            ],
            isEnabled: true,
          ),
        );
      },
    );
  }
}
