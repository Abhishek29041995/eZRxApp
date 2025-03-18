part of 'package:ezrxmobile/presentation/returns/new_request/new_request_page.dart';

class _NextButton extends StatelessWidget {
  final bool validation;
  final TabController tabController;
  final bool nextAllowed;
  const _NextButton({
    required this.validation,
    required this.tabController,
    required this.nextAllowed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: WidgetKeys.nextButton,
      onPressed: !nextAllowed
          ? null
          : () {
              final step = tabController.index + 1;

              context.read<NewRequestBloc>().add(
                    NewRequestEvent.validateStep(step: step),
                  );

              if (validation) {
                trackMixpanelEvent(
                  TrackingEvents.newReturnRequestStep,
                  props: <String, dynamic>{
                    TrackingProps.step: step,
                    if (step == 1)
                      TrackingProps.stepName: 'Select item(s) to return',
                    if (step == 2)
                      TrackingProps.stepName: 'Fill in return details',
                  },
                );
                tabController.animateTo(
                  step,
                );
              }
            },
      child: Text(
        'Next'.tr(),
        style: const TextStyle(
          color: ZPColors.white,
        ),
      ),
    );
  }
}
