import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/products/available_offers/show_offer_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfferLabel extends StatelessWidget {
  final MaterialInfo materialInfo;
  final bool iconOnly;
  final bool disableOfferOnTap;
  const OfferLabel({
    required this.materialInfo,
    this.disableOfferOnTap = false,
    this.iconOnly = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialPriceBloc, MaterialPriceState>(
      buildWhen: (previous, current) =>
          previous.getPriceForMaterial(materialInfo.materialNumber) !=
          current.getPriceForMaterial(materialInfo.materialNumber),
      builder: (context, state) {
        final eligibilityState = context.read<EligibilityBloc>().state;
        final price = state.getPriceForMaterial(materialInfo.materialNumber);
        final bonusMaterialList = price.displayBonusTierAscOrder;

        final isDisableOfferOnTap = disableOfferOnTap ||
            (!price.isBonusDealEligible && !price.isTireDiscountEligible);

        return state.displayOfferTag(materialInfo, eligibilityState.user)
            ? iconOnly
                ? ProductTag.onOfferIcon()
                : InkWell(
                    onTap: () => isDisableOfferOnTap
                        ? null
                        : _showOfferDialog(
                            context,
                            bonusMaterialList,
                            price.tiers.reversed.toList(),
                            materialInfo,
                          ),
                    child: ProductTag.onOfferTag(),
                  )
            : const SizedBox.shrink();
      },
    );
  }

  void _showOfferDialog(
    BuildContext context,
    List<BonusMaterial> bonusMaterialList,
    List<PriceTierItem> priceTiersList,
    MaterialInfo materialInfo,
  ) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      useSafeArea: true,
      context: context,
      builder: (_) => ShowOfferDialogWidget(
        bonusMaterialList: bonusMaterialList,
        priceTiersList: priceTiersList,
        materialInfo: materialInfo,
      ),
    );
  }
}
