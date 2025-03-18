part of 'package:ezrxmobile/presentation/account/profile/profile_page.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: padding12, top: padding24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.tr('Account & business details:'),
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                context.tr('Your account details & business details'),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.darkGray,
                    ),
              ),
            ],
          ),
        ),
        const _UserDetails(
          key: WidgetKeys.profileUserDetails,
        ),
        Padding(
          padding: const EdgeInsets.only(left: padding12, top: padding24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.tr('License information:'),
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                context.tr('Listing all your ZP licenses'),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.darkGray,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
