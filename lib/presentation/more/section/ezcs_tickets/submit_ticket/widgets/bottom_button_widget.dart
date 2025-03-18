part of 'package:ezrxmobile/presentation/more/section/ezcs_tickets/submit_ticket/submit_ticket_page.dart';

class BottomButtonWidget extends StatelessWidget {
  final VoidCallback onPressedCancel;
  const BottomButtonWidget({required this.onPressedCancel, super.key});

  void _showSubmitedSnackbar(BuildContext context) => CustomSnackBar(
        messageText: context.tr('Ticket Submitted'),
      ).show(context);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: padding12),
        decoration: const BoxDecoration(
          color: ZPColors.white,
          border: Border(
            top: BorderSide(
              color: ZPColors.lightGrey,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: onPressedCancel,
                child: Text(
                  context.tr('Cancel'),
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            BlocConsumer<SubmitTicketBloc, SubmitTicketState>(
              listenWhen: (previous, current) =>
                  previous.isLoading != current.isLoading && !current.isLoading,
              listener: (BuildContext context, SubmitTicketState state) {
                state.failureOrSuccessOption.fold(
                  () {
                    final isEnableEzcsListing = context
                        .read<EligibilityBloc>()
                        .state
                        .salesOrgConfigs
                        .showEZCSTickets;

                    if (isEnableEzcsListing) {
                      //TODO(Hob): Implement Ezcs listing navigation later
                      context.router.maybePop().then(
                            (value) => _showSubmitedSnackbar(context),
                          );
                    } else {
                      context.router.popUntilRouteWithName(
                        HomeNavigationTabbarRoute.name,
                      );
                      _showSubmitedSnackbar(context);
                    }
                  },
                  (either) => either.fold(
                    (failure) {
                      ErrorUtils.handleApiFailure(context, failure);
                    },
                    (_) {},
                  ),
                );
              },
              buildWhen: (previous, current) =>
                  previous.isLoading != current.isLoading ||
                  previous.enableSubmit != current.enableSubmit,
              builder: (context, state) {
                return Expanded(
                  child: ElevatedButton(
                    onPressed: state.enableSubmit
                        ? () => context.read<SubmitTicketBloc>().add(
                              const SubmitTicketEvent.validateForm(),
                            )
                        : null,
                    child: LoadingShimmer.withChild(
                      enabled: state.isLoading,
                      child: Text(
                        context.tr('Submit'),
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: ZPColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
