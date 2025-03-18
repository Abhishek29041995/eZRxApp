part of 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart';

class _OrderSuccessMessage extends StatelessWidget {
  final OrderStepValue orderStatus;

  const _OrderSuccessMessage({
    required this.orderStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      key: WidgetKeys.orderSuccessMessage,
      children: [
        SvgPicture.asset(
          orderStatus.orderConfirmationIcon,
          fit: BoxFit.fitHeight,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding12),
          child: Text(
            '${context.tr(orderStatus.orderConfirmationPrefixMessage)} ${context.read<EligibilityBloc>().state.user.email.maskedValue} ${context.tr(orderStatus.orderConfirmationSuffixMessage)}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ZPColors.darkerGrey,
                ),
          ),
        ),
        const SizedBox(height: padding12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding12),
          child: ListTile(
            tileColor: ZPColors.lightBlueColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
            ),
            horizontalTitleGap: 8,
            titleAlignment: ListTileTitleAlignment.titleHeight,
            leading: const Icon(
              Icons.info,
              color: ZPColors.skyBlueColor,
              size: 24,
            ),
            title: Text(
              context.tr("What's next?"),
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: ZPColors.black,
                  ),
            ),
            subtitle: RichText(
              text: TextSpan(
                text: context.tr('Track your ordered items under'),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: ZPColors.darkGray,
                    ),
                children: <TextSpan>[
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: '${context.tr('Orders')}.',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: ZPColors.extraDarkGreen,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () =>
                          context.router.navigateNamed('/main/orders_tab'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
