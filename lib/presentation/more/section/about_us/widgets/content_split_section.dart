part of 'package:ezrxmobile/presentation/more/section/about_us/about_us_page.dart';

class _ContentSplitSection extends StatelessWidget {
  final ContentSplitTemplate contentSplit;
  const _ContentSplitSection({
    required this.contentSplit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: WidgetKeys.aboutUsReachUsSection,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            contentSplit.title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: ZPColors.extraDarkGreen,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            contentSplit.subTitle,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 10),
          Html(
            data: contentSplit.description,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
