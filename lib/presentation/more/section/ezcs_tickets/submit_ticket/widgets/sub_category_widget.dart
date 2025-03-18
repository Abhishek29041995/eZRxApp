part of 'package:ezrxmobile/presentation/more/section/ezcs_tickets/submit_ticket/submit_ticket_page.dart';

class SubCategoryWidget extends StatelessWidget {
  const SubCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: BlocBuilder<SubmitTicketBloc, SubmitTicketState>(
        buildWhen: (previous, current) =>
            previous.ezcsTicket.customerTicketSubCategory !=
            current.ezcsTicket.customerTicketSubCategory,
        builder: (context, state) {
          return DropdownButtonFormField2<CustomerTicketSubCategoryType>(
            key: WidgetKeys.submitTicketSubCategoryDropdown,
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.fromLTRB(0, padding6, padding6, padding6),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.keyboard_arrow_down_outlined,
                size: 16,
                color: ZPColors.black,
              ),
            ),
            items: CustomerTicketSubCategoryType.supportedTypes
                .map(
                  (e) => DropdownMenuItem<CustomerTicketSubCategoryType>(
                    key: WidgetKeys.genericKey(
                      key: 'sub_category_${e.customerTicketSubCategoryTitle}',
                    ),
                    value: e,
                    child: Text(
                      context.tr(e.customerTicketSubCategoryTitle),
                      style: Theme.of(context).textTheme.titleSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
                .toList(),
            value: state.ezcsTicket.customerTicketSubCategory,
            onChanged: (value) => context.read<SubmitTicketBloc>().add(
                  SubmitTicketEvent.selectTicketSubCategoryType(
                    customerTicketSubCategoryType: value ??
                        CustomerTicketSubCategoryType.accountOpeningCreation(),
                  ),
                ),
          );
        },
      ),
    );
  }
}
