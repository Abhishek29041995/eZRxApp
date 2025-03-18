import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_counter_offer_details.freezed.dart';

@freezed
class RequestCounterOfferDetails with _$RequestCounterOfferDetails {
  const RequestCounterOfferDetails._();

  const factory RequestCounterOfferDetails({
    required CounterOfferValue counterOfferPrice,
    required CounterOfferDiscountValue discountOverridePercentage,
    required Currency counterOfferCurrency,
    required StringValue comment,
  }) = _RequestCounterOfferDetails;

  factory RequestCounterOfferDetails.empty() => RequestCounterOfferDetails(
        counterOfferPrice: CounterOfferValue(''),
        discountOverridePercentage: CounterOfferDiscountValue(''),
        counterOfferCurrency: Currency(''),
        comment: StringValue(''),
      );

  bool get hasCounterOffer =>
      counterOfferPrice.isValid() || discountOverridePercentage.isValid();
}
