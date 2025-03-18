part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_details_tab/return_details_tab.dart';

class _MaterialBonusDetailsSection extends StatelessWidget {
  const _MaterialBonusDetailsSection({
    required this.item,
    required this.returnItem,
    required this.detail,
    required this.counterOfferEnabled,
  });
  final ReturnMaterial item;
  final ReturnMaterial returnItem;
  final ReturnItemDetails detail;
  final bool counterOfferEnabled;

  @override
  Widget build(BuildContext context) {
    return ExpandableInfo(
      labelText: context.tr('Bonus return details'),
      child: BlocBuilder<NewRequestBloc, NewRequestState>(
        buildWhen: (previous, current) =>
            previous.showErrorMessages != current.showErrorMessages ||
            previous.getReturnItemDetails(detail.uuid).returnType !=
                current.getReturnItemDetails(detail.uuid).returnType,
        builder: (context, state) {
          return Form(
            autovalidateMode: state.showErrorMessages
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: Column(
              key: WidgetKeys.materialBonusDetailsSection,
              children: [
                ReturnTypeSection(
                  isDisable: returnItem.editDetailsAllowed,
                  uuid: detail.uuid,
                  assignmentNumber: detail.assignmentNumber,
                ),
                const SizedBox(
                  height: 8,
                ),
                BalanceQuantityField(data: item),
                const SizedBox(
                  height: 8,
                ),
                ReturnQuantityField(
                  uuid: detail.uuid,
                  balanceQuantity: item.balanceQuantity,
                  key: WidgetKeys.bonusQuantityField(detail.uuid),
                ),
                const SizedBox(
                  height: 8,
                ),
                ReturnValueField(
                  data: item,
                ),
                if (state
                    .getReturnItemReturnType(detail.uuid)
                    .isCounterOfferElegible)
                  ReturnCounterOfferField(
                    uuid: detail.uuid,
                    enabled: counterOfferEnabled,
                  ),
                const SizedBox(
                  height: 8,
                ),
                ReasonDropdown(
                  uuid: detail.uuid,
                ),
                const SizedBox(
                  height: 8,
                ),
                _CommentsField(
                  uuid: item.uuid,
                ),
                const SizedBox(
                  height: 8,
                ),
                _UploadAttachmentSection(data: item),
              ],
            ),
          );
        },
      ),
    );
  }
}
