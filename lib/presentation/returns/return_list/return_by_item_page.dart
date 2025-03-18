import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/return_list_by_item_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/return_list_item_card.dart';
import 'package:ezrxmobile/presentation/returns/return_list/widgets/new_request_button.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ReturnByItemPage extends StatefulWidget {
  const ReturnByItemPage({super.key});

  @override
  State<ReturnByItemPage> createState() => _ReturnByItemPageState();
}

class _ReturnByItemPageState extends State<ReturnByItemPage> {
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
      key: WidgetKeys.returnByItemPage,
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocConsumer<ReturnListByItemBloc, ReturnListByItemState>(
          listenWhen: (previous, current) =>
              previous.failureOrSuccessOption !=
                  current.failureOrSuccessOption &&
              previous.isDownloadInProgress == current.isDownloadInProgress,
          listener: (context, state) => state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) {
                if (!state.isFetching) {
                  context.read<ProductImageBloc>().add(
                        ProductImageEvent.fetch(
                          list: state.returnItemList,
                        ),
                      );
                }
              },
            ),
          ),
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching,
          builder: (context, state) {
            return ScrollList<ReturnItem>(
              noRecordFoundWidget: NoRecordFound.returnItems(
                isSearchKeyEmpty: state.searchKey.isValueEmpty,
              ),
              dismissOnDrag: true,
              controller: _controller,
              onRefresh: () => context.read<ReturnListByItemBloc>().add(
                    ReturnListByItemEvent.fetch(
                      appliedFilter: ReturnFilter.empty(),
                      searchKey: SearchKey.empty(),
                    ),
                  ),
              onLoadingMore: () => context.read<ReturnListByItemBloc>().add(
                    const ReturnListByItemEvent.loadMore(),
                  ),
              isLoading: state.isFetching,
              itemBuilder: (context, index, item) {
                final currentGroup = item.requestDate;
                final previousGroup = index != 0
                    ? state.returnItemList[index - 1].requestDate
                    : null;

                return currentGroup != previousGroup
                    ? _ReturnItem(
                        key: WidgetKeys.returnItem(index.toString()),
                        data: item,
                        showDivider: index != 0,
                        showHeader: true,
                      )
                    : _ReturnItem(
                        key: WidgetKeys.returnItem(index.toString()),
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
        key: WidgetKeys.returnByItemsNewRequestButton,
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
                    '${'Requested on'.tr()} ${data.requestDate.dateString}',
                    key: WidgetKeys.returnItemGroupDate,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: ZPColors.darkerGrey,
                        ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                key: WidgetKeys.returnItemTile,
                child: ReturnListItemCard.listItem(
                  data: data,
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
                    context
                        .read<ReturnSummaryDetailsBloc>()
                        .add(ReturnSummaryDetailsEvent.fetch(returnItem: data));

                    context.router.push(
                      const ReturnRequestSummaryByItemDetailsRoute(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
