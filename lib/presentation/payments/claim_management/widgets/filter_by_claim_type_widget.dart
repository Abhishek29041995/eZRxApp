part of 'package:ezrxmobile/presentation/payments/claim_management/claim_management_page.dart';

class _FilterByClaimType extends StatelessWidget {
  const _FilterByClaimType();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClaimManagementFilterBloc, ClaimManagementFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.claimTypes != current.filter.claimTypes,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.tr('Claim type'),
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
            const SizedBox(height: 4),
            ...ClaimType.supportClaimTypes.map((ClaimType claimType) {
              final value = state.filter.claimTypes.contains(claimType);

              return CheckboxListTile(
                key: WidgetKeys.genericKey(
                  key: claimType.data,
                ),
                contentPadding: const EdgeInsets.only(top: 4),
                title: Text(
                  context.tr(claimType.title),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                controlAffinity: ListTileControlAffinity.leading,
                dense: true,
                visualDensity: VisualDensity.compact,
                onChanged: (bool? value) {
                  context.read<ClaimManagementFilterBloc>().add(
                        ClaimManagementFilterEvent.claimTypeChange(
                          claimType: claimType,
                          selected: value ?? false,
                        ),
                      );
                },
                value: value,
              );
            }),
          ],
        );
      },
    );
  }
}
