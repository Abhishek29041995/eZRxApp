import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/notification_settings/notification_settings_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/bullet_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:ezrxmobile/presentation/account/notification_settings/widgets/notification_setting_item.dart';
part 'package:ezrxmobile/presentation/account/notification_settings/widgets/notification_setting_footer.dart';

@RoutePage()
class NotificationSettingsPage extends StatelessWidget {
  const NotificationSettingsPage({super.key});

  List<NotificationSection> _getListNotificationSection(
    BuildContext context,
    NotificationSettingsState state,
  ) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return [
      if (eligibilityState.user.userCanAccessOrderHistory)
        NotificationSection(
          items: [
            SettingItemData(
              title: 'Order confirmation',
              value: state.currentNotificationSettings.orderConfirmation
                  .getOrCrash(),
              onChange: (value) => context.read<NotificationSettingsBloc>().add(
                    NotificationSettingsEvent.updateOrderConfirmation(
                      value: value ?? false,
                    ),
                  ),
              tileKey: WidgetKeys.orderConfirmationTile,
              description:
                  'Receive a confirmation email after placing an order on eZRx+',
            ),
          ],
          title: 'Orders',
        ),
      if (eligibilityState.isPaymentEnabled)
        NotificationSection(
          items: [
            SettingItemData(
              title: 'Payment updates',
              value: state.currentNotificationSettings.paymentConfirmation
                  .getOrCrash(),
              onChange: (value) => context.read<NotificationSettingsBloc>().add(
                    NotificationSettingsEvent.updatePaymentConfirmation(
                      value: value ?? false,
                    ),
                  ),
              tileKey: WidgetKeys.paymentConfirmationTile,
              description: 'Receive a notification for the following:',
              subDescriptionList: const [
                'After a payment has been submitted on eZRx+',
                'Payment advice has been generated',
                'Payment advice has been deleted either automatically or manually',
              ],
            ),
          ],
          title: 'Payments',
        ),
      if (eligibilityState.isReturnsEnable)
        NotificationSection(
          items: [
            SettingItemData(
              title: 'Return request confirmation',
              value: state.currentNotificationSettings.ereturnConfirmation
                  .getOrCrash(),
              onChange: (value) => context.read<NotificationSettingsBloc>().add(
                    NotificationSettingsEvent.updateReturnConfirmation(
                      value: value ?? false,
                    ),
                  ),
              tileKey: WidgetKeys.returnConfirmationTile,
              description:
                  'Receive a confirmation email after submitting a return request',
            ),
          ],
          title: 'Returns',
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.commonAppBar(
        title: Text(context.tr('Notifications')),
        customerBlockedOrSuspended:
            context.read<EligibilityBloc>().state.customerBlockOrSuspended,
      ),
      body: BlocConsumer<NotificationSettingsBloc, NotificationSettingsState>(
        listenWhen: (previous, current) =>
            previous.submitFailureOrSuccessOption !=
                current.submitFailureOrSuccessOption ||
            previous.failureOrSuccessOption != current.failureOrSuccessOption,
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) {},
            ),
          );
          state.submitFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) {
                CustomSnackBar(
                  key: WidgetKeys.notificationSettingsSuccessSnackBar,
                  messageText:
                      context.tr('Notification settings saved successfully'),
                ).show(context);
              },
            ),
          );
        },
        buildWhen: (previous, current) =>
            previous.currentNotificationSettings !=
                current.currentNotificationSettings ||
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          final sectionList = _getListNotificationSection(context, state);

          return ListView(
            key: WidgetKeys.notificationSettingsPage,
            padding: const EdgeInsets.all(16.0),
            children: [
              Text(
                context.tr('Notification settings'),
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                context.tr('Your email notification settings'),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.neutralsGrey1,
                    ),
              ),
              const SizedBox(
                height: 24,
              ),
              ...List.generate(sectionList.length, (index) {
                final data = sectionList[index];
                final isLastItem = index == sectionList.length - 1;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr(data.title),
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    ...data.items.map(
                      (e) => _NotificationSettingItem(
                        title: e.title,
                        tileKey: e.tileKey,
                        value: e.value,
                        onChange: e.onChange,
                        description: e.description,
                        subDescriptionList: e.subDescriptionList ?? <String>[],
                      ),
                    ),
                    if (!isLastItem)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: Divider(
                          indent: 0,
                          thickness: 1,
                          endIndent: 0,
                          height: 1,
                          color: ZPColors.extraLightGrey2,
                        ),
                      ),
                  ],
                );
              }),
            ],
          );
        },
      ),
      bottomNavigationBar: const _NotificationSettingFooter(),
    );
  }
}

class NotificationSection extends StatelessWidget {
  final String title;
  final List<SettingItemData> items;
  const NotificationSection({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.tr(title),
          style: Theme.of(context).textTheme.labelMedium,
        ),
        ...items.map(
          (e) => _NotificationSettingItem(
            title: 'Order confirmation',
            tileKey: WidgetKeys.orderConfirmationTile,
            value: e.value,
            onChange: e.onChange,
            description: e.description,
            subDescriptionList: e.subDescriptionList ?? <String>[],
          ),
        ),
      ],
    );
  }
}

class SettingItemData {
  final String title;
  final bool value;
  final String description;
  final List<String>? subDescriptionList;
  final Function(bool?) onChange;
  final Key tileKey;
  const SettingItemData({
    required this.title,
    required this.value,
    required this.onChange,
    required this.description,
    required this.tileKey,
    this.subDescriptionList,
  });
}
