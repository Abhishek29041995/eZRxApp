part of 'package:ezrxmobile/presentation/payments/statement_accounts/statement_accounts.dart';

class _SOAFilterBottomSheet extends StatelessWidget {
  const _SOAFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AppBar(
            title: Text(
              context.tr('Filter by month'),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: ZPColors.transparent,
            automaticallyImplyLeading: false,
            centerTitle: false,
            elevation: 0,
            actions: [
              IconButton(
                key: WidgetKeys.closeButton,
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.clear,
                  color: ZPColors.black,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 12.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    const _FromDateField(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        '-',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    const _ToDateField(),
                  ],
                ),
                BlocBuilder<SoaFilterBloc, SoaFilterState>(
                  buildWhen: (previous, current) =>
                      previous.filter.isAppliedFilterMonthRangeValid !=
                      current.filter.isAppliedFilterMonthRangeValid,
                  builder: (context, state) {
                    return !state.filter.isAppliedFilterMonthRangeValid
                        ? ValueRangeError(
                            label: '${(context.tr('Invalid Month range'))}!',
                            isValid:
                                state.filter.isAppliedFilterMonthRangeValid,
                          )
                        : const SizedBox.shrink();
                  },
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    _ResetButton(),
                    SizedBox(width: 12),
                    _ApplyButton(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FromDateField extends StatelessWidget {
  const _FromDateField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SoaFilterBloc, SoaFilterState>(
      buildWhen: (previous, current) => previous.filter != current.filter,
      builder: (context, state) => Expanded(
        child: TextFormField(
          key: WidgetKeys.soaFromDateFieldKey,
          autocorrect: false,
          onTap: () => _selectDate(context),
          readOnly: true,
          controller: TextEditingController(
            text: state.filter.fromDate.simpleDateString,
          ),
          decoration: InputDecoration(
            hintText: context.tr('Date from'),
            suffixIcon: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.calendar_month,
                size: 20,
              ),
            ),
            suffixIconConstraints: const BoxConstraints(maxWidth: 25),
            focusedBorder:
                Theme.of(context).inputDecorationTheme.disabledBorder,
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final soaFilterBloc = context.read<SoaFilterBloc>();
    final formDate = await showMonthPicker(
      context: context,
      initialDate: soaFilterBloc.state.filter.fromDate.dateTime,
    );
    if (formDate == null) return;
    if (context.mounted) {
      soaFilterBloc.add(
        SoaFilterEvent.changeFormDate(
          DateTimeStringValue(getDateStringByDateTime(formDate)),
        ),
      );
    }
  }
}

class _ToDateField extends StatelessWidget {
  const _ToDateField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SoaFilterBloc, SoaFilterState>(
      buildWhen: (previous, current) => previous.filter != current.filter,
      builder: (context, state) => Expanded(
        child: TextFormField(
          key: WidgetKeys.soaToDateFieldKey,
          autocorrect: false,
          onTap: () => _selectDate(context),
          readOnly: true,
          controller: TextEditingController(
            text: state.filter.toDate.simpleDateString,
          ),
          decoration: InputDecoration(
            hintText: context.tr('Date to'),
            suffixIcon: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.calendar_month,
                size: 20,
              ),
            ),
            suffixIconConstraints: const BoxConstraints(maxWidth: 25),
            focusedBorder:
                Theme.of(context).inputDecorationTheme.disabledBorder,
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final soaFilterBloc = context.read<SoaFilterBloc>();
    final toDate = await showMonthPicker(
      context: context,
      initialDate: soaFilterBloc.state.filter.toDate.dateTime,
    );
    if (toDate == null) return;
    if (context.mounted) {
      soaFilterBloc.add(
        SoaFilterEvent.changeToDate(
          DateTimeStringValue(getDateStringByDateTime(toDate)),
        ),
      );
    }
  }
}

class _ResetButton extends StatelessWidget {
  const _ResetButton();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        key: WidgetKeys.soaFilterResetButtonKey,
        onPressed: () => Navigator.of(context).pop(SoaFilter.empty()),
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
    return Expanded(
      child: ElevatedButton(
        key: WidgetKeys.soaFilterApplyButtonKey,
        onPressed: () {
          if (context
              .read<SoaFilterBloc>()
              .state
              .filter
              .isAppliedFilterMonthRangeValid) {
            Navigator.of(context).pop(
              context.read<SoaFilterBloc>().state.filter,
            );
          }
        },
        child: Text(
          context.tr('Apply'),
          style: const TextStyle(color: ZPColors.white),
        ),
      ),
    );
  }
}
