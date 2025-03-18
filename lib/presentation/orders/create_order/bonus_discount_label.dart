//ignore_for_file: unused-code
//ignore_for_file: unused-class
//ignore_for_file: unused-files
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BonusDiscountLabel extends StatelessWidget {
  final MaterialInfo materialInfo;
  final Price price;
  final String tenderContractNumber;

  const BonusDiscountLabel({
    super.key,
    required this.materialInfo,
    required this.tenderContractNumber,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (materialInfo.hasValidTenderContract)
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
              child: Text(
                tenderContractNumber,
                style: Theme.of(context).textTheme.titleSmall?.apply(
                      color: ZPColors.tender,
                    ),
              ),
            ),
          if (!materialInfo.hidePrice && price.bonuses.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
              child: SvgPicture.asset(
                'assets/svg/bonus.svg',
                key: const ValueKey('bonusLogo'),
              ),
            ),
          if (!materialInfo.hidePrice && price.tiers.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
              child: SvgPicture.asset(
                'assets/svg/tieredPricing.svg',
                key: const ValueKey('tieredPricingLogo'),
              ),
            ),
        ],
      ),
    );
  }
}
