import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/return_list_by_item_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/view_by_item_filter/view_by_item_return_filter_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/return_list_by_request_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/view_by_request_filter/view_by_request_return_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/banner_storage.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/custom_badge.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/return_list/return_by_item_filter/return_by_item_filter_page.dart';
import 'package:ezrxmobile/presentation/returns/return_list/return_filter/return_by_request_filter_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:ezrxmobile/presentation/widgets/announcement_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/filter_return_by_request.dart';

part 'widgets/filter_return_by_item.dart';

part 'widgets/list_by_item_search_bar.dart';

part 'widgets/list_by_request_search_bar.dart';

part 'widgets/export_return_by_item.dart';

part 'widgets/export_return_by_request.dart';

@RoutePage()
class ReturnRoot extends StatefulWidget {
  const ReturnRoot({super.key});

  @override
  State<ReturnRoot> createState() => _ReturnRootState();
}

class _ReturnRootState extends State<ReturnRoot> {
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void _initialize() {
    final state = context.read<EligibilityBloc>().state;

    context.read<ReturnListByItemBloc>().add(
          ReturnListByItemEvent.initialized(
            salesOrg: state.salesOrganisation.salesOrg,
            shipInfo: state.shipToInfo,
            user: state.user,
            customerCodeInfo: state.customerCodeInfo,
          ),
        );

    context.read<ReturnListByRequestBloc>().add(
          ReturnListByRequestEvent.initialized(
            salesOrg: state.salesOrganisation.salesOrg,
            shipInfo: state.shipToInfo,
            user: state.user,
            customerCodeInfo: state.customerCodeInfo,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // This code will run after the build is finished
      // You can perform any tasks here that require the build to be complete
      if (context.read<AnnouncementBloc>().state.canShowSheetReturn) {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          enableDrag: false,
          isDismissible: false,
          builder: (_) => AnnouncementBottomSheet(
            maintenanceItem:
                context.read<AnnouncementBloc>().state.maintenanceItem,
            storageType: StorageType.returns,
          ),
        );
      }
    });

    return Scaffold(
      key: WidgetKeys.returnRootPage,
      appBar: CustomAppBar.commonAppBar(
        title: Text(context.tr('Returns')),
        customerBlockedOrSuspended:
            context.read<EligibilityBloc>().state.customerBlockOrSuspended,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnnouncementWidget(currentPath: context.router.currentPath),
          Expanded(
            child: AutoTabsRouter.tabBar(
              routes: const [
                ReturnByItemPageRoute(),
                ReturnByRequestPageRoute(),
              ],
              builder: (context, child, tabController) => Column(
                children: [
                  TabBar(
                    controller: tabController,
                    tabs: [
                      'View by items',
                      'View by return requests',
                    ]
                        .map(
                          (e) => Tab(
                            key: Key(
                              StringUtils.changeToCamelCase(sentence: e),
                            ),
                            text: context.tr(e),
                          ),
                        )
                        .toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      padding12,
                      padding12,
                      padding12,
                      0.0,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: context.tabsRouter.current.name ==
                                  ReturnByItemPageRoute.name
                              ? const _ListByItemSearchBar(
                                  key: WidgetKeys.returnByItemsSearchBar,
                                )
                              : const _ListByRequestSearchBar(
                                  key: WidgetKeys.returnByRequestSearchBar,
                                ),
                        ),
                        context.tabsRouter.current.name ==
                                ReturnByItemPageRoute.name
                            ? const _FilterReturnByItem(
                                key: WidgetKeys.returnByItemsFilterButton,
                              )
                            : const _FilterReturnByRequest(
                                key: WidgetKeys.returnByRequestFilterButton,
                              ),
                        context.tabsRouter.current.name ==
                                ReturnByItemPageRoute.name
                            ? const _ExportReturnByItem(
                                key: WidgetKeys.exportReturnByItem,
                              )
                            : const _ExportReturnByRequest(
                                key: WidgetKeys.exportReturnByRequest,
                              ),
                      ],
                    ),
                  ),
                  Expanded(child: child),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
