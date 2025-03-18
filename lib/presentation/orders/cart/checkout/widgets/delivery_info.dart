part of 'package:ezrxmobile/presentation/orders/cart/checkout/checkout_page.dart';

class _DeliveryInfo extends StatelessWidget {
  final Map<DeliveryInfoLabel, FocusNode> focusNodes;

  const _DeliveryInfo({
    required this.focusNodes,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdditionalDetailsBloc, AdditionalDetailsState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final config = context.read<EligibilityBloc>().state.salesOrgConfigs;

        return Form(
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: custom.ExpansionTile(
            initiallyExpanded: true,
            maintainState: true,
            title: Text(
              context.tr('Delivery information'),
              key: WidgetKeys.checkoutDeliveryArrowButton,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: ZPColors.neutralsBlack),
            ),
            threeLineTitle: true,
            iconColor: ZPColors.neutralsBlack,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            childrenPadding: const EdgeInsets.only(
              left: 15,
              right: 15,
              bottom: 16,
            ),
            boxBorder: const Border(
              bottom: BorderSide(color: ZPColors.extraLightGrey2),
            ),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CheckoutTextFormField(
                labelText: 'PO reference',
                keyText: 'pOReferenceKey',
                hintText: config.poNumberRequired.poReferenceHintText,
                label: DeliveryInfoLabel.poReference,
                deliveryInfoData: state.deliveryInfoData,
                focusNode:
                    focusNodes[DeliveryInfoLabel.poReference] ?? FocusNode(),
                maxLength: config.poReferenceLength == 0 ? null : config.poReferenceLength,
              ),
              if (config.enableFutureDeliveryDay) const _RequestDeliveryDate(),
              if (config.enableReferenceNote)
                _CheckoutTextFormField(
                  labelText: 'Reference note',
                  keyText: 'referenceNoteKey',
                  hintText: 'Enter reference note (Optional)',
                  maxLength: config.referenceNoteLength == 0 ? null : config.referenceNoteLength,
                  label: DeliveryInfoLabel.referenceNote,
                  deliveryInfoData: state.deliveryInfoData,
                  focusNode: focusNodes[DeliveryInfoLabel.referenceNote] ??
                      FocusNode(),
                ),
              if (config.enablePaymentTerms)
                _PaymentTerm(
                  deliveryInfoData: state.deliveryInfoData,
                  focusNode:
                      focusNodes[DeliveryInfoLabel.paymentTerm] ?? FocusNode(),
                ),
              if (config.enableMobileNumber)
                _CheckoutTextFormField(
                  labelText: 'Contact person',
                  keyText: 'contactPersonKey',
                  hintText: 'Enter contact person name',
                  maxLength: 35,
                  label: DeliveryInfoLabel.contactPerson,
                  deliveryInfoData: state.deliveryInfoData,
                  focusNode: focusNodes[DeliveryInfoLabel.contactPerson] ??
                      FocusNode(),
                ),
              if (config.enableMobileNumber)
                _CheckoutTextFormField(
                  labelText: 'Contact number',
                  keyText: 'contactNumberKey',
                  hintText: 'Enter contact person number',
                  maxLength: 16,
                  label: DeliveryInfoLabel.mobileNumber,
                  keyboardType: TextInputType.phone,
                  deliveryInfoData: state.deliveryInfoData,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  focusNode:
                      focusNodes[DeliveryInfoLabel.mobileNumber] ?? FocusNode(),
                ),
              if (config.enableSpecialInstructions)
                _CheckoutTextFormField(
                  labelText: 'Delivery instructions',
                  keyText: 'deliveryInstructionKey',
                  hintText: 'Enter delivery instructions(Optional)',
                  keyboardType: TextInputType.multiline,
                  label: DeliveryInfoLabel.deliveryInstruction,
                  deliveryInfoData: state.deliveryInfoData,
                  focusNode:
                      focusNodes[DeliveryInfoLabel.deliveryInstruction] ??
                          FocusNode(),
                  maxLength: 132,
                ),
              if (config.showPOAttachment) ...[
                if (context
                    .read<CartBloc>()
                    .state
                    .cartProducts
                    .containPoisonMaterial)
                  const _PoisonDocumentsIncluded(),
                const PoAttachmentUpload(),
              ],
            ],
          ),
        );
      },
    );
  }
}

