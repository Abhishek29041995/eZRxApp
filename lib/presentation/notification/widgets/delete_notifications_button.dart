part of 'package:ezrxmobile/presentation/notification/notification_tab.dart';

class _DeleteNotificationButton extends StatelessWidget {
  const _DeleteNotificationButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      buildWhen: (previous, current) =>
          previous.notificationList.notificationData !=
          current.notificationList.notificationData,
      builder: (context, state) {
        if (state.notificationList.notificationData.isEmpty) {
          return const SizedBox.shrink();
        }

        return IconButton(
          key: WidgetKeys.notificationDeleteButton,
          onPressed: () async {
            final confirmed = await _showConfirmBottomSheet(context);
            if ((confirmed ?? false) && context.mounted) {
              context.read<NotificationBloc>().add(
                    const NotificationEvent.deleteAllNotifications(),
                  );
            }
          },
          icon: const Icon(
            Icons.delete_outline,
            color: ZPColors.red,
          ),
        );
      },
    );
  }

  Future<bool?> _showConfirmBottomSheet(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      enableDrag: false,
      builder: (_) => ConfirmBottomSheet(
        key: WidgetKeys.confirmBottomSheet,
        title: 'Clear all notifications?',
        content: 'This action cannot be undone',
        confirmButtonText: 'Clear All',
        displayCancelButton: true,
      ),
    );
  }
}
