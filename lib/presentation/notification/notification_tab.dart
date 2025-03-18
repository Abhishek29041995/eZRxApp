import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/deep_linking/deep_linking_bloc.dart';
import 'package:ezrxmobile/application/notification/notification_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary_details/payment_summary_details_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/details/return_details_by_request_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/notification/entities/notification_data.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/presentation/core/confirm_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_icon.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

part 'package:ezrxmobile/presentation/notification/widgets/notification_list.dart';
part 'package:ezrxmobile/presentation/notification/widgets/delete_notifications_button.dart';

part 'package:ezrxmobile/presentation/notification/widgets/announcement_list.dart';

@RoutePage()
class NotificationTab extends StatelessWidget {
  const NotificationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.commonAppBar(
        title: Text(context.tr('Notifications')),
        automaticallyImplyLeading: false,
        titleSpacing: 20,
        actionWidget: const [
          _DeleteNotificationButton(),
        ],
        customerBlockedOrSuspended:
            context.read<EligibilityBloc>().state.customerBlockOrSuspended,
      ),
      body: BlocBuilder<AnnouncementBloc, AnnouncementState>(
        buildWhen: (pre, cur) => pre.maintenanceItem != cur.maintenanceItem,
        builder: (context, announcementState) {
          return BlocConsumer<NotificationBloc, NotificationState>(
            listenWhen: (previous, current) =>
                previous.isFetching != current.isFetching,
            listener: (context, state) {
              state.notificationFailureOrSuccessOption.fold(
                () {
                  if (state.isDeletedAllSuccess) {
                    CustomSnackBar(
                      messageText: context.tr('Notification has been deleted'),
                    ).show(context);
                  }
                },
                (either) => {},
              );
            },
            buildWhen: (previous, current) =>
                previous.isFetching != current.isFetching ||
                previous.isDeletedAllSuccess != current.isDeletedAllSuccess ||
                previous.isReadNotification != current.isReadNotification,
            builder: (context, state) {
              if (state.isFetching &&
                  state.notificationList.notificationData.isEmpty &&
                  announcementState
                      .maintenanceItem.listNotificationData.isEmpty) {
                return LoadingShimmer.logo(
                  key: WidgetKeys.loaderImage,
                );
              }

              return ScrollList<NotificationData>(
                controller: ScrollController(),
                isLoading: state.isFetching,
                noRecordFoundWidget: const NoRecordFound(
                  key: WidgetKeys.notificationNotFoundRecordKey,
                  title: 'No notifications to show',
                  subTitle: "We'll notify you when there is something",
                  svgImage: SvgImage.notification,
                ),
                itemBuilder: (context, index, item) => item.type.isAnnouncement
                    ? _AnnouncementList(
                        key: WidgetKeys.genericKey(key: item.description),
                        notificationData: item,
                      )
                    : _NotificationList(
                        key: WidgetKeys.genericKey(key: item.description),
                        notificationData: item,
                      ),
                items: [
                  ...announcementState.maintenanceItem.listNotificationData,
                  ...state.notificationList.notificationData,
                ],
                onRefresh: () {
                  context.read<AnnouncementBloc>().add(
                        AnnouncementEvent.getMaintenanceBanners(
                          salesOrg:
                              context.read<EligibilityBloc>().state.salesOrg,
                        ),
                      );
                  context
                      .read<NotificationBloc>()
                      .add(const NotificationEvent.fetch());
                },
                onLoadingMore: () => context
                    .read<NotificationBloc>()
                    .add(const NotificationEvent.loadMore()),
              );
            },
          );
        },
      ),
    );
  }
}
