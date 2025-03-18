part of 'package:ezrxmobile/presentation/returns/new_request/new_request_page.dart';

class _PreviousButton extends StatelessWidget with BottomsheetMixin {
  final TabController tabController;
  final int step;

  const _PreviousButton({
    required this.tabController,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return step == 1
        ? IconButton(
            key: WidgetKeys.closeButton,
            onPressed: () async {
              final confirmed = await showConfirmBottomSheet(
                context: context,
                title: 'Leave page?',
                content: 'Any unsaved information will be lost',
                confirmButtonText: 'Leave',
              );
              if (confirmed ?? false) {
                if (context.mounted) await context.router.maybePop();
              }
            },
            icon: const Icon(Icons.close),
          )
        : IconButton(
            key: WidgetKeys.backButton,
            onPressed: () {
              final step = tabController.index;
              context.read<NewRequestBloc>().add(
                    NewRequestEvent.validateStep(step: step),
                  );
              tabController.animateTo(
                step - 1,
              );
            },
            icon: const Icon(Icons.chevron_left),
          );
  }
}
