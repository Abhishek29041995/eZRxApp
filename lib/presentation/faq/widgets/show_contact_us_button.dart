part of 'package:ezrxmobile/presentation/faq/faq_info.dart';

class _ShowContactUsButton extends StatelessWidget {
  const _ShowContactUsButton();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Can’t find what you’re looking for?'.tr(),
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: ZPColors.darkerGrey),
        ),
        const SizedBox(
          height: 10,
        ),
        const ContactUsButton(),
      ],
    );
  }
}
