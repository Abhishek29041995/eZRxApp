part of 'package:ezrxmobile/presentation/products/bundle_details/bundle_detail_page.dart';

class _OutlineText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int maxLines;
  final TextOverflow overflow;
  const _OutlineText(
    this.text, {
    super.key,
    this.style,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = style ?? Theme.of(context).textTheme.titleSmall;
    final outlineTextStyle = textStyle?.copyWith(
      foreground: Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = ZPColors.white,
    );

    return Stack(
      children: <Widget>[
        Text(
          text,
          style: outlineTextStyle,
          maxLines: maxLines,
          overflow: overflow,
        ),
        Text(
          text,
          style: textStyle,
          maxLines: maxLines,
          overflow: overflow,
        ),
      ],
    );
  }
}
