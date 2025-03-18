import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_material_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/presentation/core/govt_list_price_component.dart';
import 'package:ezrxmobile/presentation/core/list_price_strike_through_component.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPriceLabel extends StatelessWidget {
  final MaterialInfo materialInfo;
  final PriceStyle type;

  const ProductPriceLabel({
    super.key,
    required this.materialInfo,
    this.type = PriceStyle.commonPrice,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialPriceBloc, MaterialPriceState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching ||
          previous.materialPrice != current.materialPrice,
      builder: (context, state) {
        final itemPrice = state.materialPrice[materialInfo.materialNumber];
        final salesOrgConfig =
            context.read<EligibilityBloc>().state.salesOrgConfigs;
        if (itemPrice != null) {
          final priceAggregate = PriceAggregate(
            price: itemPrice,
            materialInfo: materialInfo,
            salesOrgConfig: salesOrgConfig,
            quantity: materialInfo.quantity.intValue == 0
                ? 1
                : materialInfo.quantity.intValue,
            // TODO: will revisit and enhance this
            discountedMaterialCount: itemPrice.zmgDiscount
                ? context.watch<CartBloc>().state.zmgMaterialsQty(
                      materialInfo.materialGroup2,
                    )
                : context.read<CartBloc>().state.zmgMaterialsQty(
                      materialInfo.materialGroup2,
                    ),
            bundle: Bundle.empty(),
            stockInfo: StockInfo.empty().copyWith(
              materialNumber: materialInfo.materialNumber,
            ),
            tenderContract: TenderContract.empty(),
            comboDeal: ComboDeal.empty(),
            bonusSampleItems: <BonusSampleItem>[],
            comboMaterials: <ComboMaterialItem>[],
            maximumQty: 0,
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListPriceStrikeThroughComponent(
                priceAggregate: priceAggregate,
              ),
              if (priceAggregate.showDiscountListPrice)
                PriceComponent(
                  key: WidgetKeys.zdpDiscountListPrice,
                  type: PriceStyle.counterOfferPrice,
                  price: priceAggregate.display(PriceType.listPrice),
                  salesOrgConfig: salesOrgConfig,
                ),
              PriceComponent(
                type: type,
                key: WidgetKeys.currentPrice,
                price: priceAggregate.tireItemPriceDisplay
                    ? priceAggregate.displayZdp5Price
                    : priceAggregate.display(PriceType.unitPrice),
                salesOrgConfig: salesOrgConfig,
              ),
              GovtListPriceComponent(
                price: priceAggregate.display(PriceType.listPrice),
              ),
            ],
          );
        }
        if (state.isFetching) {
          return SizedBox(
            key: WidgetKeys.priceLoading,
            width: 40,
            child: LoadingShimmer.tile(),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.tr('Price Not Available'),
              style: Theme.of(context).textTheme.labelMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const GovtListPriceComponent(price: 'Price Not Available'),
          ],
        );
      },
    );
  }
}
