part of 'package:ezrxmobile/presentation/account/profile/profile_page.dart';

class _LicenseTile extends StatelessWidget {
  const _LicenseTile({
    required this.customerLicense,
  });

  final CustomerLicense customerLicense;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      key: WidgetKeys.profileLicenseTile,
      padding: const EdgeInsets.all(padding12),
      margin: const EdgeInsets.all(padding12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  '${customerLicense.licenseType.displayNAIfEmpty} - ${customerLicense.licenseDescription.displayNAIfEmpty}',
                  key: WidgetKeys.profileLicenseName,
                  style: Theme.of(context).textTheme.labelSmall,
                  overflow: TextOverflow.visible,
                ),
              ),
              StatusLabel(
                key: WidgetKeys.profileLicenseStatus,
                status: customerLicense.licenseStatus,
              ),
            ],
          ),
          RichText(
            key: WidgetKeys.profileLicenseNo,
            text: TextSpan(
              text: 'License no:'.tr(),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: ZPColors.darkGray),
              children: <TextSpan>[
                const TextSpan(text: ' - '),
                TextSpan(
                  text: customerLicense.licenseNumbers.displayNAIfEmpty,
                ),
              ],
            ),
          ),
          const SizedBox(height: padding12),
          RichText(
            key: WidgetKeys.profileLicenseDateRange,
            text: TextSpan(
              text: 'From '.tr(),
              style: Theme.of(context).textTheme.labelSmall,
              children: <TextSpan>[
                TextSpan(
                  text: customerLicense.validFrom.dateTimeOrNaString,
                ),
                TextSpan(
                  text: ' to '.tr(),
                ),
                TextSpan(
                  text: customerLicense.validTo.dateTimeOrNaString,
                ),
              ],
            ),
          ),
          customerLicense.validTo.aWeekDifference
              ? Row(
                  children: [
                    const Icon(
                      Icons.info,
                      color: ZPColors.skyBlueColor,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Expiring in 7 days'.tr(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: ZPColors.skyBlueColor,
                          ),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
