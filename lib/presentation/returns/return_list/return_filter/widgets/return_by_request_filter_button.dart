part of 'package:ezrxmobile/presentation/returns/return_list/return_filter/return_by_request_filter_page.dart';

class _ResetButton extends StatelessWidget {
  const _ResetButton();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        key: WidgetKeys.filterResetButton,
        onPressed: () {
          context.read<ViewByRequestReturnFilterBloc>().add(
                const ViewByRequestReturnFilterEvent.resetFilters(),
              );
          Navigator.of(context).pop(
            ReturnFilter.empty(),
          );
        },
        child: Text(
          context.tr('Reset'),
          style: const TextStyle(color: ZPColors.primary),
        ),
      ),
    );
  }
}

class _ApplyButton extends StatelessWidget {
  const _ApplyButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByRequestReturnFilterBloc,
        ViewByRequestReturnFilterState>(
      buildWhen: (previous, current) => previous.filter != current.filter,
      builder: (context, state) {
        return Expanded(
          child: ElevatedButton(
            key: WidgetKeys.filterApplyButton,
            onPressed: () => _onPressed(context: context),
            child: Text(
              context.tr('Apply'),
              style: const TextStyle(color: ZPColors.white),
            ),
          ),
        );
      },
    );
  }

  void _onPressed({
    required BuildContext context,
  }) {
    final isValid = context
        .read<ViewByRequestReturnFilterBloc>()
        .state
        .filter
        .isReturnAmountValueRangeValid;
    isValid
        ? Navigator.of(context).pop(
            context.read<ViewByRequestReturnFilterBloc>().state.filter,
          )
        : context.read<ViewByRequestReturnFilterBloc>().add(
              const ViewByRequestReturnFilterEvent.setValidationFailure(),
            );
  }
}
