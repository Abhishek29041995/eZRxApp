part of 'package:ezrxmobile/presentation/account/customer_search/customer_search.dart';

class _TitleSection extends StatelessWidget {
  final String prefixText;
  final String suffixText;
  final Color titleColor;
  const _TitleSection({
    required this.prefixText,
    required this.suffixText,
    required this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        text: '$prefixText | ',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: titleColor,
            ),
        children: <TextSpan>[
          TextSpan(
            text: suffixText,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: titleColor,
                ),
          ),
        ],
      ),
    );
  }
}
