part of 'package:ezrxmobile/presentation/notification/notification_tab.dart';

class _NotificationList extends StatelessWidget {
  final NotificationData notificationData;
  const _NotificationList({super.key, required this.notificationData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return ListTile(
          contentPadding: const EdgeInsets.all(padding12),
          visualDensity: VisualDensity.compact,
          dense: true,
          key: WidgetKeys.notificationItem,
          onTap: state.isLoading
              ? null
              : () {
                  context.read<NotificationBloc>().add(
                        NotificationEvent.readNotifications(
                          notificationId: notificationData.id,
                        ),
                      );
                  _navigateToDetailPage(context);
                },
          leading: CircleAvatar(
            key: WidgetKeys.notificationItemIcon,
            backgroundColor: notificationData.title.iconBgColor,
            child: Icon(
              notificationData.title.iconData,
              size: padding24,
              color: notificationData.title.iconColor,
            ),
          ),
          tileColor: notificationData.isRead
              ? ZPColors.transparent
              : ZPColors.lightBgYellow,
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (notificationData.isMarketPlace)
                    const Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: MarketPlaceIcon(),
                    ),
                  Expanded(
                    child: Text(
                      context.tr(notificationData.title.getOrDefaultValue('')),
                      key: WidgetKeys.notificationItemTitle,
                      style: Theme.of(context).textTheme.titleSmall,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
              Text(
                notificationData.description,
                key: WidgetKeys.notificationItemDescription,
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              ///TODO: will revisit later
              Text(
                notificationData.createdAt.notificationDateTime,
                key: WidgetKeys.notificationItemCreatedAt,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: ZPColors.lightGray),
              ),
            ],
          ),
          trailing: Text(
            notificationData.createdAt.differenceTime,
            key: WidgetKeys.notificationItemDifferenceTime,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: ZPColors.darkGray),
          ),
        );
      },
    );
  }

  void _navigateToDetailPage(
    BuildContext context,
  ) {
    //No Navigation for incorrect data
    if (!notificationData.type.isValid()) return;
    final eligibilityState = context.read<EligibilityBloc>().state;
    //Event call for Return Detail Page
    if (notificationData.isReturnEligible && eligibilityState.isReturnsEnable) {
      context.read<ReturnDetailsByRequestBloc>().add(
            ReturnDetailsByRequestEvent.fetch(
              returnId: notificationData.returnRequestId.requestId,
            ),
          );
      //Navigate to return Detail Page
      context.router.push(const ReturnRequestDetailsRoute());
    }
    //Event call for Order Detail Page
    else if (notificationData.isOrderEligible &&
        eligibilityState.user.userCanAccessOrderHistory) {
      context.read<ViewByOrderDetailsBloc>().add(
            ViewByOrderDetailsEvent.fetch(
              orderNumber: notificationData.orderNumber,
            ),
          );
    }
    //Event call for Payment Detail Page
    else if ((notificationData.isPaymentEligible &&
        eligibilityState.isPaymentEnabled)) {
      context.read<PaymentSummaryDetailsBloc>().add(
            PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
              //For ID, we need to inject payment number on paymentID
              details: eligibilityState.salesOrg.isID
                  ? PaymentSummaryDetails.empty().copyWith(
                      paymentID: notificationData.paymentNumber,
                    )
                  : PaymentSummaryDetails.empty().copyWith(
                      zzAdvice: notificationData.paymentNumber,
                      paymentBatchAdditionalInfo:
                          notificationData.paymentBatchAdditionalInfo,
                    ),
              isMarketPlace: false,
            ),
          );
      //Navigate to Payment Detail Page
      context.router.push(
        PaymentSummaryDetailsPageRoute(
          isMarketPlace: false,
        ),
      );
    } else {
      CustomSnackBar(
        icon: const Icon(
          Icons.info,
          color: ZPColors.error,
        ),
        backgroundColor: ZPColors.errorSnackBarColor,
        messageText: context.tr(
          notificationData.isOrderEligible
              ? 'You do not have access to view this order'
              : 'You don\'t have access',
        ),
      ).show(context);
    }
  }
}
