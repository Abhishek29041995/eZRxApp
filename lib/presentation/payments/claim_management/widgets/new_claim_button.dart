part of 'package:ezrxmobile/presentation/payments/claim_management/claim_management_page.dart';

class _NewClaimButton extends StatelessWidget {
  const _NewClaimButton({
    required this.controller,
  });
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClaimManagementBloc, ClaimManagementState>(
      buildWhen: (previous, current) => previous.items != current.items,
      builder: (context, state) {
        return state.items.isNotEmpty
            ? ScaleButton(
                icon: Icons.add,
                key: WidgetKeys.newClaimButton,
                label: context.tr('Create new claim'),
                onPress: () {
                  context.router.push(const NewClaimSubmissionPageRoute());
                },
                scrollController: controller,
              )
            : const SizedBox.shrink();
      },
    );
  }
}
