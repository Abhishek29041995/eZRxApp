part of 'package:ezrxmobile/presentation/account/notification_settings/notification_settings_page.dart';

class _NotificationSettingItem extends StatelessWidget {
  final Function(bool?) onChange;
  final bool value;
  final String title;
  final String description;
  final List<String> subDescriptionList;
  final Key tileKey;
  const _NotificationSettingItem({
    required this.tileKey,
    required this.onChange,
    required this.value,
    required this.title,
    required this.description,
    this.subDescriptionList = const <String>[],
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTileTheme(
          horizontalTitleGap: padding6,
          child: CheckboxListTile(
            key: tileKey,
            contentPadding: EdgeInsets.zero,
            visualDensity: const VisualDensity(vertical: -2),
            controlAffinity: ListTileControlAffinity.leading,
            dense: true,
            enabled: !context.read<NotificationSettingsBloc>().state.isLoading,
            value: value,
            onChanged: onChange,
            title: Text(
              context.tr(
                title,
              ),
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 38),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.tr(
                  description,
                ),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.neutralsGrey1,
                    ),
              ),
              const SizedBox(
                height: 8,
              ),
              if (subDescriptionList.isNotEmpty)
                ...subDescriptionList.map(
                  (e) => BulletWidget(
                    content: Text(
                      context.tr(
                        e,
                      ),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ZPColors.neutralsGrey1,
                          ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
