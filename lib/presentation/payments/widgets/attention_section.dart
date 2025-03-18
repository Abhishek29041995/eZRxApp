
import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class AttentionSection extends StatefulWidget {
  const AttentionSection({
    super.key,
    required this.widgetKey,
    required this.visible,
    required this.createdTime,
    required this.onCountdownComplete,
  });

  final Key widgetKey;
  final bool visible;
  final DateTimeStringValue createdTime;
  final VoidCallback onCountdownComplete;

  @override
  AttentionSectionState createState() => AttentionSectionState();
}

class AttentionSectionState extends State<AttentionSection> {
  Timer? _timer;
  late DateTimeStringValue threeDaysAfter;
  int currentRemainingDays = 0;
  int currentRemainingHours = 0;
  int currentRemainingMinutes = 0;
  int currentRemainingSeconds = 0;

  void setValue(Duration remainingTime) {
    currentRemainingDays = remainingTime.inDays;
    currentRemainingHours = remainingTime.inHours.remainder(24);
    currentRemainingMinutes = remainingTime.inMinutes.remainder(60);
    currentRemainingSeconds = remainingTime.inSeconds.remainder(60);
  }

  @override
  void initState() {
    super.initState();
    threeDaysAfter = widget.createdTime.threeDaysAfter;
    final now = DateTime.now();
    const interval = Duration(seconds: 1);
    var remainingTime = threeDaysAfter.dateTime.difference(now);
    if (!remainingTime.isNegative) {
      setValue(remainingTime);
      _timer = Timer.periodic(interval, (_) {
        if (!remainingTime.isNegative) {
          remainingTime = remainingTime - interval;
          setState(() {
            setValue(remainingTime);
          });
        } else {
          _timer?.cancel();
          widget.onCountdownComplete();
        }
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.visible
        ? CustomCard(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.all(16),
            backgroundColor: ZPColors.priceWarning,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.tr('Please complete payment before'),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: ZPColors.primary,
                        height: 1.6,
                      ),
                ),
                Text(
                  threeDaysAfter.fullDateTimeWithTimeZone,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: ZPColors.primary,
                      ),
                ),
                Text(
                  '${context.tr('or payment will be cancelled')}.',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: ZPColors.primary,
                        height: 1.6,
                      ),
                ),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style.copyWith(
                          height: 1.6,
                        ),
                    children: [
                      TextSpan(
                        text: currentRemainingDays.toString(),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextSpan(
                        text: ' ${context.tr('Days')} ',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextSpan(
                        text: currentRemainingHours.toString(),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextSpan(
                        text: ' ${context.tr('Hours')} ',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextSpan(
                        text: currentRemainingMinutes.toString(),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextSpan(
                        text: ' ${context.tr('Minutes')} ',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextSpan(
                        text: currentRemainingSeconds.toString(),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextSpan(
                        text: ' ${context.tr('Seconds remaining')}.',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}
