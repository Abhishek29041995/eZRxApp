import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class InfoBottomSheet extends StatelessWidget {
  final String title;
  final String description;
  final String buttonTitle;

  const InfoBottomSheet({
    super.key,
    required this.title,
    required this.description,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: ZPColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ZPColors.neutralsGrey1,
                  ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                key: WidgetKeys.closeButton,
                onPressed: () => Navigator.of(context).pop(),
                child: Text(buttonTitle),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