class _CheckoutTextFormField extends StatefulWidget {
  final String labelText;
  final String keyText;
  final String hintText;
  final DeliveryInfoLabel label;
  final TextInputType keyboardType;
  final DeliveryInfoData deliveryInfoData;
  final FocusNode focusNode;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  const _CheckoutTextFormField({
    required this.labelText,
    required this.keyText,
    required this.label,
    this.keyboardType = TextInputType.text,
    required this.deliveryInfoData,
    this.hintText = '',
    required this.focusNode,
    this.maxLength,
    this.inputFormatters,
  });

  @override
  State<_CheckoutTextFormField> createState() => _CheckoutTextFormFieldState();
}

class _CheckoutTextFormFieldState extends State<_CheckoutTextFormField> {
  late final _controller = TextEditingController(text: _data);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant _CheckoutTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    //This check is required for keyboard with Chinese character to work
    //This prevent _updateValue() called every time the data is updated, only update
    //the controller whenever new text is different from the current text stored inside controller
    if (_data != _controller.text) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _controller.text = _data;
      });
    }
  }

  String get _data {
    switch (widget.label) {
      case DeliveryInfoLabel.poReference:
        return widget.deliveryInfoData.poReference.getValue();
      case DeliveryInfoLabel.deliveryInstruction:
        return widget.deliveryInfoData.deliveryInstruction.getValue();
      case DeliveryInfoLabel.contactPerson:
        return widget.deliveryInfoData.contactPerson.getValue();
      case DeliveryInfoLabel.referenceNote:
        return widget.deliveryInfoData.referenceNote.getValue();
      case DeliveryInfoLabel.mobileNumber:
        return widget.deliveryInfoData.mobileNumber.getValue();
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdditionalDetailsBloc, AdditionalDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Focus(
            onFocusChange: (hasFocus) {
              if (!hasFocus) {
                context.read<AdditionalDetailsBloc>().add(
                      AdditionalDetailsEvent.onTextChange(
                        label: widget.label,
                        newValue: StringValue.trimmed(_controller.text)
                            .formattedValue,
                      ),
                    );
              }
            },
            child: TextFieldWithLabel(
              focusNode: widget.focusNode,
              fieldKey: WidgetKeys.genericKey(key: widget.keyText),
              labelText: context.tr(widget.labelText),
              controller: _controller,
              validator: (_) => _validateForm(
                label: widget.label,
                context: context,
              ),
              maxLines: widget.keyboardType == TextInputType.multiline ? 3 : 1,
              keyboardType: widget.keyboardType,
              maxLength: widget.maxLength,
              onChanged: (value) {
                context.read<AdditionalDetailsBloc>().add(
                      AdditionalDetailsEvent.onTextChange(
                        label: widget.label,
                        newValue: value,
                      ),
                    );
              },
              inputFormatters: widget.inputFormatters,
              decoration: InputDecoration(
                hintText: context.tr(widget.hintText),
                suffixIcon: state.isLoading
                    ? const Padding(
                        padding: EdgeInsetsDirectional.only(end: 10),
                        child: SizedBox(
                          height: 15,
                          width: 15,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      )
                    : null,
              ),
            ),
          ),
        );
      },
    );
  }

  String? _validateForm({
    required DeliveryInfoLabel label,
    required BuildContext context,
  }) {
    final config = context.read<EligibilityBloc>().state.salesOrgConfigs;
    switch (label) {
      case DeliveryInfoLabel.poReference:
        return config.poNumberRequired.getOrDefaultValue(false)
            ? context
                .read<AdditionalDetailsBloc>()
                .state
                .deliveryInfoData
                .poReference
                .value
                .fold(
                  (f) => f.maybeMap(
                    empty: (_) =>
                        context.tr('PO reference is a required field.'),
                    orElse: () => null,
                  ),
                  (_) => null,
                )
            : null;
      case DeliveryInfoLabel.contactPerson:
        return context
            .read<AdditionalDetailsBloc>()
            .state
            .deliveryInfoData
            .contactPerson
            .value
            .fold(
              (f) => f.maybeMap(
                empty: (_) => context.tr('Contact person is a required field'),
                orElse: () => null,
              ),
              (_) => null,
            );
      case DeliveryInfoLabel.mobileNumber:
        return context
            .read<AdditionalDetailsBloc>()
            .state
            .deliveryInfoData
            .mobileNumber
            .value
            .fold(
              (f) => f.maybeMap(
                empty: (_) => context.tr('Contact number is a required field'),
                orElse: () => null,
              ),
              (_) => null,
            );

      default:
        return null;
    }
  }
}

