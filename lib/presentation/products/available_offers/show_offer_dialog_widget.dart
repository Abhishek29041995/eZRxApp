import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/presentation/products/available_offers/available_offer_item.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

class ShowOfferDialogWidget extends StatelessWidget {
  const ShowOfferDialogWidget({
    super.key,
    required this.bonusMaterialList,
    required this.priceTiersList,
    required this.materialInfo,
  });
  final List<BonusMaterial> bonusMaterialList;
  final List<PriceTierItem> priceTiersList;
  final MaterialInfo materialInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const _AvailableOfferHeader(),
          _AvailableOfferList(
            bonusMaterialList: bonusMaterialList,
            priceTiersList: priceTiersList,
            materialInfo: materialInfo,
          ),
          const _CloseButton(),
        ],
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10.0,
      ),
      child: ElevatedButton(
        key: WidgetKeys.closeButton,
        onPressed: () => Navigator.pop(context),
        child: Text(context.tr('Close')),
      ),
    );
  }
}

class _AvailableOfferList extends StatelessWidget {
  const _AvailableOfferList({
    required this.bonusMaterialList,
    required this.priceTiersList,
    required this.materialInfo,
  });
  final List<BonusMaterial> bonusMaterialList;
  final List<PriceTierItem> priceTiersList;
  final MaterialInfo materialInfo;

  @override
  Widget build(BuildContext context) {
    final showTierPrice = !materialInfo.hidePrice ||
        !(materialInfo.isPnGPrinciple &&
            context.read<EligibilityBloc>().state.isMYExternalSalesRepUser);

    return Flexible(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        shrinkWrap: true,
        children: [
          if (showTierPrice)
            ...priceTiersList.map((e) => _PriceTierItem(item: e)),
          ...bonusMaterialList.map((e) => _BonusMaterialItem(item: e)),
        ],
      ),
    );
  }
}

class _BonusMaterialItem extends StatelessWidget {
  const _BonusMaterialItem({
    required this.item,
  });

  final BonusMaterial item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: AvailableOfferItem(
        bonusMaterial: item,
        priceTier: PriceTierItem.empty(),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
      ),
    );
  }
}

class _PriceTierItem extends StatelessWidget {
  const _PriceTierItem({
    required this.item,
  });

  final PriceTierItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: AvailableOfferItem(
        bonusMaterial: BonusMaterial.empty(),
        priceTier: item,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
      ),
    );
  }
}

class _AvailableOfferHeader extends StatelessWidget {
  const _AvailableOfferHeader();

  @override
  Widget build(BuildContext context) {
    final isId =
        context.read<EligibilityBloc>().state.salesOrgConfigs.salesOrg.isID;

    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 24),
      title: Text(
        context.tr('Available offers'),
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: ZPColors.primary,
            ),
      ),
      subtitle: Text(
        context.tr(
          isId
              ? "The offers you get will based on eligibility. You'll know which promo you received after you do check out."
              : 'Offers are auto-applied based on quantity purchased',
        ),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: ZPColors.extraLightGrey4,
            ),
      ),
    );
  }
}
