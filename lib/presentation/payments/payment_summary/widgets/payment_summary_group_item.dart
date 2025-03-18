part of 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_page.dart';

class _PaymentSummaryGroupItem extends StatelessWidget {
  final PaymentSummaryGroup paymentSummaryGroup;
  final bool showDivider;

  const _PaymentSummaryGroupItem({
    super.key,
    required this.paymentSummaryGroup,
    required this.showDivider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showDivider)
          const Divider(
            indent: 0,
            height: 20,
            endIndent: 0,
            color: ZPColors.lightGray2,
          ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 16),
          child: Text(
            '${context.tr('Created on')} ${paymentSummaryGroup.createdDate.dateString}',
            key: WidgetKeys.paymentSummaryGroupDate,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.apply(color: ZPColors.lightGray),
          ),
        ),
        ...paymentSummaryGroup.details
            .map((e) => _PaymentSummaryItem(details: e)),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _PaymentSummaryItem extends StatelessWidget {
  final PaymentSummaryDetails details;

  const _PaymentSummaryItem({
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    final salesOrg = context.read<EligibilityBloc>().state.salesOrg;

    return CustomCard(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: ListTile(
        key: WidgetKeys.paymentSummaryTile,
        onTap: () {
          trackMixpanelEvent(TrackingEvents.paymentDocumentViewed);
          context.read<PaymentSummaryDetailsBloc>().add(
                PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
                  details: details,
                  isMarketPlace: context.isMPPayment,
                ),
              );
          context.router.push(
            PaymentSummaryDetailsPageRoute(
              isMarketPlace: context.isMPPayment,
            ),
          );
        },
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (context.isMPPayment) ...[
              MarketPlaceLogo.small(),
              const SizedBox(width: 8),
            ],
            Expanded(
              child: Text(
                '${salesOrg.paymentIdPretext} #${details.zzAdvice.getValue()}',
                key: WidgetKeys.commonTileItemLabel,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            StatusLabel(
              key: WidgetKeys.paymentSummaryTileStatus,
              status: StatusType(details.status.displayStatusText),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _PaymentDateInfo(details: details),
              PriceComponent(
                key: WidgetKeys.paymentSummaryAmountAndCurrency,
                price: details.paymentAmount.toString(),
                salesOrgConfig:
                    context.read<EligibilityBloc>().state.salesOrgConfigs,
                priceLabelStyle: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PaymentDateInfo extends StatelessWidget {
  final PaymentSummaryDetails details;
  const _PaymentDateInfo({
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    final isIDMarket = context.read<EligibilityBloc>().state.salesOrg.isID;

    final displayPaymentDate = details.paymentDate.isValid()
        ? DateFormat(
            DateTimeFormatString.displayDateFormat,
            context.locale.languageCode,
          ).format(details.paymentDate.dateTime)
        : 'NA';

    if (isIDMarket && details.status.isExpiredOrCanceled) {
      return const SizedBox.shrink();
    }

    final expiresDate =
        isIDMarket ? details.idAdviceExpiryText : details.adviceExpiryText;

    return Column(
      children: [
        Text(
          details.status.getIsSuccessfulOrProcessed
              ? '${context.tr('Payment date')}: $displayPaymentDate'
              : context.tr(
                  expiresDate.message,
                  namedArgs: expiresDate.arguments,
                ),
          key: WidgetKeys.paymentSummaryDateOrExpiry,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: details.status.getPaymentDisplayStatusTextColor,
              ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
