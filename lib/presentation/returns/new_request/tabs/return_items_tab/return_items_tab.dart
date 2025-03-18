import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/return_items/filter/return_items_filter_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/return_items/return_items_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_items_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/custom_badge.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/edge_checkbox.dart';
import 'package:ezrxmobile/presentation/core/expandable_section.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/outside_return_policy_tag.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/new_request/tabs/return_items_tab/return_items_filter_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/bonus_material_info.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/expandable_info.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/material_details_section.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/material_info_widget.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/material_quantity_and_price.dart';

part 'widgets/return_material_widget.dart';

part 'widgets/return_material_info.dart';

part 'widgets/bonus_item_section.dart';

part 'widgets/return_items_search_bar.dart';

@RoutePage()
class ReturnItemsTab extends StatelessWidget {
  const ReturnItemsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 24, 12, 4),
          child: ListTile(
            tileColor: ZPColors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                5,
              ),
            ),
            horizontalTitleGap: 10,
            subtitle: Text(
              context.tr(
                'Return requests can be created from invoices dated within the last 5 years ONLY.',
              ),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: ZPColors.neutralsDarkBlack,
                  ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
          child: Row(
            children: [
              const Expanded(
                child: _ReturnItemsSearchBar(
                  key: WidgetKeys.newRequestSearchItem,
                ),
              ),
              BlocBuilder<ReturnItemsBloc, ReturnItemsState>(
                buildWhen: (previous, current) =>
                    previous.appliedFilter != current.appliedFilter,
                builder: (context, state) {
                  return CustomBadge(
                    Icons.tune_outlined,
                    key: WidgetKeys.newRequestFilterIcon,
                    count: state.appliedFilter.appliedFilterCount,
                    badgeColor: ZPColors.orange,
                    onPressed: () {
                      context.read<ReturnItemsFilterBloc>().add(
                            ReturnItemsFilterEvent.openFilterBottomSheet(
                              appliedFilter: state.appliedFilter,
                            ),
                          );
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        enableDrag: false,
                        isDismissible: false,
                        builder: (_) => const ReturnItemsFilterBottomSheet(),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
        BlocConsumer<ReturnItemsBloc, ReturnItemsState>(
          listenWhen: (previous, current) =>
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
          },
          buildWhen: (previous, current) =>
              previous.isLoading != current.isLoading,
          builder: (context, state) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ScrollList<ReturnMaterial>(
                  key: WidgetKeys.newRequestListItemAbleToReturn,
                  dismissOnDrag: true,
                  noRecordFoundWidget: NoRecordFound.newReturnItems(
                    isSearchKeyEmpty: state.searchKey.isValueEmpty,
                  ),
                  controller: ScrollController(),
                  onRefresh: () => context.read<ReturnItemsBloc>().add(
                        ReturnItemsEvent.fetch(
                          appliedFilter: ReturnItemsFilter.init(),
                          searchKey: SearchKey.empty(),
                        ),
                      ),
                  onLoadingMore: () {
                    context.read<ReturnItemsBloc>().add(
                          const ReturnItemsEvent.loadMore(),
                        );
                  },
                  isLoading: state.isLoading,
                  itemBuilder: (context, index, item) => _ReturnMaterialWidget(
                    data: item,
                  ),
                  items: state.items,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
