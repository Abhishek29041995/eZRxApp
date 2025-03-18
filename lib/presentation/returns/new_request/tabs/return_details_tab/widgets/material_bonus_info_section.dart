part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_details_tab/return_details_tab.dart';

class _MaterialBonusInfoSection extends StatelessWidget {
  const _MaterialBonusInfoSection({
    required this.returnItem,
    required this.bonusItem,
  });
  final ReturnMaterial returnItem;
  final ReturnMaterial bonusItem;

  @override
  Widget build(BuildContext context) {
    return ExpandableInfo(
      labelText: context.tr('Bonus details'),
      toggle: _ToggleActiveButton(
        returnItem: returnItem,
        bonusItem: bonusItem,
      ),
      child: Column(
        children: [
          if (!bonusItem.balanceQuantity.isGreaterThanZero)
            InfoLabel(
              margin: EdgeInsets.zero,
              mainColor: ZPColors.priceWarning,
              textValue:
                  'You cannot return this bonus item as there is no balance quantity.'
                      .tr(),
            ),
          BonusMaterialInfo(
            data: bonusItem,
            displayReturnableQuantity: true,
          ),
        ],
      ),
    );
  }
}

class _ToggleActiveButton extends StatelessWidget {
  final ReturnMaterial bonusItem;
  final ReturnMaterial returnItem;

  const _ToggleActiveButton({
    required this.bonusItem,
    required this.returnItem,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewRequestBloc, NewRequestState>(
      buildWhen: (previous, current) =>
          previous.isIncludeBonus(bonusItem.uuid) !=
          current.isIncludeBonus(bonusItem.uuid),
      builder: (context, state) {
        return Row(
          children: [
            Text(
              context.tr('Include bonus'),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ZPColors.neutralsBlack,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light().copyWith(
                  outline: ZPColors.lightGrey,
                ),
              ),
              child: SwitchWidget(
                key: WidgetKeys.toggleIncludeBonusButton,
                disable: !returnItem.balanceQuantity.isGreaterThanZero,
                value: bonusItem.balanceQuantity.isGreaterThanZero &&
                    state.isIncludeBonus(bonusItem.uuid),
                onChanged: (bool value) {
                  if (!returnItem.balanceQuantity.isGreaterThanZero) {
                    return;
                  }
                  context.read<NewRequestBloc>().add(
                        NewRequestEvent.toggleBonusItem(
                          item: bonusItem,
                          included: value,
                        ),
                      );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
