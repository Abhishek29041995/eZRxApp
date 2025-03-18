//ignore_for_file: unused-code
//ignore_for_file: unused-class
//ignore_for_file: unused-files
import 'package:flutter/material.dart';

class CustomSmallButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomSmallButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        visualDensity: VisualDensity.compact,
        minimumSize: Size.zero,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style:
            Theme.of(context).textTheme.titleSmall?.apply(color: Colors.white),
      ),
    );
  }
}
