part of 'new_payment_bloc.dart';

@freezed
class NewPaymentState with _$NewPaymentState {
  const NewPaymentState._();

  const factory NewPaymentState({
    required PaymentInfo paymentInfo,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool isLoading,
    required List<CustomerOpenItem> selectedInvoices,
    required List<CustomerOpenItem> selectedCredits,
    required bool isFetchingInvoiceInfoPdf,
    required PaymentInvoiceInfoPdf paymentInvoiceInfoPdf,
    required bool isSavingInvoicePdf,
    required bool isFetchingPaymentMethod,
    required List<NewPaymentMethod> paymentMethods,
    required NewPaymentMethod selectedPaymentMethod,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required bool isCreatingVirtualAccount,
    required bool createVirtualAccountFailed,
    required CreateVirtualAccount createVirtualAccount,
    required bool isFetchingPrincipalCutoffs,
    required PrincipalCutoffs principalCutoffs,
    required bool isMarketPlace,
    required bool isUpdatePaymentGateway,
  }) = _NewPaymentState;

  factory NewPaymentState.initial() => NewPaymentState(
        selectedInvoices: <CustomerOpenItem>[],
        selectedCredits: <CustomerOpenItem>[],
        isLoading: false,
        paymentInfo: PaymentInfo.empty(),
        failureOrSuccessOption: none(),
        isFetchingInvoiceInfoPdf: false,
        paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty(),
        isSavingInvoicePdf: false,
        isFetchingPaymentMethod: false,
        paymentMethods: <NewPaymentMethod>[],
        selectedPaymentMethod: NewPaymentMethod.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        shipToInfo: ShipToInfo.empty(),
        user: User.empty(),
        isCreatingVirtualAccount: false,
        createVirtualAccountFailed: false,
        createVirtualAccount: CreateVirtualAccount.empty(),
        isFetchingPrincipalCutoffs: false,
        principalCutoffs: PrincipalCutoffs.empty(),
        isMarketPlace: false,
        isUpdatePaymentGateway: false,
      );

  double get amountTotal =>
      selectedInvoices.amountTotal + selectedCredits.amountTotal;

  bool get negativeAmount => amountTotal.isNegative;

  bool get virtualBankPayable =>
      selectedPaymentMethod.firstSelectedOption != PaymentMethodOption.empty();

  List<CustomerOpenItem> get allSelectedItems =>
      selectedInvoices + selectedCredits;

  bool get needOpenWebViewAndNotBankIn =>
      salesOrganisation.salesOrg.isPaymentNeedOpenWebView &&
      !selectedPaymentMethod.paymentMethod.isBankIn;

  bool get canDisplayCrossButton =>
      (salesOrganisation.salesOrg.isSg ||
          salesOrganisation.salesOrg.isID ||
          selectedPaymentMethod.paymentMethod.isBankIn) &&
      !isFetchingInvoiceInfoPdf;

  bool get onlyAllowMakePaymentSameBank => paymentMethods
      .firstWhere(
        (paymentMethod) =>
            paymentMethod.paymentMethod == selectedPaymentMethod.paymentMethod,
      )
      .banksOnlyAllowTransferSameBank
      .contains(selectedPaymentMethod.firstSelectedOption);

  bool get enableCreateVirtualAccount =>
      !negativeAmount && !isCreatingVirtualAccount && virtualBankPayable;

  bool get canFetchPaymentDetails =>
      !isCreatingVirtualAccount &&
      createVirtualAccount != CreateVirtualAccount.empty();

  bool get isFetching => isLoading || isCreatingVirtualAccount;

  String get paymentAdviceGenerateTitle {
    return isFetching
        ? selectedPaymentMethod.paymentMethod.isPaymentGateway
            ? 'Please be patient ...'
            : 'Generating payment advice...'
        : isMarketPlace
            ? 'MP Payment advice generated'
            : 'Payment advice generated';
  }
}
