part of 'package:ezrxmobile/presentation/more/section/about_us/about_us_page.dart';

class _OurCertificationsSection extends StatelessWidget {
  final SliderTemplate certifications;
  const _OurCertificationsSection({
    required this.certifications,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: WidgetKeys.aboutUsCertificationsSection,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            certifications.title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: ZPColors.extraDarkGreen,
                ),
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: certifications.certificates
                .map(
                  (e) => _CertificationsItem(
                    certifications: e,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _CertificationsItem extends StatelessWidget {
  final Certifications certifications;
  const _CertificationsItem({
    required this.certifications,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                  children: [
                    TextSpan(
                      text: certifications.certificationType,
                    ),
                    const TextSpan(
                      text: ' | ',
                    ),
                    TextSpan(
                      text: certifications.certificationName,
                    ),
                  ],
                ),
              ),
            ),
            Text(
              certifications.certificationYear,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: ZPColors.darkGray,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          certifications.description,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
