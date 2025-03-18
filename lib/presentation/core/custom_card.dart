import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final bool showShadow;
  final bool showBorder;
  final double? width;
  final double? height;
  final Clip clipBehavior;
  final Color backgroundColor;
  final Color borderColor;

  const CustomCard({
    super.key,
    required this.child,
    this.margin = const EdgeInsets.only(bottom: 12.0),
    this.padding = const EdgeInsets.only(bottom: 0.0),
    this.showShadow = true,
    this.showBorder = false,
    this.width,
    this.height,
    this.clipBehavior = Clip.none,
    this.backgroundColor = ZPColors.whiteBgCard,
    this.borderColor = ZPColors.boxShadowGray,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      width: width,
      height: height,
      clipBehavior: clipBehavior,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: showBorder ? Border.all(color: borderColor, width: 1.5) : null,
        boxShadow: showShadow
            ? [
                BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 2,
                  color: borderColor,
                ),
              ]
            : null,
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
