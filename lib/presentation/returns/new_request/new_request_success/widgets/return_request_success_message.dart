part of 'package:ezrxmobile/presentation/returns/new_request/new_request_success/new_request_successful_page.dart';

class _ReturnRequestSuccessMessage extends StatelessWidget {
  const _ReturnRequestSuccessMessage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: WidgetKeys.newRequestSuccessMessage,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          SvgPicture.asset(
            SvgImage.orderCreated,
            fit: BoxFit.fitHeight,
          ),
          const SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              '${'We’ll send a confirmation to'.tr()} ${context.read<EligibilityBloc>().state.user.email.maskedValue} ${'once your return has been approved.'.tr()}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: ZPColors.darkerGrey,
                  ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ListTile(
              tileColor: ZPColors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              horizontalTitleGap: 10,
              leading: const Padding(
                padding: EdgeInsets.only(bottom: 18),
                child: Icon(
                  Icons.info,
                  color: ZPColors.skyBlueColor,
                  size: 24,
                ),
              ),
              title: Text(
                context.tr("What's next?"),
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: ZPColors.black,
                    ),
              ),
              subtitle: RichText(
                text: TextSpan(
                  text: 'Track your returned items under '.tr(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: ZPColors.darkGray,
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Returns'.tr(),
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: ZPColors.extraDarkGreen,
                          ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.router.maybePop();
                        },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
