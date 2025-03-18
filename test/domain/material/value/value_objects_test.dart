import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Material Code value object', () {
    test('should return material code with substring when not empty', () async {
      const input = '000000000023168451';
      final materialNumber = MaterialNumber(input);
      final result = materialNumber.displayMatNo;
      expect(result, '23168451');
    });

    test('should return NA when empty', () async {
      const input = '';
      final materialNumber = MaterialNumber(input);
      final result = materialNumber.displayMatNo;
      expect(result, 'NA');
    });
  });

  group('Principal Code value object', () {
    test('Principal code of ministry Of Health in production should be 100822',
        () async {
      final config = Config()..appFlavor = Flavor.prod;
      locator.registerSingleton(config);
      const input = '0000000000100822';
      final principalCode = PrincipalCode(input);
      final result = principalCode.isMinistryOfHealth;
      expect(result, true);
      locator.unregister(instance: config);
    });

    test('Principal code of ministry Of Health in Uat should be 100777',
        () async {
      final config = Config()..appFlavor = Flavor.uat;
      locator.registerSingleton(config);
      const input = '0000000000100777';
      final principalCode = PrincipalCode(input);
      final result = principalCode.isMinistryOfHealth;
      expect(result, true);
      locator.unregister(instance: config);
    });

    test('should return true when principal code submit allowed for sales rep',
        () async {
      const input = '0000000000100225';
      final principalCode = PrincipalCode(input);
      final result = principalCode.salesRepSubmitAllowed;
      expect(result, true);
    });

    test(
        'should return false when principal code submit not allowed for sales rep',
        () async {
      const input = '0000000000110225';
      final principalCode = PrincipalCode(input);
      final result = principalCode.salesRepSubmitAllowed;
      expect(result, false);
    });

    test(
        'should return true when principal code is principal code for all material',
        () async {
      const input = '0000000000';
      final principalCode = PrincipalCode(input);
      final result = principalCode.isAllMaterial;
      expect(result, true);
    });

    test(
        'should return false when principal code is not principal code for all material',
        () async {
      const input = '0000000001';
      final principalCode = PrincipalCode(input);
      final result = principalCode.isAllMaterial;
      expect(result, false);
    });

    test('should return true when principal code is PnG principal code',
        () async {
      var input = '0000000000105307';
      var principalCode = PrincipalCode(input);
      var result = principalCode.isPnG;
      expect(result, true);

      input = '0000000000101308';
      principalCode = PrincipalCode(input);
      result = principalCode.isPnG;
      expect(result, true);
    });

    test('should return false when principal code is not PnG principal code',
        () async {
      const input = '0000000000105303';
      final principalCode = PrincipalCode(input);
      final result = principalCode.isPnG;
      expect(result, false);
    });
  });

  group('Tender Contract Number value object', () {
    test('should return value when Tender Contract Number having valid value',
        () async {
      const input = '55';
      final tenderContractNumber = TenderContractNumber(input);
      final result = tenderContractNumber.displayTenderContractNumber;
      expect(result, '55');
    });

    test('should return NA when Tender Contract Number having empty value',
        () async {
      const input = '';
      final tenderContractNumber = TenderContractNumber(input);
      final result = tenderContractNumber.displayTenderContractNumber;
      expect(result, 'NA');
    });

    test('should return value if Tender Contract Item Number have valid value',
        () async {
      const input = '55';
      final tenderContractNumber = TenderContractNumber(input);
      final result = tenderContractNumber.displayTenderContractItemNumber;
      expect(result, '55');
    });

    test('should return NA when Tender Contract Item Number having empty value',
        () async {
      const input = '';
      final tenderContractNumber = TenderContractNumber(input);
      final result = tenderContractNumber.displayTenderContractItemNumber;
      expect(result, 'NA');
    });

    test('should return value if Tender Contract visa Number have valid value',
        () async {
      const input = '0000000124655';
      final tenderContractNumber = TenderContractNumber(input);
      final result = tenderContractNumber.displayTenderVisaNumber;
      expect(result, '124655');
    });

    test('should return NA if Tender Contract visa Number have empty value',
        () async {
      const input = '';
      final tenderContractNumber = TenderContractNumber(input);
      final result = tenderContractNumber.displayTenderVisaNumber;
      expect(result, 'NA');
    });

    test(
        'should return value if Tender Contract announcement letter Number have value',
        () async {
      const input = '0000000124655';
      final tenderContractNumber = TenderContractNumber(input);
      final result = tenderContractNumber.displayAnnouncementLetterNumber;
      expect(result, '124655');
    });

    test(
        'should return NA if Tender Contract announcement letter Number have empty value',
        () async {
      const input = '';
      final tenderContractNumber = TenderContractNumber(input);
      final result = tenderContractNumber.displayAnnouncementLetterNumber;
      expect(result, 'NA');
    });
  });

  group('Tender Contract Reason value object', () {
    test('should return true when Tender Contract Reason value is empty',
        () async {
      const input = '';
      final tenderContractReason = TenderContractReason(input);
      final result = tenderContractReason.isEmpty;
      expect(result, true);
    });

    test('should return false when Tender Contract Reason value is not empty',
        () async {
      const input = 'abc';
      final tenderContractReason = TenderContractReason(input);
      final result = tenderContractReason.isEmpty;
      expect(result, false);
    });

    test('should return value when Tender Contract Reason having valid value',
        () async {
      const input = '00000006745';
      final tenderContractReason = TenderContractReason(input);
      final result = tenderContractReason.displayTenderContractReason;
      expect(result, '6745');
    });

    test('should return NA when Tender Contract Reason value is empty',
        () async {
      const input = '';
      final tenderContractReason = TenderContractReason(input);
      final result = tenderContractReason.displayTenderContractReason;
      expect(result, 'NA');
    });
  });

  group('Tender Contract Info value object', () {
    test(
        'should return value when Tender Contract Reference value having valid value',
        () async {
      const input = '124655';
      final tenderContractInfo = StringValue(input);
      final result = tenderContractInfo.displayNAIfEmpty;
      expect(result, '124655');
    });

    test(
        'should return NA when Tender Contract Reference value having empty value',
        () async {
      const input = '';
      final tenderContractInfo = StringValue(input);
      final result = tenderContractInfo.displayNAIfEmpty;
      expect(result, 'NA');
    });

    test(
        'should return value when Tender Contract Info sales district having valid value',
        () async {
      const input = '124655';
      final tenderContractInfo = StringValue(input);
      final result = tenderContractInfo.displayNAIfEmpty;
      expect(result, '124655');
    });

    test(
        'should return NA when Tender Contract Info sales district value having empty value',
        () async {
      const input = '';
      final tenderContractInfo = StringValue(input);
      final result = tenderContractInfo.displayNAIfEmpty;
      expect(result, 'NA');
    });

    test(
        'should return value when Tender Contract Info package description having valid value',
        () async {
      const input = '124655';
      final tenderContractInfo = StringValue(input);
      final result = tenderContractInfo.displayNAIfEmpty;
      expect(result, '124655');
    });

    test(
        'should return NA when Tender Contract Info package description value having empty value',
        () async {
      const input = '';
      final tenderContractInfo = StringValue(input);
      final result = tenderContractInfo.displayNAIfEmpty;
      expect(result, 'NA');
    });

    test(
        'should return value when Tender Contract expiryDate having valid value',
        () async {
      const input = '12042015';
      final tenderContractInfo = StringValue(input);
      final result = tenderContractInfo.displayNAIfEmpty;
      expect(result, '12042015');
    });

    test('should return NA when Tender Contract expiryDate having empty value',
        () async {
      const input = '';
      final tenderContractInfo = StringValue(input);
      final result = tenderContractInfo.displayNAIfEmpty;
      expect(result, 'NA');
    });

    test(
        'should return value when Tender Contract paymentTerm having valid value',
        () async {
      const input = '12042015';
      final tenderContractInfo = StringValue(input);
      final result = tenderContractInfo.displayNAIfEmpty;
      expect(result, '12042015');
    });

    test('should return NA when Tender Contract paymentTerm having empty value',
        () async {
      const input = '';
      final tenderContractInfo = StringValue(input);
      final result = tenderContractInfo.displayNAIfEmpty;
      expect(result, 'NA');
    });
  });

  group('Expiry Date value object', () {
    test('should return value when Expiry Date having valid date', () async {
      const input = '12042028';
      final tenderContractInfo = DateTimeStringValue(input);
      final result = tenderContractInfo.getValue();
      expect(result, '12042028');
    });

    test('should return NA when Expiry Date having empty value', () async {
      const input = '';
      final tenderContractInfo = DateTimeStringValue(input);
      final result = tenderContractInfo.dateTimeOrNaString;
      expect(result, 'NA');
    });
  });
}
