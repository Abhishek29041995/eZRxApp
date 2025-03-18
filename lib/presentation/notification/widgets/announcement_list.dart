part of 'package:ezrxmobile/presentation/notification/notification_tab.dart';

class _AnnouncementList extends StatelessWidget {
  final NotificationData notificationData;

  const _AnnouncementList({super.key, required this.notificationData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: WidgetKeys.notificationItem,
      contentPadding: const EdgeInsets.all(padding12),
      onTap: () {
        if (notificationData.hyperLink.isInternalLink) {
          context.read<DeepLinkingBloc>().add(
                DeepLinkingEvent.addPendingLink(
                  EzrxLink(notificationData.hyperLink.getOrDefaultValue('')),
                ),
              );
        } else if (notificationData.hyperLink.isExternalLink) {
          context.router.push(
            WebViewPageRoute(
              url: notificationData.hyperLink.getOrDefaultValue(''),
            ),
          );
        }
      },
      trailing: Text(
        notificationData.createdAt.differenceTime,
        key: WidgetKeys.notificationItemDifferenceTime,
      ),
      leading: Container(
        key: WidgetKeys.notificationItemIcon,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: notificationData.title.iconBgColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          notificationData.title.iconData,
          size: 16,
          color: notificationData.title.iconColor,
        ),
      ),
      tileColor: ZPColors.transparent,
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr(notificationData.title.getOrDefaultValue('')),
            key: WidgetKeys.notificationItemTitle,
            style: Theme.of(context).textTheme.labelSmall,
            overflow: TextOverflow.ellipsis,
          ),
          Html(
            key: WidgetKeys.notificationItemDescription,
            data: notificationData.description,
            style: {
              'body': Style(
                padding: HtmlPaddings.zero,
                margin: Margins.zero,
              ),
            },
          ),
          const SizedBox.shrink(),
          Text(
            notificationData.createdAt.notificationDateTime,
            key: WidgetKeys.notificationItemCreatedAt,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: ZPColors.lightGray),
          ),
        ],
      ),
    );
  }
}
