import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/presentation/core/info_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/info_icon.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StockInfoWidget extends StatelessWidget {
  final StockInfo stockInfo;
  final MaterialInfo materialInfo;
  final bool showToolTip;
  final bool showOverrideExpiryDate;
  const StockInfoWidget({
    required this.stockInfo,
    required this.materialInfo,
    this.showToolTip = false,
    this.showOverrideExpiryDate = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    final enableBatchNumber =
        eligibilityState.salesOrgConfigs.enableBatchNumber;
    if (eligibilityState.salesOrgConfigs.displayStockInfo ||
        showOverrideExpiryDate) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 1),
        child: RichText(
          key: WidgetKeys.materialDetailsStock,
          text: TextSpan(
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: ZPColors.neutralsGrey1),
            children: [
              if (enableBatchNumber)
                TextSpan(
                  text:
                      '${context.tr('Batch')}: ${stockInfo.displayBatchNumber(isMarketPlace: materialInfo.isMarketPlace)}',
                ),
              if (eligibilityState.salesOrgConfigs.expiryDateDisplay ||
                  showOverrideExpiryDate) ...[
                if (enableBatchNumber) const TextSpan(text: ' - '),
                TextSpan(
                  text:
                      '${context.tr('Expires')}: ${stockInfo.displayExpiryDate(
                    isMarketPlace: materialInfo.isMarketPlace,
                    isPhMdi: eligibilityState.salesOrg.isPhMdi,
                    isAbbotPrincipalCode:
                        materialInfo.principalData.principalCode.isAbbot,
                  )}',
                ),
                if (showToolTip)
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: InfoIcon(
                      key: WidgetKeys.expiryDateInfoIcon,
                      onTap: () => showModalBottomSheet(
                        context: context,
                        builder: (context) => InfoBottomSheet(
                          key: WidgetKeys.expiryDateInstructionSheet,
                          title: context.tr('Expiry date'),
                          description:
                              '${context.tr('Expiry date displayed is for reference, actual product may vary')}.',
                          buttonTitle: context.tr('Got it'),
                        ),
                      ),
                    ),
                  ),
              ],
            ],
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
