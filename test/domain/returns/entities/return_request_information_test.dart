import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Test ReturnRequestInformation', () {
    test('Test calculatedUnitPrice getter ', () {
      final requestInformationWithCounterOffer =
          ReturnRequestInformation.empty().copyWith(
        overrideValue: 150,
      );
      final requestInformation = ReturnRequestInformation.empty().copyWith(
        totalPrice: 200,
        returnQuantity: 2,
      );
      expect(requestInformationWithCounterOffer.calculatedUnitPrice, 150);
      expect(requestInformation.calculatedUnitPrice, 100);
    });

    test('Test isCounterOfferRequested getter ', () {
      final requestInformationWithCounterOffer =
          ReturnRequestInformation.empty().copyWith(
        overrideValue: 150,
      );
      final requestInformation = ReturnRequestInformation.empty().copyWith(
        overrideValue: 0,
      );
      expect(requestInformationWithCounterOffer.isCounterOfferRequested, true);
      expect(requestInformation.isCounterOfferRequested, false);
    });

    test('Test isApprovedQuantityOverride getter ', () {
      final requestInformationQuantityOverride =
          ReturnRequestInformation.empty().copyWith(
        status: StatusType('APPROVED'),
        initialQuantity: 2,
      );
      expect(
        requestInformationQuantityOverride.isApprovedQuantityOverride,
        true,
      );
    });

    test('Test isApproverOverride getter ', () {
      final requestInformationWithApproverOverride =
          ReturnRequestInformation.empty().copyWith(
        priceOverrideTrail: [
          PriceOverrideTrail.empty().copyWith(
            overrideRole: OverrideRole('Approver'),
          ),
        ],
      );
      final requestInformationWithOutApproverOverride =
          ReturnRequestInformation.empty().copyWith(
        priceOverrideTrail: [
          PriceOverrideTrail.empty().copyWith(
            overrideRole: OverrideRole('USEROVR'),
          ),
        ],
      );
      expect(
        requestInformationWithApproverOverride.isApproverOverride,
        true,
      );
      expect(
        requestInformationWithOutApproverOverride.isApproverOverride,
        false,
      );
    });

    test('Test userOverrideValue getter ', () {
      final requestInformationWithUserOverrideValue =
          ReturnRequestInformation.empty().copyWith(
        status: StatusType('APPROVED'),
        priceOverrideTrail: [
          PriceOverrideTrail.empty().copyWith(
            overrideRole: OverrideRole('Approver'),
          ),
          PriceOverrideTrail.empty().copyWith(
            overrideRole: OverrideRole('USEROVR'),
            overrideValue: 150.0,
          ),
        ],
      );

      expect(
        requestInformationWithUserOverrideValue.userOverrideValue,
        150.0,
      );
    });
    test('Test isUnapprovedCounterOffer and isApprovedCounterOffer getter ',
        () {
      final requestInformationWithUnapprovedCounterOffer =
          ReturnRequestInformation.empty().copyWith(
        status: StatusType('Pending'),
        overrideValue: 110,
      );

      final requestInformationWithApprovedCounterOffer =
          ReturnRequestInformation.empty().copyWith(
        status: StatusType('APPROVED'),
        overrideValue: 110,
      );

      expect(
        requestInformationWithUnapprovedCounterOffer.isUnapprovedCounterOffer,
        true,
      );
      expect(
        requestInformationWithApprovedCounterOffer.isApprovedCounterOffer,
        true,
      );
    });
  });
}
