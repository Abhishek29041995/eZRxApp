import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreOrderLabel extends StatelessWidget {
  final StockInfo stockInfo;
  final EdgeInsets? padding;

  const PreOrderLabel({super.key, required this.stockInfo, this.padding});

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return stockInfo.displayPreOrderLabel && !eligibilityState.salesOrgConfigs.hideStockDisplay
        ? Padding(
            padding: padding ?? const EdgeInsets.only(),
            child: StatusLabel(
              status: eligibilityState.outOfStockProductStatus,
              valueColor: eligibilityState.outOfStockProductStatus.displayStatusTextColor,
            ),
          )
        : const SizedBox.shrink();
  }
}
