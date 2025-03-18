
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/payments/entities/bank_instruction.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/payments/widgets/detail_info_section.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class TransferMethodsSection extends StatelessWidget {
  const TransferMethodsSection({
    super.key,
    required this.visible,
    required this.bankInstruction,
  });
  final bool visible;
  final BankInstruction bankInstruction;
  @override
  Widget build(BuildContext context) {
    return visible
        ? DetailsInfoSection(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            label: 'Transfer methods',
            labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: ZPColors.primary,
                  fontWeight: FontWeight.w600,
                ),
            child: Column(
              children: bankInstruction.transferMethods
                  .map(
                    (e) => _ExpandableTransferMethodItem(
                      transferMethod: e,
                    ),
                  )
                  .toList(),
            ),
          )
        : const SizedBox.shrink();
  }
}

class _ExpandableTransferMethodItem extends StatefulWidget {
  final TransferMethod transferMethod;
  const _ExpandableTransferMethodItem({
    required this.transferMethod,
  });

  @override
  State<_ExpandableTransferMethodItem> createState() =>
      __ExpandableTransferMethodItemState();
}

class __ExpandableTransferMethodItemState
    extends State<_ExpandableTransferMethodItem> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.tr(widget.transferMethod.title),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: ZPColors.primary,
                      ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
              ],
            ),
          ),
          if (_isExpanded)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 12,
                ),
                ...List.generate(
                  widget.transferMethod.paymentInstructions.length,
                  (firstIndex) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.transferMethod.paymentInstructions[firstIndex]
                          .instructionType.isNotEmpty)
                        Text(
                          context.tr(
                            widget
                                .transferMethod
                                .paymentInstructions[firstIndex]
                                .instructionType,
                          ),
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: ZPColors.shadesBlack,
                                    height: 1.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ...List.generate(
                        widget.transferMethod.paymentInstructions[firstIndex]
                            .instructions.length,
                        (secondIndex) => Text(
                          context.tr(
                            widget
                                .transferMethod
                                .paymentInstructions[firstIndex]
                                .instructions[secondIndex],
                          ),
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: ZPColors.passwordValidationsColor,
                                    height: 1.5,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
