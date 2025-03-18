import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_material_detail_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_material.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/edge_checkbox.dart';
import 'package:ezrxmobile/presentation/core/info_label.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/mixin/bottomsheet_mixin.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/payer_information.dart';
import 'package:ezrxmobile/presentation/core/pre_order_label.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_button.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_combo.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_quantity_input.dart';
import 'package:ezrxmobile/presentation/products/combo_detail/widgets/combo_detail_next_deal_info.dart';
import 'package:ezrxmobile/presentation/products/combo_detail/widgets/discount_tag_widget.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:ezrxmobile/presentation/products/combo_detail/widgets/total_combo_count.dart';
part 'package:ezrxmobile/presentation/products/combo_detail/widgets/combo_product_tile.dart';
part 'package:ezrxmobile/presentation/products/combo_detail/widgets/material_details_section.dart';
part 'package:ezrxmobile/presentation/products/combo_detail/widgets/combo_material_quantity_selection.dart';
part 'package:ezrxmobile/presentation/products/combo_detail/widgets/material_details.dart';
part 'package:ezrxmobile/presentation/products/combo_detail/widgets/item_sub_total_section.dart';
part 'package:ezrxmobile/presentation/products/combo_detail/widgets/combo_requirement_section.dart';
part 'package:ezrxmobile/presentation/products/combo_detail/widgets/combo_detail_searchbar.dart';
part 'package:ezrxmobile/presentation/products/combo_detail/widgets/combo_detail_add_to_cart_section.dart';
part 'package:ezrxmobile/presentation/products/combo_detail/widgets/combo_detail_body_content.dart';
part 'package:ezrxmobile/presentation/products/combo_detail/widgets/combo_detail_delete_from_cart_button.dart';

@RoutePage()
class ComboDetailPage extends StatelessWidget with BottomsheetMixin {
  const ComboDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComboDealMaterialDetailBloc,
        ComboDealMaterialDetailState>(
      buildWhen: (previous, current) =>
          previous.isFetchingComboInfo != current.isFetchingComboInfo ||
          previous.isUpdateCart != current.isUpdateCart,
      builder: (context, state) {
        return Scaffold(
          key: WidgetKeys.comboDealDetailPage,
          appBar: AppBar(
            title: state.isFetchingComboInfo
                ? SizedBox(
                    key: WidgetKeys.comboDetailTitleLoading,
                    width: 100,
                    height: 20,
                    child: LoadingShimmer.tile(),
                  )
                : Text(
                    context.tr(state.currentDeal.scheme.comboDealTitleAppbar),
                    key: WidgetKeys.comboDetailAppBarTitle,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
            centerTitle: false,
            titleSpacing: 0,
            leading: IconButton(
              key: WidgetKeys.backButton,
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
              iconSize: 14,
              onPressed: () async {
                final confirmed = await showConfirmBottomSheet(
                  context: context,
                  title: 'Leave page?',
                  content:
                      'Any existing items in your combo selection will be cleared.',
                  confirmButtonText: 'Leave',
                );
                if (confirmed ?? false) {
                  if (context.mounted) await context.router.maybePop();
                }
              },
            ),
            actions: [
              state.isUpdateCart
                  ? const _ComboDetailDeleteFromCartButton()
                  : const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: CartButton(
                        cartColor: ZPColors.black,
                      ),
                    ),
            ],
          ),
          body: BlocListener<MaterialPriceBloc, MaterialPriceState>(
            listenWhen: (previous, current) =>
                previous.isFetching != current.isFetching &&
                !current.isFetching,
            listener: (context, state) {
              final materialsPrice = <MaterialNumber, MaterialPriceDetail>{};
              final comboDealMaterialDetailState =
                  context.read<ComboDealMaterialDetailBloc>().state;
              materialsPrice.addAll(
                {
                  for (final materialPrice in state.materialPrice.entries)
                    materialPrice.key: MaterialPriceDetail(
                      price: materialPrice.value,
                      info: comboDealMaterialDetailState
                              .items[materialPrice.key]?.materialInfo ??
                          MaterialInfo.empty(),
                    ),
                },
              );

              context.read<ComboDealMaterialDetailBloc>().add(
                    ComboDealMaterialDetailEvent.setPriceInfo(
                      priceMap: materialsPrice,
                    ),
                  );
            },
            child: Column(
              children: [
                const _ComboRequirementSection(),
                Expanded(
                  child: _ComboDetailBodyContent(
                    haveFixedMaterials:
                        state.currentDeal.scheme.haveFixedMaterials,
                  ),
                ),
                const _ComboDetailAddToCartSection(),
              ],
            ),
          ),
        );
      },
    );
  }
}
