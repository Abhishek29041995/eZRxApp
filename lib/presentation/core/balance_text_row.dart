import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class BalanceTextRow extends StatelessWidget {
  final String keyText;
  final String valueText;
  final int keyFlex;
  final int valueFlex;
  final bool valueTextLoading;
  final bool isStatus;
  final TextStyle? keyTextStyle;
  final TextStyle? valueTextStyle;
  final Color statusTextColor;
  final EdgeInsetsGeometry padding;

  const BalanceTextRow({
    super.key,
    required this.keyText,
    required this.valueText,
    this.keyFlex = 1,
    this.valueFlex = 2,
    this.valueTextLoading = false,
    this.isStatus = false,
    this.keyTextStyle,
    this.valueTextStyle,
    this.padding = const EdgeInsets.symmetric(
      vertical: 2.0,
    ),
    this.statusTextColor = ZPColors.black,
  });

  @override
  Widget build(BuildContext context) {
    final keyStyle = keyTextStyle ??
        Theme.of(context).textTheme.titleSmall?.copyWith(
              color: ZPColors.darkGray,
            );
    final valueStyle = valueTextStyle ??
        Theme.of(context).textTheme.titleSmall?.copyWith(
              color: ZPColors.black,
            );

    return Padding(
      key: WidgetKeys.balanceTextRow(keyText, valueText),
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: keyFlex,
            child: Text(
              isStatus ? keyText : '$keyText: ',
              style: keyStyle,
            ),
          ),
          isStatus
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: StatusLabel(
                        status: StatusType(valueText),
                        valueColor: statusTextColor,
                      ),
                    ),
                  ],
                )
              : Expanded(
                  flex: valueFlex,
                  child: valueTextLoading
                      ? SizedBox(
                          width: 40,
                          child: LoadingShimmer.tile(),
                        )
                      : Text(
                          valueText,
                          style: valueStyle,
                        ),
                ),
        ],
      ),
    );
  }
}
