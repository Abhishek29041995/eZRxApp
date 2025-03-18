part of 'package:ezrxmobile/presentation/more/section/ezcs_tickets/submit_ticket/submit_ticket_page.dart';

class CustomerTicketTypeSection extends StatelessWidget {
  const CustomerTicketTypeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(padding12),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr('Customer Ticket Type'),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: padding6),
          BlocBuilder<SubmitTicketBloc, SubmitTicketState>(
            buildWhen: (previous, current) =>
                previous.ezcsTicket.customerTicketType !=
                current.ezcsTicket.customerTicketType,
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...CustomerTicketType.supportedTypes.map(
                    (type) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RadioWithLabel<CustomerTicketType>(
                            groupValue: state.ezcsTicket.customerTicketType,
                            value: type,
                            onChanged: (value) =>
                                context.read<SubmitTicketBloc>().add(
                                      SubmitTicketEvent.selectTicketType(
                                        customerTicketType: value,
                                      ),
                                    ),
                            title: context.tr(type.customerTicketTitle),
                            spacing: 8,
                          ),
                          if (state.ezcsTicket.customerTicketType
                                  .isCreditCustomerAccount &&
                              type.isCreditCustomerAccount)
                            const SubCategoryWidget(),
                          if (state.ezcsTicket.customerTicketType
                                  .isOrderRelated &&
                              type.isOrderRelated)
                            const OrderRelatedInformationWidget(),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
