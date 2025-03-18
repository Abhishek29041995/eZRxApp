part of 'package:ezrxmobile/presentation/returns/return_list/return_by_item_filter/return_by_item_filter_page.dart';

//TODO(Hob): Will fix the duplicate when we apply single filter same with payment
//ignore_for_file: code-duplication
class _RequestAmountRangeInput extends StatelessWidget {
  const _RequestAmountRangeInput();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _AmountValueFromFilter(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: padding6,
            vertical: padding12,
          ),
          child: Text(
            '-',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const _AmountValueToFilter(),
      ],
    );
  }
}

class _AmountValueToFilter extends StatelessWidget {
  const _AmountValueToFilter();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByItemReturnFilterBloc, ViewByItemReturnFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.amountValueTo != current.filter.amountValueTo,
      builder: (
        context,
        state,
      ) {
        return Expanded(
          child: CustomNumericTextField.decimalNumber(
            fieldKey: WidgetKeys.amountValueTo,
            initValue: state.filter.amountValueTo.apiParameterValue,
            onChanged: (value) =>
                context.read<ViewByItemReturnFilterBloc>().add(
                      ViewByItemReturnFilterEvent.setAmountTo(
                        amountTo: value.isNotEmpty ? value : '',
                      ),
                    ),
            decoration: InputDecoration(
              labelText: context.tr('Amount to'),
              labelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.darkGray,
                  ),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(ZPRegexes.twoDecimalOnly),
            ],
          ),
        );
      },
    );
  }
}

class _AmountValueFromFilter extends StatelessWidget {
  const _AmountValueFromFilter();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByItemReturnFilterBloc, ViewByItemReturnFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.amountValueFrom != current.filter.amountValueFrom,
      builder: (
        context,
        state,
      ) {
        return Expanded(
          child: CustomNumericTextField.decimalNumber(
            fieldKey: WidgetKeys.amountValueFrom,
            initValue: state.filter.amountValueFrom.apiParameterValue,
            onChanged: (value) =>
                context.read<ViewByItemReturnFilterBloc>().add(
                      ViewByItemReturnFilterEvent.setAmountFrom(
                        amountFrom: value.isNotEmpty ? value : '',
                      ),
                    ),
            decoration: InputDecoration(
              labelText: context.tr('Amount from'),
              labelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.darkGray,
                  ),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(ZPRegexes.twoDecimalOnly),
            ],
          ),
        );
      },
    );
  }
}
