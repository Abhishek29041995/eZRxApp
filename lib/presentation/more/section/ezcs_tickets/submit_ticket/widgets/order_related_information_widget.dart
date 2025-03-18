part of 'package:ezrxmobile/presentation/more/section/ezcs_tickets/submit_ticket/submit_ticket_page.dart';

class OrderRelatedInformationWidget extends StatelessWidget {
  const OrderRelatedInformationWidget({super.key});

  void _onTextFieldChanged(
    BuildContext context, {
    required SubmitTicketLabel label,
    required String value,
  }) {
    context.read<SubmitTicketBloc>().add(
          SubmitTicketEvent.onTextChange(
            label: label,
            newValue: value,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final ezcsTicket = context.read<SubmitTicketBloc>().state.ezcsTicket;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: padding12),
          child: BlocBuilder<SubmitTicketBloc, SubmitTicketState>(
            buildWhen: (previous, current) =>
                previous.showErrorMessages != current.showErrorMessages,
            builder: (context, state) {
              return Form(
                autovalidateMode: state.showErrorMessages
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: TextFieldWithLabel(
                  fieldKey: WidgetKeys.submitTicketOrderNumberTextField,
                  initValue: ezcsTicket.orderNumber,
                  mandatory: true,
                  labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: ZPColors.neutralsGrey1,
                      ),
                  labelText:
                      context.tr('Order Number / Invoice Number / RCN Number'),
                  validator: (text) => StringValue(text ?? '').value.fold(
                        (f) => f.maybeMap(
                          empty: (_) => context.tr('This field is required'),
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
                  onChanged: (value) => _onTextFieldChanged(
                    context,
                    label: SubmitTicketLabel.orderNumber,
                    value: value,
                  ),
                  maxLength: 255,
                  decoration: InputDecoration(
                    hintText: context.tr('Type any one number'),
                    hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.lightGray,
                        ),
                    counterText: '',
                  ),
                  onDone: (value) => _onTextFieldChanged(
                    context,
                    label: SubmitTicketLabel.orderNumber,
                    value: value,
                  ),
                ),
              );
            },
          ),
        ),
        TextFieldWithLabel(
          fieldKey: WidgetKeys.submitTicketProductNameTextField,
          initValue: ezcsTicket.productName,
          labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: ZPColors.neutralsGrey1,
              ),
          labelText: context.tr('Product Name'),
          onChanged: (value) => _onTextFieldChanged(
            context,
            label: SubmitTicketLabel.productName,
            value: value,
          ),
          decoration: InputDecoration(
            hintText: context.tr('Type product name'),
            hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.lightGray,
                ),
            counterText: '',
          ),
          maxLength: 255,
          onDone: (value) => _onTextFieldChanged(
            context,
            label: SubmitTicketLabel.productName,
            value: value,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: padding12),
          child: TextFieldWithLabel(
            fieldKey: WidgetKeys.submitTicketProductSKUTextField,
            initValue: ezcsTicket.productSkuCode,
            labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: ZPColors.neutralsGrey1,
                ),
            labelText: context.tr('Product SKU Code'),
            onChanged: (value) => _onTextFieldChanged(
              context,
              label: SubmitTicketLabel.productSkuCode,
              value: value,
            ),
            maxLength: 255,
            decoration: InputDecoration(
              hintText: context.tr('Type product code'),
              hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.lightGray,
                  ),
              counterText: '',
            ),
            onDone: (value) => _onTextFieldChanged(
              context,
              label: SubmitTicketLabel.productSkuCode,
              value: value,
            ),
          ),
        ),
        TextFieldWithLabel(
          fieldKey: WidgetKeys.submitTicketQuantityOrderedTextField,
          initValue: ezcsTicket.quantityOrdered,
          keyboardType: TextInputType.number,
          labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: ZPColors.neutralsGrey1,
              ),
          labelText: context.tr('Quantity Ordered'),
          onChanged: (value) => _onTextFieldChanged(
            context,
            label: SubmitTicketLabel.quantityOrdered,
            value: value,
          ),
          maxLength: 32,
          decoration: InputDecoration(
            hintText: context.tr('Type quanity'),
            hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.lightGray,
                ),
            counterText: '',
          ),
          onDone: (value) => _onTextFieldChanged(
            context,
            label: SubmitTicketLabel.quantityOrdered,
            value: value,
          ),
        ),
      ],
    );
  }
}
