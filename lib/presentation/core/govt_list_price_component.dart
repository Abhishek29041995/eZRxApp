import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GovtListPriceComponent extends StatelessWidget {
  const GovtListPriceComponent({
    super.key,
    required this.price,
  });

  final String price;

  @override
  Widget build(BuildContext context) {
    final salesOrgConfigs =
        context.read<EligibilityBloc>().state.salesOrgConfigs;

    return salesOrgConfigs.showGovtListPrice
        ? PriceComponent(
            key: WidgetKeys.govtMaterialListPrice,
            title: '${context.tr('List price')}: ',
            type: PriceStyle.govtMaterialListPrice,
            price: price,
            salesOrgConfig: salesOrgConfigs,
          )
        : const SizedBox.shrink();
  }
}
