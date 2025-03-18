part of 'package:ezrxmobile/presentation/more/section/about_us/about_us_page.dart';

class _OurPartnersSection extends StatelessWidget {
  final MediaListTemplate ourPartners;
  const _OurPartnersSection({
    required this.ourPartners,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: WidgetKeys.aboutUsOutPartnersSection,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ourPartners.title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: ZPColors.extraDarkGreen,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            ourPartners.description,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Wrap(
            runSpacing: 8,
            spacing: 8,
            alignment: WrapAlignment.center,
            children: ourPartners.mediaItems
                .map(
                  (e) => CustomImage(
                    imageUrl: e.url,
                    height: 50,
                    width: 80,
                    fit: BoxFit.contain,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
