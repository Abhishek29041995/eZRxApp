import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';

class RadioWithLabel<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final Function(T value) onChanged;
  final String title;
  final double spacing;

  const RadioWithLabel({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    this.spacing = 3,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged.call(value),
      child: Padding(
        padding:
            const EdgeInsets.all(3).subtract(const EdgeInsets.only(left: 1)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: padding24,
              width: padding24,
              child: Radio<T>(
                value: value,
                groupValue: groupValue,
                onChanged: null,
              ),
            ),
            SizedBox(width: spacing),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
