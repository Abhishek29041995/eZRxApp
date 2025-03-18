import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TenderLabel extends StatelessWidget {
  final MaterialInfo materialInfo;

  const TenderLabel({
    required this.materialInfo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return context
                .read<EligibilityBloc>()
                .state
                .salesOrgConfigs
                .enableTenderOrders &&
            materialInfo.hasValidTenderContract
        ? ProductTag.tenderTag()
        : const SizedBox.shrink();
  }
}
