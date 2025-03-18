import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/details/return_details_by_request_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/return_list_by_request_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_rectangle_logo.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/return_list/widgets/new_request_button.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/domain/returns/entities/return_item.dart';

@RoutePage()
class ReturnByRequestPage extends StatefulWidget {
  const ReturnByRequestPage({super.key});

  @override
  State<ReturnByRequestPage> createState() => _ReturnByRequestPageState();
}

class _ReturnByRequestPageState extends State<ReturnByRequestPage> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.returnByRequestRootPage,
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocConsumer<ReturnListByRequestBloc, ReturnListByRequestState>(
          listenWhen: (previous, current) =>
              previous.isFetching != current.isFetching,
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
          },
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching,
          builder: (context, state) {
            return ScrollList<ReturnItem>(
              noRecordFoundWidget: NoRecordFound.returnItems(
                isSearchKeyEmpty: state.searchKey.isValueEmpty,
              ),
              dismissOnDrag: true,
              controller: _controller,
              onRefresh: () => context.read<ReturnListByRequestBloc>().add(
                    ReturnListByRequestEvent.fetch(
                      appliedFilter: ReturnFilter.empty(),
                      searchKey: SearchKey.empty(),
                    ),
                  ),
              onLoadingMore: () => context.read<ReturnListByRequestBloc>().add(
                    const ReturnListByRequestEvent.loadMore(),
                  ),
              isLoading: state.isFetching,
              itemBuilder: (context, index, item) {
                final currentGroup = item.requestDate;
                final previousGroup = index != 0
                    ? state.returnItemList[index - 1].requestDate
                    : null;

                return currentGroup != previousGroup
                    ? _ReturnItem(
                        key: WidgetKeys.returnRequest(index.toString()),
                        data: item,
                        showDivider: index != 0,
                        showHeader: true,
                      )
                    : _ReturnItem(
                        data: item,
                        showDivider: false,
                        showHeader: false,
                      );
              },
              items: state.returnItemList,
            );
          },
        ),
      ),
      floatingActionButton: NewRequestButton(
        key: WidgetKeys.returnByRequestNewRequestButton,
        controller: _controller,
      ),
    );
  }
}

class _ReturnItem extends StatelessWidget {
  final ReturnItem data;
  final bool showDivider;
  final bool showHeader;
  const _ReturnItem({
    super.key,
    required this.data,
    required this.showDivider,
    required this.showHeader,
  });

  @override
  Widget build(BuildContext context) {
    final config = context.read<EligibilityBloc>().state.salesOrgConfigs;
    final user = context.read<EligibilityBloc>().state.user;

    return Column(
      children: [
        if (showDivider)
          const Divider(
            indent: 0,
            height: 20,
            endIndent: 0,
            color: ZPColors.lightGray2,
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showHeader)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    '${context.tr('Requested on')} ${data.requestDate.dateString}',
                    key: WidgetKeys.returnRequestGroupDate,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: ZPColors.darkerGrey,
                        ),
                  ),
                ),
              CustomCard(
                key: WidgetKeys.returnRequestTile,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  onTap: () {
                    trackMixpanelEvent(
                      TrackingEvents.returnRequestViewed,
                      props: {
                        TrackingProps.subTabFrom:
                            RouterUtils.buildRouteTrackingName(
                          context.routeData.path,
                        ),
                      },
                    );
                    context.read<ReturnDetailsByRequestBloc>().add(
                          ReturnDetailsByRequestEvent.fetch(
                            returnId: data.requestId,
                          ),
                        );
                    context.router.push(
                      const ReturnRequestDetailsRoute(),
                    );
                  },
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (data.isMarketPlace)
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: MarketPlaceRectangleLogo(),
                        ),
                      if (data.customerName.isNotEmpty &&
                          user.role.type.isSalesRepRole)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            data.customerName,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: ZPColors.neutralsGrey1),
                          ),
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${context.tr('Return')} #${data.requestId}',
                              key: WidgetKeys.returnRequestTileIdLabel,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: ZPColors.neutralsBlack,
                                  ),
                            ),
                          ),
                          StatusLabel(
                            key: WidgetKeys.returnRequestTileStatus,
                            status: StatusType(
                              data.status.displayStatusForViewByRequest,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${data.itemQty.getOrDefaultValue('0')} ${data.itemQty.noun}',
                            key: WidgetKeys.returnRequestTileQtyLabel,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          PriceComponent(
                            title: '${context.tr('Return value')}: ',
                            salesOrgConfig: config,
                            price: data.totalPrice.toStringAsFixed(2),
                            priceLabelStyle:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: ZPColors.darkerGrey,
                                    ),
                          ),
                        ],
                      ),
                    ],
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
