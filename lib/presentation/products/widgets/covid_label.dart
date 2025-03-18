import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CovidLabel extends StatelessWidget {
  final MaterialInfo materialInfo;
  final BorderRadius? borderRadius;
  final EdgeInsets padding;

  const CovidLabel({
    required this.materialInfo,
    this.borderRadius,
    this.padding = const EdgeInsets.all(5),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return context.read<EligibilityBloc>().state.canOrderCovidMaterial &&
            materialInfo.isFOCMaterial
        ? ProductTag.covidTag()
        : const SizedBox.shrink();
  }
}
