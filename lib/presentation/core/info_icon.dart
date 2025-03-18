import 'package:flutter/material.dart';

class InfoIcon extends StatelessWidget {
  final VoidCallback onTap;
  final Color? iconColor;

  const InfoIcon({
    super.key,
    required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Icon(Icons.info, size: 16, color: iconColor),
        ),
      ),
    );
  }
}