class _PaymentTerm extends StatelessWidget {
  final DeliveryInfoData deliveryInfoData;
  final FocusNode focusNode;

  const _PaymentTerm({
    required this.deliveryInfoData,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdditionalDetailsBloc, AdditionalDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, additionalDetailsState) {
        final isLoading = additionalDetailsState.isLoading;

        return BlocBuilder<PaymentTermBloc, PaymentTermState>(
          key: WidgetKeys.paymentTermKey,
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching,
          builder: (context, state) {
            final paymentTerm = deliveryInfoData.paymentTerm;

            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.tr('Payment term'),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    focusNode: focusNode,
                    key: WidgetKeys.paymentTermDropdownKey,
                    isExpanded: true,
                    hint: Text(context.tr('Select one')),
                    icon: isLoading
                        ? const SizedBox(
                            height: 15,
                            width: 15,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(
                            Icons.expand_more_outlined,
                            size: 22,
                            color: ZPColors.primary,
                          ),
                    value: state.paymentTerms.displaySelected(paymentTerm),
                    items: state.paymentTerms.display.map(
                      (String val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(val),
                        );
                      },
                    ).toList(),
                    onChanged: isLoading
                        ? null
                        : (value) {
                            context.read<AdditionalDetailsBloc>().add(
                                  AdditionalDetailsEvent.onTextChange(
                                    label: DeliveryInfoLabel.paymentTerm,
                                    newValue: value!,
                                  ),
                                );
                          },
                    validator: (_) {
                      return context
                          .read<AdditionalDetailsBloc>()
                          .state
                          .deliveryInfoData
                          .paymentTerm
                          .value
                          .fold(
                            (f) => f.maybeMap(
                              empty: (_) =>
                                  context.tr('Please Select Payment Term'),
                              orElse: () => null,
                            ),
                            (_) => null,
                          );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _PoisonDocumentsIncluded extends StatelessWidget {
  const _PoisonDocumentsIncluded();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: context.tr('Poison item(s) reference document(s)'),
            style: Theme.of(context).textTheme.labelSmall,
            children: const <TextSpan>[
              TextSpan(
                text: ' *',
                style: TextStyle(color: ZPColors.red),
              ),
            ],
          ),
        ),
        const SizedBox(height: padding6),
        BlocBuilder<AdditionalDetailsBloc, AdditionalDetailsState>(
          buildWhen: (previous, current) =>
              previous.deliveryInfoData.poisonRefDocumentsIncluded !=
              current.deliveryInfoData.poisonRefDocumentsIncluded,
          builder: (context, state) {
            final bloc = context.read<AdditionalDetailsBloc>();
            final groupValue =
                state.deliveryInfoData.poisonRefDocumentsIncluded;

            return Row(
              children: [
                RadioWithLabel<bool>(
                  groupValue: groupValue,
                  value: true,
                  onChanged: (value) => bloc.add(
                    AdditionalDetailsEvent.updateIncludePoisonRefDoucments(
                      value,
                    ),
                  ),
                  title: context.tr('Yes'),
                ),
                const SizedBox(width: padding12),
                RadioWithLabel<bool>(
                  groupValue: groupValue,
                  value: false,
                  onChanged: (value) => bloc.add(
                    AdditionalDetailsEvent.updateIncludePoisonRefDoucments(
                      value,
                    ),
                  ),
                  title: context.tr('No'),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: padding24),
      ],
    );
  }
}
