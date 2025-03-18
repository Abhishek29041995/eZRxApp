part of 'package:ezrxmobile/presentation/more/section/ezcs_tickets/submit_ticket/submit_ticket_page.dart';

class YourDetailSection extends StatelessWidget {
  const YourDetailSection({super.key});

  @override
  Widget build(BuildContext context) {
    final eligibilityBloc = context.read<EligibilityBloc>();

    return CustomCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(padding12),
      child: Column(
        children: [
          custom.ExpansionTile(
            threeLineTitle: true,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            iconColor: ZPColors.neutralsDarkBlack,
            title: Text(
              context.tr('Your detail'),
              style: Theme.of(context).textTheme.labelMedium,
            ),
            children: [
              Row(
                children: [
                  Expanded(
                    child: _DetailInformation(
                      title: 'User Role',
                      value: context.tr(
                        eligibilityBloc.state.user.role.type.submitTicketRole,
                      ),
                    ),
                  ),
                  const SizedBox(width: padding12),
                  Expanded(
                    child: _DetailInformation(
                      title: 'Requester',
                      value: eligibilityBloc.state.user.email
                          .getOrDefaultValue(''),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: padding12),
                child: _DetailInformation(
                  title: 'Requester name',
                  value:
                      eligibilityBloc.state.user.username.getOrDefaultValue(''),
                ),
              ),
            ],
          ),
          const Divider(
            color: ZPColors.lightGrey,
            indent: 0,
            endIndent: 0,
          ),
          const SizedBox(height: padding12),
          AddressInfoSection.noAction(
            customerNameTextColor: ZPColors.primary,
          ),
        ],
      ),
    );
  }
}

class _DetailInformation extends StatelessWidget {
  final String title;
  final String value;
  const _DetailInformation({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr(title),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ZPColors.neutralsGrey1,
                fontWeight: FontWeight.w500,
              ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: ZPColors.neutralsDarkBlack,
              ),
        ),
      ],
    );
  }
}
