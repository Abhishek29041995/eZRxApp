import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_filter/view_by_item_filter_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_filter.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_group.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/info_label.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/queue_number_info_icon.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/tender_contract_section.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/image_box_widget.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item/widgets/view_by_order_item_group.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item/widgets/view_by_order_item.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item/widgets/invoice_number.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item/widgets/view_by_order_item_tile.dart';

@RoutePage()
class ViewByItemsPage extends StatelessWidget {
  const ViewByItemsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByItemsBloc, ViewByItemsState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching ||
          previous.isFetchingInvoices != current.isFetchingInvoices,
      builder: (context, state) {
        if (state.isFetching && state.orderHistory.orderHistoryItems.isEmpty) {
          return LoadingShimmer.logo(
            key: WidgetKeys.loaderImage,
          );
        }

        return ScrollList<ViewByItemGroup>(
          controller: ScrollController(),
          dismissOnDrag: true,
          noRecordFoundWidget: NoRecordFound.ordersHistory(
            context,
            state.hasSearchFilter,
          ),
          onRefresh: () {
            context
                .read<ViewByItemFilterBloc>()
                .add(const ViewByItemFilterEvent.initialize());
            context.read<ViewByItemsBloc>().add(
                  ViewByItemsEvent.fetch(
                    viewByItemFilter: ViewByItemFilter.empty(),
                    searchKey: SearchKey.empty(),
                  ),
                );
          },
          isLoading: state.isFetching,
          onLoadingMore: () => context.read<ViewByItemsBloc>().add(
                const ViewByItemsEvent.loadMore(),
              ),
          itemBuilder: (context, index, item) => _ViewByOrderItemGroup(
            orderHistoryItem: item,
            showDivider: index != 0,
            showBanner: index == 0,
          ),
          items: state.orderHistory.orderHistoryItems.getViewByOrderItemList,
        );
      },
    );
  }
}
