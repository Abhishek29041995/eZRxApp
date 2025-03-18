import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PaymentDue value object', () {
    test(
      'get total mount string from payment due success',
      () async {
        const input = 'MYR 18940.000000';
        final paymentDue = PaymentDue(input);
        final result = paymentDue.totalAmount;
        expect(result, '18,940.00');
      },
    );

    test(
      'get total mount from payment due failure with invalid payment due string',
      () async {
        const input = '18940.000000 MYR';
        final paymentDue = PaymentDue(input);
        final result = paymentDue.totalAmount;
        expect(result, '0.00');
      },
    );
  });

  group('AdviceExpiryValue value object', () {
    test(
      'get expiry days from advice expiry success',
      () async {
        const input = '15 days';
        final adviceExpiry = AdviceExpiryValue(input);
        final result = adviceExpiry.expiryDays;
        expect(result, 15);
      },
    );

    test(
      'get expiry days from advice expiry failure with advice expiry due string',
      () async {
        const input = 'in 15 days';
        final adviceExpiry = AdviceExpiryValue(input);
        final result = adviceExpiry.expiryDays;
        expect(result, 0);
      },
    );
  });

  group('DebitCreditCode value object', () {
    test(
      'check is credit',
      () async {
        const input = 'H';
        final adviceExpiry = DebitCreditCode(input);
        final result = adviceExpiry.isCredit;
        expect(result, true);
      },
    );

    test(
      'check is debit',
      () async {
        const input = 'S';
        final adviceExpiry = DebitCreditCode(input);
        final result = adviceExpiry.isDedit;
        expect(result, true);
      },
    );
  });

  group('ReferenceId value object', () {
    test(
      'get reference list string',
      () async {
        const input = '0000100585,0000100585';
        final adviceExpiry = ReferenceId(input);
        final result = adviceExpiry.referenceListString;
        expect(result, '#0000100585, #0000100585');
      },
    );

    test(
      'get reference list string when data is empty',
      () => expect(ReferenceId('').referenceListString, 'NA'),
    );
  });

  group('ClaimType value object', () {
    test(
      'get title',
      () async {
        expect(ClaimType(1).title, 'P1 - Principal Deals');
        expect(ClaimType(2).title, 'P2 - Principal Discounts');
        expect(ClaimType(3).title, 'P3 - Principal Rebate');
        expect(ClaimType(4).title, 'P4 - Listing Fee');
        expect(ClaimType(5).title, 'P5 - Display allowances');
        expect(ClaimType(6).title, 'P6 - Anniversary Support');
        expect(ClaimType(7).title, 'P7 - Opening Support');
        expect(ClaimType(8).title, 'P8 - Administrative Charges');
        expect(ClaimType(9).title, 'P9 - Other Promo Support');
      },
    );

    test(
      'get data',
      () async {
        expect(ClaimType(1).data, 'P1- Principal Deals');
        expect(ClaimType(2).data, 'P2- Principal Deductions');
        expect(ClaimType(3).data, 'P3- Principal Rebate');
        expect(ClaimType(4).data, 'P4- Listing Fee');
        expect(ClaimType(5).data, 'P5- Display Allowances');
        expect(ClaimType(6).data, 'P6- Anniversary Support');
        expect(ClaimType(7).data, 'P7- Opening Support');
        expect(ClaimType(8).data, 'P8- Administration Charges');
        expect(ClaimType(9).data, 'P9- Other Promo Support');
      },
    );

    test(
      'get documentTypes',
      () async {
        expect(ClaimType(1).documentTypes, SupportDocumentType.fullDocument);
        expect(ClaimType(2).documentTypes, SupportDocumentType.fullDocument);
        expect(ClaimType(3).documentTypes, SupportDocumentType.fullDocument);
        expect(
          ClaimType(4).documentTypes,
          SupportDocumentType.notIncludeCopyDocument,
        );
        expect(
          ClaimType(5).documentTypes,
          SupportDocumentType.notIncludeCopyDocument,
        );
        expect(
          ClaimType(6).documentTypes,
          SupportDocumentType.notIncludeCopyDocument,
        );
        expect(
          ClaimType(7).documentTypes,
          SupportDocumentType.notIncludeCopyDocument,
        );
        expect(
          ClaimType(8).documentTypes,
          SupportDocumentType.notIncludeCopyDocument,
        );
        expect(
          ClaimType(9).documentTypes,
          SupportDocumentType.notIncludeCopyDocument,
        );
      },
    );
  });

  group('SupportDocumentType value object', () {
    test(
      'fullDocument test',
      () async {
        expect(SupportDocumentType.fullDocument, [
          SupportDocumentType.proofOfBillingSOA(),
          SupportDocumentType.agreement(),
          SupportDocumentType.poCopy(),
          SupportDocumentType.invoiceCopy(),
          SupportDocumentType.supportingComputation(),
        ]);
      },
    );
    test(
      'notIncludeCopyDocument test',
      () async {
        expect(SupportDocumentType.notIncludeCopyDocument, [
          SupportDocumentType.proofOfBillingDMSOAMSF(),
          SupportDocumentType.agreement(),
          SupportDocumentType.supportingComputation(),
        ]);
      },
    );
    test(
      'get title',
      () async {
        expect(
          SupportDocumentType.proofOfBillingSOA().title,
          'Proof of Billing/SOA',
        );
        expect(
          SupportDocumentType.agreement().title,
          'Agreement/Contract/Trade Letter',
        );
        expect(SupportDocumentType.poCopy().title, 'PO Copy');
        expect(SupportDocumentType.invoiceCopy().title, 'Invoice Copy');
        expect(
          SupportDocumentType.supportingComputation().title,
          'Supporting Computation',
        );
        expect(
          SupportDocumentType.proofOfBillingDMSOAMSF().title,
          'Proof of Billing (DM, SOA, MSF)',
        );
      },
    );
  });
}
