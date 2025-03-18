import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_step.dart';
import 'package:ezrxmobile/domain/order/entities/order_status_tracker.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class OrderHistoryStepper extends StatelessWidget {
  final List<OrderHistoryStep> steps;

  const OrderHistoryStepper({
    super.key,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 4.0, bottom: 16.0),
      itemCount: steps.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            _OrderHistoryStepWithIcon(
              customSteps: steps,
              index: index,
            ),
            _SubStatusSection(
              subSteps: steps[index].subSteps,
            ),
          ],
        );
      },
    );
  }
}

class _OrderHistoryStepWithIcon extends StatelessWidget {
  final List<OrderHistoryStep> customSteps;
  final int index;

  const _OrderHistoryStepWithIcon({
    required this.customSteps,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final step = customSteps[index];

    return Row(
      children: [
        Expanded(
          child: _DateTimeWidget(
            dateString: step.dateString,
            timeString: step.timeString,
            state: step.state,
          ),
        ),
        Expanded(
          flex: 3,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11.0),
                child: Column(
                  children: [
                    VerticalLine(
                      visible: index != 0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: step.state == OrderHistoryStepStates.inactive
                            ? ZPColors.transparent
                            : ZPColors.extraDarkGreen,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: step.state == OrderHistoryStepStates.inactive
                              ? ZPColors.lightGray
                              : ZPColors.extraDarkGreen,
                        ),
                      ),
                      child: Icon(
                        step.icon,
                        size: 16,
                        color: step.state == OrderHistoryStepStates.inactive
                            ? ZPColors.lightGray
                            : ZPColors.white,
                      ),
                    ),
                    VerticalLine(
                      visible: !(index >= (customSteps.length - 1) &&
                          step.subSteps.isEmpty),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      context.tr(step.title),
                      style: _textStyle(
                        context,
                        step.state,
                        Styles.label,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      context.tr(step.subTitle),
                      style: _textStyle(
                        context,
                        step.state,
                        Styles.subLabel,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DateTimeWidget extends StatelessWidget {
  const _DateTimeWidget({
    required this.dateString,
    required this.timeString,
    required this.state,
  });

  final String dateString;
  final String timeString;
  final OrderHistoryStepStates state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          dateString,
          style: _textStyle(
            context,
            state,
            Styles.text,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          timeString,
          style: _textStyle(
            context,
            state,
            Styles.subText,
          ),
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}

class _SubStatusSection extends StatelessWidget {
  final List<OrderStatusTracker> subSteps;

  const _SubStatusSection({
    required this.subSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: subSteps
          .map(
            (step) => Row(
              children: [
                Expanded(
                  child: _DateTimeWidget(
                    dateString: step.preformedAt.dateStringIgnoreTimezone,
                    timeString:
                        step.preformedAt.time12HoursStringIgnoreTimezone,
                    state: OrderHistoryStepStates.inactive,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22.0),
                        child: Column(
                          children: [
                            VerticalLine(),
                            Icon(
                              Icons.circle,
                              size: 12,
                              color: ZPColors.lightGray,
                            ),
                            VerticalLine(),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Text(
                          context.tr(step.action),
                          textAlign: TextAlign.start,
                          style: _textStyle(
                            context,
                            OrderHistoryStepStates.inactive,
                            Styles.subText,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}

class VerticalLine extends StatelessWidget {
  final bool visible;
  const VerticalLine({
    super.key,
    this.visible = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ZPColors.lightGray,
      width: visible ? 1.0 : 0,
      height: 24,
    );
  }
}

enum Styles {
  text,
  subText,
  label,
  subLabel,
}

TextStyle _textStyle(
  BuildContext context,
  OrderHistoryStepStates state,
  Styles style,
) {
  final color = state == OrderHistoryStepStates.inactive
      ? ZPColors.lightGray
      : ZPColors.black;
  switch (style) {
    case Styles.text:
      return Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: color,
          );
    case Styles.subText:
      return Theme.of(context).textTheme.bodySmall!.copyWith(
            color: color,
          );
    case Styles.label:
      return Theme.of(context).textTheme.labelMedium!.copyWith(
            color: color,
          );
    case Styles.subLabel:
    default:
      return Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: color,
          );
  }
}
