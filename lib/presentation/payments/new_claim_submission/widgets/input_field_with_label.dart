part of 'package:ezrxmobile/presentation/payments/new_claim_submission/new_claim_submission_page.dart';

class _ClaimDetailField extends StatelessWidget {
  const _ClaimDetailField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewClaimSubmissionBloc, NewClaimSubmissionState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: TextFieldWithLabel(
            isEnabled: !state.isLoading,
            fieldKey: WidgetKeys.newClaimClaimDetailsTextField,
            labelText: context.tr('Claim details'),
            mandatory: true,
            maxLines: 3,
            keyboardType: TextInputType.multiline,
            onChanged: (value) => context.read<NewClaimSubmissionBloc>().add(
                  NewClaimSubmissionEvent.onClaimDetailsChange(
                    claimDetails: value,
                  ),
                ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              hintText: context.tr('Enter claim details'),
            ),
          ),
        );
      },
    );
  }
}

class _ClaimTypeField extends StatelessWidget {
  const _ClaimTypeField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewClaimSubmissionBloc, NewClaimSubmissionState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: DropdownWithLabel(
            fieldKey: WidgetKeys.newClaimClaimTypeDropdown,
            labelText: context.tr('Claim type'),
            mandatory: true,
            onChanged: state.isLoading
                ? null
                : (value) {
                    context.read<NewClaimSubmissionBloc>().add(
                          NewClaimSubmissionEvent.onSelectClaimType(
                            claimType:
                                ClaimType(int.tryParse(value ?? '-1') ?? -1),
                          ),
                        );
                  },
            hintText: context.tr('Select type'),
            initialValue: '',
            items: ClaimType.supportClaimTypes.map(
              (claimType) {
                return DropdownMenuItem(
                  value: claimType.getOrDefaultValue(-1).toString(),
                  alignment: AlignmentDirectional.centerStart,
                  key: WidgetKeys.newRequestStepsDropdownItem(
                    claimType.data,
                  ),
                  child: Text(context.tr(claimType.title)),
                );
              },
            ).toList(),
            validator: (value) {
              return null;
            },
          ),
        );
      },
    );
  }
}

class _ClaimAmountField extends StatelessWidget {
  const _ClaimAmountField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewClaimSubmissionBloc, NewClaimSubmissionState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: CustomNumericTextField.decimalNumber(
            isEnabled: !state.isLoading,
            fieldKey: WidgetKeys.newClaimClaimAmountTextField,
            labelText:
                '${context.tr('Claim amount')} (${context.read<EligibilityBloc>().state.salesOrgConfigs.currency.code})',
            mandatory: true,
            decoration: const InputDecoration(
              hintText: '0.00',
            ),
            onChanged: (value) {
              context.read<NewClaimSubmissionBloc>().add(
                    NewClaimSubmissionEvent.onClaimAmountChange(
                      amount: double.tryParse(value) ?? 0,
                    ),
                  );
            },
          ),
        );
      },
    );
  }
}

class _PrincipalSearchField extends StatefulWidget {
  const _PrincipalSearchField();

  @override
  State<_PrincipalSearchField> createState() => __PrincipalSearchFieldState();
}

class __PrincipalSearchFieldState extends State<_PrincipalSearchField> {
  final _focus = FocusNode();
  final _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  SearchFieldListItem<PrincipalData> _searchItem(PrincipalData data) =>
      SearchFieldListItem<PrincipalData>(
        data.searchItemText,
        item: data,
        child: Text(
          data.searchItemText,
          key: WidgetKeys.newClaimPrincipalCodeTextFieldItem,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewClaimSubmissionBloc, NewClaimSubmissionState>(
      buildWhen: (previous, current) =>
          previous.isLoading != current.isLoading ||
          previous.principalList != current.principalList ||
          previous.isPrincipalLoading != current.isPrincipalLoading ||
          previous.claimSubmission.principal !=
              current.claimSubmission.principal,
      builder: (context, state) {
        final principalState = state.claimSubmission.principal;

        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: context.tr('Principal code/ name'),
                  style: Theme.of(context).textTheme.labelSmall,
                  children: <TextSpan>[
                    TextSpan(
                      text: ' *',
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: ZPColors.red),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Focus(
                onFocusChange: (hasFocus) {
                  if (hasFocus) return;
                  final principal =
                      state.principalList.getByText(_controller.text);
                  if (principal.isEmpty && principalState.isNotEmpty) {
                    // When user manually types the incorrect item text then fill the current principal data to the field
                    _controller.text = principalState.searchItemText;
                  } else {
                    // When user manually types the correct item text then update the principal data
                    context.read<NewClaimSubmissionBloc>().add(
                          NewClaimSubmissionEvent.onSelectPrincipal(
                            principal: principal,
                          ),
                        );
                  }
                },
                child: SearchField(
                  enabled: !state.isLoading,
                  key: WidgetKeys.newClaimPrincipalCodeTextField,
                  controller: _controller,
                  onSearchTextChanged: (query) => state.principalList
                      .listContainText(query)
                      .map((e) => _searchItem(e))
                      .toList(),
                  onTap: () => _controller.clear(),
                  hint: principalState.isEmpty
                      ? context.tr('Search principal code/name')
                      : principalState.searchItemText,
                  suggestions:
                      state.principalList.map((e) => _searchItem(e)).toList(),
                  focusNode: _focus,
                  suggestionState: Suggestion.expand,
                  onSuggestionTap: (SearchFieldListItem<PrincipalData> item) {
                    context.read<NewClaimSubmissionBloc>().add(
                          NewClaimSubmissionEvent.onSelectPrincipal(
                            principal: item.item ?? PrincipalData.empty(),
                          ),
                        );
                    _focus.unfocus();
                  },
                  emptyWidget: state.isPrincipalLoading
                      ? Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: LoadingShimmer.logo(
                            key: WidgetKeys.loaderImage,
                          ),
                        )
                      : const SizedBox.shrink(),
                  searchInputDecoration: InputDecoration(
                    hintStyle:
                        Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: ZPColors.backgroundCloseButtonSnackBar,
                            ),
                    suffixIcon: const Icon(
                      Icons.search,
                      color: ZPColors.primary,
                      size: 24,
                    ),
                  ),
                  searchStyle: Theme.of(context).textTheme.titleMedium,
                  suggestionItemDecoration:
                      const BoxDecoration(border: Border()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
