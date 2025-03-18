part of 'package:ezrxmobile/presentation/more/section/ezcs_tickets/submit_ticket/submit_ticket_page.dart';

class TicketPrioritySection extends StatelessWidget {
  const TicketPrioritySection({super.key});

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
            context.tr('Priority'),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: padding6),
            child: BlocBuilder<SubmitTicketBloc, SubmitTicketState>(
              buildWhen: (previous, current) =>
                  previous.ezcsTicket.ticketPriority !=
                  current.ezcsTicket.ticketPriority,
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: TicketPriority.supportedTypes
                      .map(
                        (type) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: RadioWithLabel<TicketPriority>(
                            groupValue: state.ezcsTicket.ticketPriority,
                            value: type,
                            onChanged: (value) =>
                                context.read<SubmitTicketBloc>().add(
                                      SubmitTicketEvent.selectPriority(
                                        ticketPriority: value,
                                      ),
                                    ),
                            title: context.tr(type.priorityTitle),
                            spacing: 8,
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
          ListTileTheme(
            data: const ListTileThemeData(
              titleAlignment: ListTileTitleAlignment.top,
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 0,
              horizontalTitleGap: 14,
              visualDensity: VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              iconColor: ZPColors.primary,
            ),
            child: BlocBuilder<SubmitTicketBloc, SubmitTicketState>(
              buildWhen: (previous, current) =>
                  previous.agreeToDisclaimer != current.agreeToDisclaimer ||
                  previous.showErrorMessages != current.showErrorMessages,
              builder: (context, state) {
                return Column(
                  children: [
                    CheckboxListTile(
                      key: WidgetKeys.submitTicketDisclaimerCheckbox,
                      value: state.agreeToDisclaimer,
                      isError: state.invalidAgreeToDisclaimer,
                      title: Text(
                        context.tr(
                          'I understand the Ticket Prioritization Guidelines and the ticket that I am raising will be tagged as URGENT. I agree that my ticket can be rejected or reclassified by the support teams if the assessment is incorrect.',
                        ),
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: ZPColors.neutralsDarkBlack,
                                ),
                      ),
                      onChanged: (value) =>
                          context.read<SubmitTicketBloc>().add(
                                SubmitTicketEvent.disclaimerConsent(
                                  newValue: value ?? false,
                                ),
                              ),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    if (state.invalidAgreeToDisclaimer)
                      Padding(
                        padding: const EdgeInsets.only(top: padding12),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.error,
                              size: 14,
                              color: ZPColors.priceNegative,
                            ),
                            const SizedBox(width: padding6),
                            Text(
                              context.tr(
                                'Please agree to the disclaimer before proceeding.',
                              ),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: ZPColors.priceNegative,
                                  ),
                            ),
                          ],
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
