part of 'package:ezrxmobile/presentation/returns/new_request/new_request_success/new_request_successful_page.dart';

class _AdditionInfoSummary extends StatelessWidget {
  const _AdditionInfoSummary();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      color: ZPColors.primary,
      width: double.infinity,
      child: BlocBuilder<NewRequestBloc, NewRequestState>(
        buildWhen: (previous, current) =>
            previous.returnReference != current.returnReference ||
            previous.returnRequestId != current.returnRequestId ||
            previous.specialInstructions != current.specialInstructions,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: '${context.tr('Return')} ',
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: ZPColors.white,
                                ),
                        children: [
                          TextSpan(
                            text: '#${state.returnRequestId}',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: ZPColors.white,
                                ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.read<ReturnDetailsByRequestBloc>().add(
                                      ReturnDetailsByRequestEvent.fetch(
                                        returnId: state.returnRequestId,
                                      ),
                                    );
                                context.router.push(
                                  const ReturnRequestDetailsRoute(),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  StatusLabel(
                    status: StatusType('Pending review'),
                    valueColor: ZPColors.neutralsBlack,
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              BalanceTextRow(
                keyText: 'Request date'.tr(),
                keyFlex: 3,
                valueFlex: 4,
                valueText: DateTimeStringValue(
                  DateFormat('yyyy-MM-dd').format(DateTime.now()),
                ).dateString,
                keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.accentColor,
                    ),
                valueTextStyle:
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.white,
                        ),
              ),
              BalanceTextRow(
                keyText: 'Return reference'.tr(),
                keyFlex: 3,
                valueFlex: 4,
                valueText: state.returnReference,
                keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.accentColor,
                    ),
                valueTextStyle:
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.white,
                        ),
              ),
              BalanceTextRow(
                keyText: 'Special instructions'.tr(),
                keyFlex: 3,
                valueFlex: 4,
                valueText: state.specialInstructions,
                keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.accentColor,
                    ),
                valueTextStyle:
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.white,
                        ),
              ),
            ],
          );
        },
      ),
    );
  }
}
