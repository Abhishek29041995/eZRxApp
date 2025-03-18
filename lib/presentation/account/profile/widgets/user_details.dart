part of 'package:ezrxmobile/presentation/account/profile/profile_page.dart';

class _UserDetails extends StatelessWidget {
  const _UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.all(padding12),
      margin: const EdgeInsets.all(padding12),
      child: BlocBuilder<UserBloc, UserState>(
        buildWhen: (previous, current) => previous.user != current.user,
        builder: (context, state) {
          return Column(
            children: [
              BalanceTextRow(
                keyFlex: 3,
                valueFlex: 5,
                keyText: context.tr('First name'),
                valueText: state.user.fullName.firstName,
                keyTextStyle: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: ZPColors.neutralsBlack),
                valueTextStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: ZPColors.neutralsBlack),
              ),
              const SizedBox(height: padding12),
              BalanceTextRow(
                keyFlex: 3,
                valueFlex: 5,
                keyText: context.tr('Last name'),
                valueText: state.user.fullName.lastName,
                keyTextStyle: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: ZPColors.neutralsBlack),
                valueTextStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: ZPColors.neutralsBlack),
              ),
              const SizedBox(height: padding12),
              BalanceTextRow(
                keyFlex: 3,
                valueFlex: 5,
                keyText: context.tr('Email'),
                valueText: state.user.email.getOrDefaultValue(''),
                keyTextStyle: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: ZPColors.neutralsBlack),
                valueTextStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: ZPColors.neutralsBlack),
              ),
              const SizedBox(height: padding12),
              BalanceTextRow(
                keyFlex: 3,
                valueFlex: 5,
                keyText: context.tr('Username'),
                valueText: state.user.username.getOrDefaultValue(''),
                keyTextStyle: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: ZPColors.neutralsBlack),
                valueTextStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: ZPColors.neutralsBlack),
              ),
              const SizedBox(height: padding12),
              BalanceTextRow(
                keyFlex: 3,
                valueFlex: 5,
                keyText: context.tr('Contact number'),
                valueText: state.user.mobileNumber.displayTelephoneNumber,
                keyTextStyle: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: ZPColors.neutralsBlack),
                valueTextStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: ZPColors.neutralsBlack),
              ),
              const SizedBox(height: padding12),
              if (!context
                  .read<EligibilityBloc>()
                  .state
                  .disablePaymentTermsDisplayForCustomer)
                BalanceTextRow(
                  keyFlex: 3,
                  valueFlex: 5,
                  keyText: context.tr('Payment terms'),
                  valueText: context
                      .read<EligibilityBloc>()
                      .state
                      .customerCodeInfo
                      .displayPaymentTerm,
                  keyTextStyle: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: ZPColors.neutralsBlack),
                  valueTextStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: ZPColors.neutralsBlack),
                ),
              const SizedBox(height: padding12),
              const _LanguageDropDown(),
              const SizedBox(height: padding12),
            ],
          );
        },
      ),
    );
  }
}
