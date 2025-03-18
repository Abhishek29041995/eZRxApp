part of 'new_request_bloc.dart';

@freezed
class NewRequestState with _$NewRequestState {
  const NewRequestState._();
  const factory NewRequestState({
    required List<ReturnMaterial> selectedItems,
    required List<InvoiceDetails> invoiceDetails,
    required String returnReference,
    required String specialInstructions,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<ApiFailure, String>> failureOrSuccessOption,
    required String returnRequestId,
    required SalesOrg salesOrg,
  }) = _NewRequestState;

  factory NewRequestState.initial() => NewRequestState(
        selectedItems: <ReturnMaterial>[],
        invoiceDetails: <InvoiceDetails>[],
        showErrorMessages: false,
        isSubmitting: false,
        returnReference: '',
        specialInstructions: '',
        failureOrSuccessOption: none(),
        returnRequestId: '',
        salesOrg: SalesOrg(''),
      );

  bool get _areItemsFromSamePrincipal =>
      salesOrg.isSg ||
      selectedItems.every(
        (item) => selectedItems.first.principalCode == item.principalCode,
      );

  bool get areSelectedReturnItemsInvalid =>
      _areItemsFromBothZPAndMP || !_areItemsFromSamePrincipal;

  bool get _areItemsFromBothZPAndMP => !selectedItems.every(
        (item) => selectedItems.first.isMarketPlace == item.isMarketPlace,
      );

  String get invalidSelectedReturnItemMsg => selectedItems
          .every((e) => !e.isMarketPlace)
      ? 'Please ensure that the items selected for return are from the same Principal.'
      : 'Please note that ZP and MP products cannot be returned together. Additionally, MP products must be from the same seller in each request.';

  bool get validateForStep1 =>
      selectedItems.isNotEmpty && !areSelectedReturnItemsInvalid;

  bool get validateForStep2 => isAdditionInfoValid && isReturnQuantityValid;

  bool get isAdditionInfoValid =>
      validItemDetails.isNotEmpty &&
      validItemDetails.every((details) => details.isValid);

  bool get isReturnQuantityValid => !validItemDetails.any(
        (details) =>
            details.returnQuantity.getIntValue >
            details.balanceQty.getOrDefaultValue(0),
      );

  bool get containsMPItems =>
      selectedItems.any((element) => element.isMarketPlace);

  List<ReturnItemDetails> get allItemDetails =>
      invoiceDetails.expand((e) => e.returnItemDetailsList).toList();

  List<ReturnItemDetails> get validItemDetails =>
      invoiceDetails.expand((e) => e.validReturnItemDetailsList).toList();

  List<InvoiceDetails> get validInvoiceDetails => invoiceDetails
      .map(
        (e) => e.copyWith(returnItemDetailsList: e.validReturnItemDetailsList),
      )
      .toList();

  ReturnItemDetails getReturnItemDetails(String uuid) =>
      allItemDetails.firstWhere(
        (element) => element.uuid == uuid,
        orElse: () => ReturnItemDetails.empty(),
      );
  List<ReturnMaterial> getReturnBonusItemsOfMainItem(ReturnMaterial item) =>
      item.bonusItems
          .where(
            (item) => allItemDetails.any((detail) => detail.uuid == item.uuid),
          )
          .toList();

  List<ReturnMaterial> getBonusItemsWithBalanceQuantity(
    ReturnMaterial mainItem,
  ) =>
      mainItem.bonusItems
          .where(
            (bonusItem) =>
                bonusItem.balanceQuantity.isGreaterThanZero &&
                allItemDetails.any((detail) => detail.uuid == bonusItem.uuid),
          )
          .toList();

  bool isIncludeBonus(String uuid) =>
      getReturnItemDetails(uuid) != ReturnItemDetails.empty();

  InvoiceDetails getInvoiceDetail(String assignmentNumber) =>
      invoiceDetails.firstWhere(
        (element) => element.invoiceNumber == assignmentNumber,
        orElse: () => InvoiceDetails.empty(),
      );

  ReturnMaterial getReturnMaterial(String itemNumber) {
    var existedItem = selectedItems.firstWhere(
      (element) => element.itemNumber == itemNumber,
      orElse: () => ReturnMaterial.empty(),
    );
    if (existedItem.itemNumber.isEmpty) {
      final bonusItems =
          selectedItems.map((item) => item.bonusItems).flattened.toList();
      existedItem = bonusItems.firstWhere(
        (element) => element.itemNumber == itemNumber,
        orElse: () => ReturnMaterial.empty(),
      );
    }

    return existedItem;
  }

  double returnItemTotal(String assignmentNumber) =>
      getInvoiceDetail(assignmentNumber).returnItemDetailsList.fold<double>(
            0,
            (sum, item) => sum + item.returnValue,
          );

  double get returnTotal => allItemDetails.fold<double>(
        0,
        (sum, item) => sum + item.returnValue,
      );

  Map<String, dynamic> mixpanelTrackingInfo({
    required List<Usage> reasonList,
  }) =>
      {
        TrackingProps.returnId: returnRequestId,
        TrackingProps.totalQty: allItemDetails.fold<int>(
          0,
          (sum, e) => sum + e.returnQuantity.getIntValue,
        ),
        TrackingProps.totalPrice: returnTotal,
        TrackingProps.isSingle: invoiceDetails.length == 1,
        TrackingProps.isBonusIncluded: selectedItems
            .map((e) => e.bonusItems)
            .flattened
            .any((bonus) => isIncludeBonus(bonus.uuid)),
        TrackingProps.returnReason: allItemDetails
            .map(
              (e) =>
                  reasonList
                      .firstWhereOrNull(
                        (reason) => reason.usageCode == e.returnReason,
                      )
                      ?.usageDescription ??
                  e.returnReason,
            )
            .toList(),
        TrackingProps.productName: allItemDetails
            .map(
              (e) => getReturnMaterial(e.itemNumber).materialDescription,
            )
            .toList(),
        TrackingProps.productManufacturer: allItemDetails
            .map(
              (e) => getReturnMaterial(e.itemNumber).principalName.name,
            )
            .toList(),
        TrackingProps.unitPrice:
            allItemDetails.map((e) => e.unitPrice).toList(),
      };

  ReturnType getReturnItemReturnType(String uuid) {
    return getReturnItemDetails(uuid).returnType;
  }
}
