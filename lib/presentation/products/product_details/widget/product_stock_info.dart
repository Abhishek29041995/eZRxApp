import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_detail_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/widgets/stock_info.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductStockInfo extends StatelessWidget {
  final MaterialNumber materialNumber;
  const ProductStockInfo({
    super.key,
    required this.materialNumber,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      buildWhen: (previous, current) =>
          current.productDetailAggregate.stockInfo !=
              previous.productDetailAggregate.stockInfo ||
          current.isDetailAndStockFetching != previous.isDetailAndStockFetching,
      builder: (context, state) {
        final stockInfo = state.productDetailAggregate.stockInfo;
        final materialInfo = state.productDetailAggregate.materialInfo;

        if (state.isDetailAndStockFetching) {
          return SizedBox(
            width: 100,
            child: LoadingShimmer.tile(),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            StockInfoWidget(
              stockInfo: stockInfo,
              materialInfo: materialInfo,
              showToolTip: true,
              showOverrideExpiryDate: stockInfo.isExpireSoon,
            ),
            _MaterialExpiresSoonTag(
              stockInfo: stockInfo,
              materialInfo: materialInfo,
            ),
          ],
        );
      },
    );
  }
}

class _MaterialExpiresSoonTag extends StatelessWidget {
  final StockInfo stockInfo;
  final MaterialInfo materialInfo;
  const _MaterialExpiresSoonTag({
    required this.stockInfo,
    required this.materialInfo,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TenderContractDetailBloc, TenderContractDetailState>(
      buildWhen: (previous, current) =>
          previous.currentTenderContract != current.currentTenderContract,
      builder: (context, state) {
        if (!stockInfo.isExpireSoon || state.currentTenderContract.isEmpty) {
          return const SizedBox.shrink();
        }

        return Container(
          decoration: BoxDecoration(
            color: ZPColors.errorSnackBarColor,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            context.tr('Material expires soon'),
            key: WidgetKeys.materialExpiresSoonTag,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: ZPColors.brickRedColor,
                  fontWeight: FontWeight.w500,
                ),
          ),
        );
      },
    );
  }
}
