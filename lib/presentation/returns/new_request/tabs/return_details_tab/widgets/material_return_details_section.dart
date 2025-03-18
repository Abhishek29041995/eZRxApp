part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_details_tab/return_details_tab.dart';

class _MaterialReturnDetailsSection extends StatelessWidget {
  const _MaterialReturnDetailsSection({
    super.key,
    required this.item,
    required this.detail,
  });
  final ReturnMaterial item;
  final ReturnItemDetails detail;

  @override
  Widget build(BuildContext context) {
    return ExpandableInfo(
      labelText: context.tr('Material return details'),
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
              children: [
                ReturnTypeSection(
                  isDisable: !item.editDetailsAllowed,
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
                  balanceQuantity: item.balanceQuantity,
                  uuid: detail.uuid,
                  key: WidgetKeys.materialQuantityField(detail.uuid),
                ),
                const SizedBox(
                  height: 8,
                ),
                ReturnValueField(
                  data: item,
                ),
                ReturnCounterOfferField(
                  uuid: detail.uuid,
                  enabled: true,
                ),
                const SizedBox(height: 8),
                ReasonDropdown(
                  uuid: item.uuid,
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
