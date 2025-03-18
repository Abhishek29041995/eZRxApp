part of 'package:ezrxmobile/presentation/payments/statement_accounts/statement_accounts.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EligibilityBloc, EligibilityState>(
      buildWhen: (previous, current) =>
          previous.customerCodeInfo != current.customerCodeInfo,
      builder: (context, state) {
        return Container(
          color: ZPColors.primary,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: double.infinity),
              Text(
                state.shipToInfo.shipToName.name1,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: ZPColors.white),
              ),
              const SizedBox(height: 10),
              RichText(
                key: WidgetKeys.soaHeaderCustomerCodeKey,
                text: TextSpan(
                  text: context.tr('Customer Code : '),
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: ZPColors.white),
                  children: <TextSpan>[
                    TextSpan(
                      text: state.customerCodeInfo.customerCodeSoldTo,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              Text(
                state.customerCodeInfo.shortAddress,
                maxLines: 3,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: ZPColors.white),
              ),
            ],
          ),
        );
      },
    );
  }
}
