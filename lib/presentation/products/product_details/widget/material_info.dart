import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialInformation extends StatelessWidget {
  final MaterialInfo materialInfo;

  const MaterialInformation({super.key, required this.materialInfo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: WidgetKeys.materialDetailsInfoTile,
      title: Text(
        context.tr('Material information'),
        style: Theme.of(context).textTheme.labelSmall,
      ),
      subtitle: Text(
        '${context.tr('Material number')}, ${context.tr(materialInfo.isMarketPlace ? 'Sold by' : 'Manufacturer')}, ${context.tr('Country of origin')}, ${context.tr('Unit of measurement')}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: ZPColors.extraLightGrey4),
      ),
      trailing: const Icon(
        Icons.chevron_right,
      ),
      onTap: () {
        trackMixpanelEvent(
          TrackingEvents.productInfoViewed,
          props: {
            TrackingProps.productName: materialInfo.displayDescription,
            TrackingProps.productNumber:
                materialInfo.materialNumber.displayMatNo,
            TrackingProps.productManufacturer: materialInfo.getManufactured,
          },
        );
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (_) => BlocProvider<ProductDetailBloc>.value(
            value: context.read<ProductDetailBloc>(),
            child: const _MaterialInfoDialog(),
          ),
        );
      },
    );
  }
}

class _MaterialInfoDialog extends StatelessWidget {
  const _MaterialInfoDialog();

  @override
  Widget build(BuildContext context) {
    final productDetailState = context.read<ProductDetailBloc>().state;

    final materialInfo = productDetailState.productDetailAggregate.materialInfo;
    final eligibilityState = context.read<EligibilityBloc>().state;

    return Padding(
      key: WidgetKeys.materialInfoDialog,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr('Material information'),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: ZPColors.primary,
                ),
          ),
          const SizedBox(
            height: 20,
          ),
          BalanceTextRow(
            keyText: context.tr('Material number'),
            valueText: materialInfo.materialNumber.displayMatNo,
            valueFlex: 1,
            keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.black,
                ),
            valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.darkGray,
                ),
          ),
          const SizedBox(height: 7),
          if (eligibilityState.salesOrgConfigs.enableIRN) ...[
            BalanceTextRow(
              keyText: context.tr('Registration number'),
              valueText: materialInfo.getIRN.displayDashIfEmpty,
              valueFlex: 1,
              keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.black,
                  ),
              valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.darkGray,
                  ),
            ),
            const SizedBox(height: 7),
          ],
          if (eligibilityState.salesOrgConfigs.enableGMC) ...[
            BalanceTextRow(
              keyText: context.tr('Govt material number'),
              valueText: materialInfo.getGMC.displayDashIfEmpty,
              valueFlex: 1,
              keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.black,
                  ),
              valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.darkGray,
                  ),
            ),
            const SizedBox(height: 7),
          ],
          BalanceTextRow(
            keyText: context.tr('Material name'),
            valueText: materialInfo.defaultMaterialDescription,
            valueFlex: 1,
            keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.black,
                ),
            valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.darkGray,
                ),
          ),
          const SizedBox(height: 7),
          BalanceTextRow(
            keyText: context.tr(
              materialInfo.isMarketPlace ? 'Sold by seller' : 'Manufacturer',
            ),
            valueText: materialInfo.principalData.principalName.name,
            valueFlex: 1,
            keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.black,
                ),
            valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.darkGray,
                ),
          ),
          const SizedBox(height: 7),
          BalanceTextRow(
            keyText: context.tr('Unit of measurement'),
            valueText: materialInfo.unitOfMeasurement.displayNAIfEmpty,
            valueFlex: 1,
            keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.black,
                ),
            valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.darkGray,
                ),
          ),
          const SizedBox(height: 7),
          BalanceTextRow(
            keyText: context.tr('Country of origin'),
            valueText: materialInfo.countryData.countryName.displayNAIfEmpty,
            valueFlex: 1,
            keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.black,
                ),
            valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.darkGray,
                ),
          ),
          const SizedBox(height: 7),
          if (eligibilityState.salesOrgConfigs.enableBatchNumber)
            BalanceTextRow(
              keyText: context.tr('Batch'),
              valueText: productDetailState.displayBatchNumber,
              valueFlex: 1,
              keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.black,
                  ),
              valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.darkGray,
                  ),
            ),
          if (eligibilityState.salesOrgConfigs.expiryDateDisplay)
            _ExpiryDateWidget(
              expiryDateText: productDetailState.displayExpiryDate,
            ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  key: WidgetKeys.closeMaterialInformationDialog,
                  onPressed: () => context.router.maybePop(),
                  child: Text(context.tr('Close')),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _ExpiryDateWidget extends StatelessWidget {
  const _ExpiryDateWidget({
    required this.expiryDateText,
  });

  final String expiryDateText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 7),
        BalanceTextRow(
          keyText: context.tr('Expiry date'),
          valueText: expiryDateText,
          valueFlex: 1,
          keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.black,
              ),
          valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.darkGray,
              ),
        ),
        Row(
          children: [
            const Spacer(),
            Expanded(
              child: Text(
                context.tr(
                  'Expiry date displayed is for reference, actual product may vary',
                ),
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: ZPColors.darkGray,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
