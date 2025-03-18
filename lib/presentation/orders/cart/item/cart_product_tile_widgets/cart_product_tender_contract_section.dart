import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/error_text_with_icon.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductTenderContractSection extends StatelessWidget {
  final PriceAggregate cartItem;
  final bool isEditButtonRequired;
  const CartProductTenderContractSection({
    super.key,
    required this.cartItem,
    this.isEditButtonRequired = true,
  });

  @override
  Widget build(BuildContext context) {
    return cartItem.tenderContract.isNotEmpty
        ? Container(
            margin: const EdgeInsets.fromLTRB(8, 5, 8, 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: ZPColors.tenderUnselectBg,
            ),
            child: Column(
              children: [
                if (cartItem.isTenderContractInvalid)
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 8, top: 5),
                    child: ErrorTextWithIcon(
                      valueText: context.tr(
                        'Tender Contract is no longer available.',
                      ),
                    ),
                  ),
                ExpansionTile(
                  key: WidgetKeys.tenderExpandableSection,
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabled: !cartItem.isTenderContractInvalid,
                  iconColor: ZPColors.black,
                  backgroundColor: ZPColors.tenderUnselectBg,
                  collapsedBackgroundColor: ZPColors.tenderUnselectBg,
                  title: RichText(
                    text: TextSpan(
                      text:
                          '${cartItem.tenderContract.tenderOrderReason.displayTenderContractReason} - ',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: ZPColors.neutralsBlack,
                          ),
                      children: [
                        TextSpan(
                          text: '${context.tr(
                            cartItem.tenderContract.tenderOrderReason
                                .tenderContractReasonTitle,
                          )} ',
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: ZPColors.neutralsBlack,
                                  ),
                        ),
                        TextSpan(
                          text: context.tr(
                            cartItem.tenderContract.contractNumber
                                .displayTenderContractNumber,
                          ),
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: ZPColors.neutralsBlack,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                      child: _ExpandedSection(
                        cartItem: cartItem,
                        isEditButtonRequired: isEditButtonRequired,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}

class _ExpandedSection extends StatelessWidget {
  final PriceAggregate cartItem;
  final bool isEditButtonRequired;
  const _ExpandedSection({
    required this.cartItem,
    this.isEditButtonRequired = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _DetailFieldRow(
          leftTitle: 'Price',
          leftValue: cartItem.tenderContract.tenderUnitPrice.toString(),
          rightTitle: 'Quantity Available',
          rightValue:
              '${cartItem.tenderContract.remainingTenderQuantity}/${cartItem.tenderContract.contractQuantity}',
          isPriceDisplay: true,
        ),
        _DetailFieldRow(
          leftTitle: 'Expiry Date',
          leftValue:
              cartItem.tenderContract.contractExpiryDate.dateTimeOrDashString,
          rightTitle: 'Reference',
          rightValue:
              cartItem.tenderContract.contractReference.displayNAIfEmpty,
        ),
        _DetailFieldRow(
          leftTitle: 'Material Visa No.',
          leftValue:
              cartItem.tenderContract.tenderVisaNumber.displayTenderVisaNumber,
          rightTitle: 'Sale District',
          rightValue: cartItem.tenderContract.salesDistrict.displayNAIfEmpty,
        ),
        _DetailFieldRow(
          leftTitle: 'Announcement Letter No.',
          leftValue: cartItem.tenderContract.announcementLetterNumber
              .displayAnnouncementLetterNumber,
          rightTitle: '',
          rightValue: '',
          editButtonWidget: isEditButtonRequired
              ? _EditButton(
                  materialInfo: cartItem.materialInfo,
                )
              : null,
        ),
      ],
    );
  }
}

class _DetailFieldRow extends StatelessWidget {
  final String leftTitle;
  final String leftValue;
  final String rightTitle;
  final String rightValue;
  final bool isPriceDisplay;
  final Widget? editButtonWidget;
  const _DetailFieldRow({
    required this.leftTitle,
    required this.leftValue,
    this.rightTitle = '',
    this.rightValue = '',
    this.isPriceDisplay = false,
    this.editButtonWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _DetailField(
            title: leftTitle,
            value: leftValue,
            isPriceDisplay: isPriceDisplay,
          ),
        ),
        Expanded(
          child: editButtonWidget != null
              ? editButtonWidget!
              : _DetailField(
                  title: rightTitle,
                  value: rightValue,
                ),
        ),
      ],
    );
  }
}

class _DetailField extends StatelessWidget {
  final String title;
  final String value;
  final bool isPriceDisplay;
  const _DetailField({
    required this.title,
    required this.value,
    this.isPriceDisplay = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr(title),
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: ZPColors.neutralsGrey1,
            ),
          ),
          !isPriceDisplay
              ? Text(
                  value,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: ZPColors.primary,
                      ),
                )
              : PriceComponent(
                  key: WidgetKeys.tenderContractPrice,
                  type: PriceStyle.tenderCartPrice,
                  price: value,
                  salesOrgConfig:
                      context.read<EligibilityBloc>().state.salesOrgConfigs,
                ),
        ],
      ),
    );
  }
}

class _EditButton extends StatelessWidget {
  final MaterialInfo materialInfo;
  const _EditButton({
    required this.materialInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: InkWell(
        key: WidgetKeys.editTenderContractButton,
        onTap: () {
          context.router.pushAndPopUntil(
            ProductDetailsPageRoute(
              materialInfo: materialInfo,
              isEditTender: true,
            ),
            predicate: (Route route) =>
                route.settings.name == HomeNavigationTabbarRoute.name,
          );
        },
        child: Row(
          children: [
            const Icon(
              Icons.edit_outlined,
              color: ZPColors.extraDarkGreen,
              size: 16,
            ),
            Text(
              context.tr('Edit Tender'),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: ZPColors.extraDarkGreen,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
