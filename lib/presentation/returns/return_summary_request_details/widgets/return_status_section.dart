import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';

class ReturnStatusSection extends StatelessWidget {
  final List<CustomStep> customStep;
  final String title;

  const ReturnStatusSection({
    super.key,
    required this.customStep,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            contentPadding:
                const EdgeInsets.fromLTRB(padding12, padding12, 0, 0),
            title: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: ZPColors.primary),
            ),
          ),
          _CustomStatusStepper(
            customStep: customStep,
          ),
          const _CloseButton(),
        ],
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(padding12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.maxFinite, 55),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(
          context.tr('Close'),
          style: const TextStyle(color: ZPColors.white),
        ),
      ),
    );
  }
}

class _CustomStatusStepper extends StatelessWidget {
  final List<CustomStep> customStep;

  const _CustomStatusStepper({
    required this.customStep,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding12),
      child: Column(
        children: customStep
            .mapIndexed(
              (index, e) => _CustomStepWithIcon(
                customStep: customStep,
                index: index,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _CustomStepWithIcon extends StatelessWidget {
  final List<CustomStep> customStep;
  final int index;

  const _CustomStepWithIcon({
    required this.customStep,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///TODO: will implement after datetime is availbale in the api
        // Column(
        //     crossAxisAlignment: CrossAxisAlignment.end,
        //     children: [
        //       Text(
        //         customStep[index].title,
        //         style: _titleStyle(context, customStep[index]),
        //       ),
        //       Text(
        //         customStep[index].subtitle,
        //         style: _subTitleStyle(context, customStep[index]),
        //       ),
        //     ],
        //   ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding12),
          child: Column(
            children: [
              Container(
                color: ZPColors.lightGray,
                width: index == 0 ? 0 : 1,
                height: padding24,
              ),
              Container(
                padding: const EdgeInsets.all(padding6),
                decoration: BoxDecoration(
                  color: index != 0
                      ? ZPColors.transparent
                      : ZPColors.extraDarkGreen,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: index != 0
                        ? ZPColors.lightGray
                        : ZPColors.extraDarkGreen,
                  ),
                ),
                child: Icon(
                  customStep[index].icon,
                  size: 16,
                  color: index != 0 ? ZPColors.lightGray : ZPColors.white,
                ),
              ),
              Container(
                color: ZPColors.lightGray,
                width: index >= (customStep.length - 1) ? 0.0 : 1.0,
                height: padding24,
              ),
            ],
          ),
        ),
        Expanded(
          child: Text(
            customStep[index].status,
            style: _titleStyle(context, index),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}

class CustomStep {
  const CustomStep({
    required this.title,
    required this.subtitle,
    required this.status,
    required this.icon,
  });

  final String title;

  final String subtitle;
  final IconData icon;

  final String status;
}

TextStyle _titleStyle(BuildContext context, int index) {
  switch (index) {
    case 0:
      return Theme.of(context)
          .textTheme
          .labelMedium!
          .copyWith(color: ZPColors.black);
    default:
      return Theme.of(context).textTheme.labelMedium!.copyWith(
            color: ZPColors.lightGray,
          );
  }
}
