part of 'package:ezrxmobile/presentation/more/section/about_us/about_us_page.dart';

class _WhoWeAreSection extends StatelessWidget {
  final HorizontalListTemplate whoWeAre;
  const _WhoWeAreSection({
    required this.whoWeAre,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: WidgetKeys.aboutUsWhoWeAreSection,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            whoWeAre.title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: ZPColors.extraDarkGreen,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            whoWeAre.description,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(height: 10),
          Column(
            children: whoWeAre.achievements
                .map((e) => _AchievementsItem(achievement: e))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _AchievementsItem extends StatelessWidget {
  final HorizontalListTemplateItem achievement;
  const _AchievementsItem({
    required this.achievement,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            decoration: const BoxDecoration(
              color: ZPColors.invoiceStatusGreen,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Text(
              '${achievement.title} ${achievement.subTitle}',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              achievement.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
