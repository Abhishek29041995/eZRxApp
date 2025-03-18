part of 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements/announcement_info_details_page.dart';

class _AnnouncementInfoItemDescription extends StatelessWidget {
  final String title;
  final String description;
  final DateTimeStringValue releaseDate;
  const _AnnouncementInfoItemDescription({
    required this.title,
    required this.releaseDate,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            releaseDate.dateTimeOrDashString,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: ZPColors.extraLightGrey4,
            ),
          ),
          Text(
            title,
            maxLines: Responsive.isMobile(context) ? 2 : 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: ZPColors.neutralsBlack,
                ),
          ),
          Text(
            description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.extraLightGrey4,
                ),
          ),
        ],
      ),
    );
  }
}
