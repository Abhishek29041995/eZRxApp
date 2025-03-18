import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:flutter/material.dart';

class Announcement extends StatelessWidget {
  const Announcement({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: AnnouncementWidget(
            currentPath: context.router.currentPath,
          ),
        ),
      ),
    );
  }
}
