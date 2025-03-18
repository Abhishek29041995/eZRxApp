import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_info_details.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class AnnouncementManufactureSource extends StatelessWidget {
  const AnnouncementManufactureSource({super.key, required this.details});

  final AnnouncementInfoDetails details;

  @override
  Widget build(BuildContext context) {
    final displayDetails = [
      if (details.manufacturer.isNotEmpty)
        context.tr(
          'By {by}',
          namedArgs: {
            'by': details.manufacturer,
          },
        ),
      if (details.source.isNotEmpty)
        context.tr(
          'Sourced by {source}',
          namedArgs: {
            'source': details.source,
          },
        ),
    ];

    if (displayDetails.isEmpty) return const SizedBox();

    return FittedBox(
      child: RichText(
        text: TextSpan(
          text: displayDetails.join(' | '),
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            color: ZPColors.neutralsGrey1,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
