part of 'new_payment_bloc.dart';

@freezed
class NewPaymentEvent with _$NewPaymentEvent {
  const factory NewPaymentEvent.initialized({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required bool isMarketPlace,
  }) = _initialized;

  const factory NewPaymentEvent.fetchAvailablePaymentMethods() =
      _FetchAvailablePaymentMethods;

  const factory NewPaymentEvent.updateAllInvoices({
    required List<CustomerOpenItem> items,
  }) = _SelectAllInvoices;

  const factory NewPaymentEvent.toggleInvoice({
    required CustomerOpenItem item,
    required bool selected,
  }) = _ToggleInvoice;

  const factory NewPaymentEvent.updateAllCredits({
    required List<CustomerOpenItem> items,
  }) = _SelectAllCredits;

  const factory NewPaymentEvent.toggleCredit({
    required CustomerOpenItem item,
    required bool selected,
  }) = _ToggleCredit;

  const factory NewPaymentEvent.pay() = _Pay;

  const factory NewPaymentEvent.updatePaymentGateway({
    required PaymentStatus paymentStatus,
  }) = _UpdatePaymentGateway;

  const factory NewPaymentEvent.fetchInvoiceInfoPdf() = _FetchInvoiceInfoPdf;

  const factory NewPaymentEvent.saveInvoicePdf({
    required Uint8List dataInvoicePdf,
  }) = _SaveInvoicePdf;

  const factory NewPaymentEvent.updatePaymentMethodSelected({
    required NewPaymentMethod paymentMethodSelected,
  }) = _UpdatePaymentMethodSelected;

  const factory NewPaymentEvent.updatePaymentMethodOptionSelected({
    required PaymentMethodOption paymentMethodOptionSelected,
  }) = _UpdatePaymentMethodOptionSelected;

  const factory NewPaymentEvent.createVirtualAccount() = _CreateVirtualAccount;

  const factory NewPaymentEvent.getPrincipalCutoffs() = _GetPrincipalCutoffs;
}
