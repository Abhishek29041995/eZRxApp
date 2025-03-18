import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class ReturnOverrideInfoIcon extends StatelessWidget {
  final String header;
  final String content;
  final String subContent;

  const ReturnOverrideInfoIcon._({
    required this.header,
    required this.content,
    required this.subContent,
  });

  factory ReturnOverrideInfoIcon.quantity({
    required BuildContext context,
    required int initialQuantity,
  }) =>
      ReturnOverrideInfoIcon._(
        header: context.tr('Return quantity changed'),
        content:
            '${context.tr('Request Return quantity :')} <$initialQuantity>',
        subContent: context.tr('Approver updated the QTY'),
      );

  factory ReturnOverrideInfoIcon.price({
    required BuildContext context,
    required String price,
    required bool displaySubContent,
  }) =>
      ReturnOverrideInfoIcon._(
        header: context.tr('Return value changed'),
        content: '${context.tr('Request counter offer :')} <$price>',
        subContent:
            displaySubContent ? context.tr('Approver updated the value') : '',
      );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: WidgetKeys.returnSummaryInfoIcon(header),
      onTap: () {
        showModalBottomSheet(
          context: context,
          enableDrag: false,
          isDismissible: false,
          isScrollControlled: true,
          builder: (_) {
            return _ReturnInfoBottomSheet(
              header: header,
              content: content,
              subContent: subContent,
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
        decoration: BoxDecoration(
          color: ZPColors.nextDiscountBG,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 4.0),
              child: Icon(
                Icons.update,
                size: 14,
                color: ZPColors.nextTextBg,
              ),
            ),
            Flexible(
              child: Text(
                context.tr('Approver updated'),
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: ZPColors.nextTextBg,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReturnInfoBottomSheet extends StatelessWidget {
  final String header;
  final String content;
  final String subContent;
  const _ReturnInfoBottomSheet({
    required this.header,
    required this.content,
    required this.subContent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 60,
      ),
      child: Column(
        key: WidgetKeys.returnSummaryInfoBottomSheet,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            header,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: ZPColors.primary,
                ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ZPColors.extraLightGrey4,
                ),
          ),
          if (subContent.isNotEmpty)
            Text(
              subContent,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ZPColors.extraLightGrey4,
                  ),
            ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              context.router.maybePop();
            },
            child: Text(
              context.tr('Got it'),
            ),
          ),
        ],
      ),
    );
  }
}
