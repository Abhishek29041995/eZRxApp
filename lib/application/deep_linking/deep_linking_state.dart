part of 'deep_linking_bloc.dart';

@freezed
class DeepLinkingState with _$DeepLinkingState {
  const factory DeepLinkingState.initial() = _Initial;
  const factory DeepLinkingState.linkPending(
    EzrxLink link, {
    EZReachBanner? banner,
  }) = _LinkPending;
  const factory DeepLinkingState.redirectBundleDetail(
    MaterialNumber materialNumber, {
    EZReachBanner? banner,
  }) = _RedirectBundleDetail;
  const factory DeepLinkingState.redirectProductDetail(
    MaterialNumber materialNumber, {
    EZReachBanner? banner,
  }) = _RedirectProductDetail;
  const factory DeepLinkingState.redirectProductsTab(
    SearchKey searchKey,
    MaterialFilter materialFilter,
  ) = _RedirectProductsTab;
  const factory DeepLinkingState.redirectOrderDetail(
    OrderNumber orderNumber,
  ) = _RedirectOrderDetail;
  const factory DeepLinkingState.redirectReturnDetail(
    ReturnItem returnItem,
  ) = _RedirectReturnDetail;
  const factory DeepLinkingState.redirectPaymentDetail({
    required PaymentSummaryDetails paymentIdentifierInfo,
    required bool isMarketPlace,
  }) = _RedirectPaymentDetail;
  const factory DeepLinkingState.redirectPaymentHome({
    required PaymentParams params,
    required bool isMarketPlace,
  }) = _RedirectPaymentHome;
  const factory DeepLinkingState.redirectInvoiceDetail({
    required String invoiceNumber,
    required bool isMarketPlace,
  }) = _RedirectInvoiceDetail;
  const factory DeepLinkingState.redirectFAQ() = _RedirectFAQ;
  const factory DeepLinkingState.redirectAboutUs() = _RedirectAboutUs;
  const factory DeepLinkingState.redirectContactUs(
    AppMarket market,
  ) = _RedirectContactUs;
  const factory DeepLinkingState.redirectUserGuide() = _RedirectUserGuide;
  const factory DeepLinkingState.error(ApiFailure failure) = _Error;
  const factory DeepLinkingState.redirectResetPassword(
    String resetPasswordKey,
  ) = _RedirectResetPassword;

  const factory DeepLinkingState.redirectOrder() = _RedirectOrder;
  const factory DeepLinkingState.redirectSetting() = _RedirectSetting;
  const factory DeepLinkingState.redirectCart() = _RedirectCart;
  const factory DeepLinkingState.redirectOrderItemDetail({
    required OrderItemParams params,
  }) = _RedirectOrderItemDetail;
  const factory DeepLinkingState.redirectTnC() = _RedirectTnC;
  const factory DeepLinkingState.redirectPrivacy() = _RedirectPrivacy;
  const factory DeepLinkingState.redirectAnnouncement() = _RedirectAnnouncement;
  const factory DeepLinkingState.redirectArticle() = _RedirectArticle;
  const factory DeepLinkingState.redirectReturn() = _RedirectReturn;
  const factory DeepLinkingState.redirectCreditDetail({
    required String creditId,
    required bool isMarketPlace,
  }) = _RedirectZPCreditDetail;
  const factory DeepLinkingState.redirectClaimSubmission() =
      _RedirectClaimSubmission;
  const factory DeepLinkingState.redirectNewReturnRequest() =
      _RedirectNewReturnRequest;
  const factory DeepLinkingState.redirectRaiseTicket({
    required String chatUrl,
  }) = _RedirectRaiseTicket;
}
