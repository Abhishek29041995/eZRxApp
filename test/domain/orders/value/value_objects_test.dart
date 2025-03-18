import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CompanyName value object', () {
    test(
      'should return company name when not empty',
      () async {
        const input = 'fake-company-name';
        final companyName = CompanyName(input);
        final result = companyName.name;
        expect(result, 'fake-company-name');
      },
    );

    test(
      'should return NA when empty',
      () async {
        const input = '';
        final companyName = CompanyName(input);
        final result = companyName.name;
        expect(result, 'NA');
      },
    );
  });

  group('SoldToParty value object', () {
    test(
      'should return soldToPartyName when not empty',
      () async {
        const input = 'fake-sold-to-name';
        final soldToParty = SoldToParty(input);
        final result = soldToParty.name;
        expect(result, 'fake-sold-to-name');
      },
    );

    test(
      'should return NA when empty',
      () async {
        const input = '';
        final soldToParty = SoldToParty(input);
        final result = soldToParty.name;
        expect(result, 'NA');
      },
    );
  });

  group('ShipToParty value object', () {
    test(
      'should return ShipToPartyName when not empty',
      () async {
        const input = 'fake-ship-to-name';
        final shipToParty = ShipToParty(input);
        final result = shipToParty.name;
        expect(result, 'fake-ship-to-name');
      },
    );

    test(
      'should return NA when empty',
      () async {
        const input = '';
        final shipToParty = ShipToParty(input);
        final result = shipToParty.name;
        expect(result, 'NA');
      },
    );
  });

  group('Principal Name Value Object', () {
    test('should return PrincipalName when not empty', () {
      const input = 'fake-principal-name';
      final principalName = PrincipalName(input);
      final result = principalName.name;
      expect(result, 'fake-principal-name');
    });

    test(
      'should return NA when empty',
      () async {
        const input = '';
        final principalName = PrincipalName(input);
        final result = principalName.name;
        expect(result, 'NA');
      },
    );
  });

  group('MaterialTaxClassification Name Value Object', () {
    test('should return true when there is no Tax', () {
      const input = 'Product : No Tax';
      final valObj = MaterialTaxClassification(input);
      final result = valObj.isNoTax;
      expect(result, true);
    });

    test('should return true when there is Exempt', () {
      const input = 'Exempt';
      final valObj = MaterialTaxClassification(input);
      final result = valObj.isNoTax;
      expect(result, true);
    });

    test('should return false when there is fake Tax', () {
      const input = 'fake-Tax';
      final valObj = MaterialTaxClassification(input);
      final result = valObj.isNoTax;
      expect(result, false);
    });

    //Need to revisit when Tax Exempt will be covered in another User story
    // test('should return true when there is Exempt', () {
    //   const input = 'Exempt';
    //   final valObj = MaterialTaxClassification(input);
    //   final result = valObj.isExempt;
    //   expect(result, true);
    // });

    // test('should return false when there is not Exempt', () {
    //   const input = 'fake-data';
    //   final valObj = MaterialTaxClassification(input);
    //   final result = valObj.isExempt;
    //   expect(result, false);
    // });

    test('should return true when there is full tax', () {
      const input = 'Product : Full Tax';
      final valObj = MaterialTaxClassification(input);
      final result = !valObj.isNoTax;
      expect(result, true);
    });

    test('should return true when there is no is Special Scheme', () {
      const input = 'Special Scheme';
      final valObj = MaterialTaxClassification(input);
      final result = !valObj.isNoTax;
      expect(result, true);
    });
  });

  group('Material Number Value Object', () {
    test('should display Material Number when not empty', () {
      const input = '000034134';
      final valObj = MaterialNumber(input);
      final result = valObj.displayMatNo;
      expect(result, '34134');
    });
  });

  group('Material Price Value Object', () {
    test('should true when is empty', () {
      const input = 0.0;
      final valObj = MaterialPrice(input);
      final result = valObj.isEmpty;
      expect(result, true);
    });

    test('should false when is not empty', () {
      const input = 5.0;
      final valObj = MaterialPrice(input);
      final result = valObj.isEmpty;
      expect(result, false);
    });
  });

  group('BonusMaterialCalculation Value Object', () {
    test(
      'should return BonusMaterialCalculationEnum.calculation911',
      () {
        const input = '911';
        final valObj = BonusMaterialCalculation(input);
        expect(
          valObj.getCalculationEnum,
          BonusMaterialCalculationEnum.calculation911,
        );
      },
    );

    test(
      'should return BonusMaterialCalculationEnum.calculation912',
      () {
        const input = '912';
        final valObj = BonusMaterialCalculation(input);
        expect(
          valObj.getCalculationEnum,
          BonusMaterialCalculationEnum.calculation912,
        );
      },
    );
    test(
      'should return BonusMaterialCalculationEnum.calculation913',
      () {
        const input = '913';
        final valObj = BonusMaterialCalculation(input);
        expect(
          valObj.getCalculationEnum,
          BonusMaterialCalculationEnum.calculation913,
        );
      },
    );
    test(
      'should return BonusMaterialCalculationEnum.calculation914',
      () {
        const input = '914';
        final valObj = BonusMaterialCalculation(input);
        expect(
          valObj.getCalculationEnum,
          BonusMaterialCalculationEnum.calculation914,
        );
      },
    );

    test(
      'should true BonusMaterialCalculationEnum.calculation915',
      () {
        const input = '915';
        final valObj = BonusMaterialCalculation(input);
        expect(
          valObj.getCalculationEnum,
          BonusMaterialCalculationEnum.calculation915,
        );
      },
    );

    test(
      'should return BonusMaterialCalculationEnum.apl001',
      () {
        expect(
          BonusMaterialCalculation('001').getCalculationEnum,
          BonusMaterialCalculationEnum.apl001,
        );
      },
    );

    test(
      'should return BonusMaterialCalculationEnum.apl002',
      () {
        expect(
          BonusMaterialCalculation('002').getCalculationEnum,
          BonusMaterialCalculationEnum.apl002,
        );
      },
    );
  });

  group('ShippingCondition Value Object', () {
    test(
      'isGreenDelivery is true when value is GD ',
      () {
        final valObj = ShippingCondition('GD');
        expect(
          valObj.isGreenDelivery,
          true,
        );
      },
    );
  });

  group('ComboDealCategoryType Value Object', () {
    test(
      'is material number type',
      () {
        final valObj = ComboDealCategoryType('MATNR');
        expect(
          valObj.isMaterialNumber,
          true,
        );
      },
    );

    test(
      'is principle group type',
      () {
        final valObj = ComboDealCategoryType('ZPRINC');
        expect(
          valObj.isPrinciple,
          true,
        );
      },
    );
  });

  group('Counter Offer Value Object', () {
    test('Counter Offer Value is not Valid', () {
      final emptyValue = CounterOfferValue('');
      final valueObj = CounterOfferValue('0');
      expect(
        emptyValue.isValid(),
        false,
      );
      expect(
        valueObj.isValid(),
        false,
      );
    });

    test('Counter Offer Value is Valid', () {
      final valueObj = CounterOfferValue('100');
      expect(
        valueObj.isValid(),
        true,
      );
    });

    test('Counter Offer Value double value', () {
      final valueObj = CounterOfferValue('100');
      expect(
        valueObj.doubleValue,
        100,
      );
    });

    test('Counter Offer toPriceOverrideValue', () {
      final valueObj = CounterOfferValue('100');
      expect(
        valueObj.toPriceOverrideValue,
        PriceOverrideValue(100),
      );
    });
  });

  group('Counter Offer Discount Value Object', () {
    test('Counter Offer Discount Value is not Valid', () {
      final emptyValue = CounterOfferDiscountValue('');
      final valueObj = CounterOfferDiscountValue('0');
      final wrongValue = CounterOfferDiscountValue('100');
      expect(
        emptyValue.isValid(),
        false,
      );
      expect(
        valueObj.isValid(),
        false,
      );
      expect(
        wrongValue.isValid(),
        false,
      );
    });

    test('Counter Offer Discount Value is Valid', () {
      final valueObj = CounterOfferDiscountValue('10');
      expect(
        valueObj.isValid(),
        true,
      );
    });

    test('Counter Offer Discount double value', () {
      final valueObj = CounterOfferDiscountValue('10');
      expect(
        valueObj.doubleValue,
        10,
      );
    });

    test('Counter Offer Discount toZdp8OverrideValue', () {
      final valueObj = CounterOfferDiscountValue('10');
      expect(
        valueObj.toZdp8OverrideValue,
        Zdp8OverrideValue(10),
      );
    });
  });

  group('Order Step Value Object', () {
    test('Counter Offer Discount Value Get Expect Delivery Title', () {
      final notDeliveryYet = OrderStepValue('');
      final delivered = OrderStepValue('Delivered');
      expect(
        notDeliveryYet.deliveryDateTitle,
        'Expected delivery',
      );
      expect(
        delivered.deliveryDateTitle,
        'Delivered',
      );
    });

    test('History steps display or status == Order received', () {
      final orderReceived = OrderStepValue('Order received');
      expect(
        orderReceived.viewByOrderHistorySteps.map((e) => e.title).toList(),
        ['Order received'],
      );

      expect(
        orderReceived.viewByItemHistorySteps.map((e) => e.title).toList(),
        ['Order received'],
      );
    });

    test('History steps display or status == Cancelled || Order Cancelled', () {
      final orderCancelled = OrderStepValue('Order Cancelled');
      final cancelled = OrderStepValue('Cancelled');

      expect(
        orderCancelled.viewByOrderHistorySteps.map((e) => e.title).toList(),
        ['Order Cancelled', 'Order created', 'Order received'],
      );
      expect(
        cancelled.viewByOrderHistorySteps.map((e) => e.title).toList(),
        ['Cancelled', 'Order created', 'Order received'],
      );

      expect(
        orderCancelled.viewByItemHistorySteps.map((e) => e.title).toList(),
        ['Order Cancelled', 'Order created'],
      );
      expect(
        cancelled.viewByItemHistorySteps.map((e) => e.title).toList(),
        ['Cancelled', 'Order created'],
      );
    });

    test(
        'History steps display or status == Delivered - partial rejection || Delivered - rejected upon delivery',
        () {
      final partialRejection = OrderStepValue('Delivered - partial rejection');
      final rejectUponDelivery =
          OrderStepValue('Delivered - rejected upon delivery');

      final fixedStep = [
        'Out for delivery',
        'Order packed and ready for delivery',
        'Picking in progress',
        'Pending release',
        'Order created',
        'Order received',
      ];

      final viewByItemFixedSteps =
          fixedStep.where((element) => element != 'Order received').toList();

      expect(
        partialRejection.viewByOrderHistorySteps.map((e) => e.title).toList(),
        ['Delivered', ...fixedStep],
      );
      expect(
        rejectUponDelivery.viewByOrderHistorySteps.map((e) => e.title).toList(),
        ['Delivered', ...fixedStep],
      );

      expect(
        partialRejection.viewByItemHistorySteps.map((e) => e.title).toList(),
        ['Delivered', ...viewByItemFixedSteps],
      );
      expect(
        rejectUponDelivery.viewByItemHistorySteps.map((e) => e.title).toList(),
        ['Delivered', ...viewByItemFixedSteps],
      );
    });

    test('History steps display or status == Pending release', () {
      final pendingRelease = OrderStepValue('Pending release');

      final fixedStep = [
        'Order created',
        'Order received',
      ];

      expect(
        pendingRelease.viewByOrderHistorySteps.map((e) => e.title).toList(),
        ['Pending release', ...fixedStep],
      );

      final viewByItemFixedStep = [
        'Order created',
      ];

      expect(
        pendingRelease.viewByItemHistorySteps.map((e) => e.title).toList(),
        ['Pending release', ...viewByItemFixedStep],
      );
    });

    test('History steps display or status == Picking in progress', () {
      final pickInProgress = OrderStepValue('Picking in progress');

      final fixedStep = [
        'Pending release',
        'Order created',
        'Order received',
      ];

      final viewByOrderFixedSteps =
          fixedStep.where((element) => element != 'Pending release').toList();

      final viewByItemFixedSteps =
          fixedStep.where((element) => element != 'Order received').toList();

      expect(
        pickInProgress.viewByOrderHistorySteps.map((e) => e.title).toList(),
        ['Picking in progress', ...viewByOrderFixedSteps],
      );

      expect(
        pickInProgress.viewByItemHistorySteps.map((e) => e.title).toList(),
        ['Picking in progress', ...viewByItemFixedSteps],
      );
    });

    test(
        'History steps display or status == Order packed and ready for delivery',
        () {
      final orderPacked = OrderStepValue('Order packed and ready for delivery');

      final fixedStep = [
        'Picking in progress',
        'Pending release',
        'Order created',
        'Order received',
      ];

      final viewByOrderFixedSteps =
          fixedStep.where((element) => element != 'Pending release').toList();

      final viewByItemFixedSteps =
          fixedStep.where((element) => element != 'Order received').toList();

      expect(
        orderPacked.viewByOrderHistorySteps.map((e) => e.title).toList(),
        ['Order packed and ready for delivery', ...viewByOrderFixedSteps],
      );

      expect(
        orderPacked.viewByItemHistorySteps.map((e) => e.title).toList(),
        ['Order packed and ready for delivery', ...viewByItemFixedSteps],
      );
    });

    test('History steps display or status == Out for delivery', () {
      final outForDelivery = OrderStepValue('Out for delivery');

      final fixedStep = [
        'Order packed and ready for delivery',
        'Picking in progress',
        'Pending release',
        'Order created',
        'Order received',
      ];

      final viewByOrderFixedSteps =
          fixedStep.where((element) => element != 'Pending release').toList();

      final viewByItemFixedSteps =
          fixedStep.where((element) => element != 'Order received').toList();

      expect(
        outForDelivery.viewByOrderHistorySteps.map((e) => e.title).toList(),
        ['Out for delivery', ...viewByOrderFixedSteps],
      );

      expect(
        outForDelivery.viewByItemHistorySteps.map((e) => e.title).toList(),
        ['Out for delivery', ...viewByItemFixedSteps],
      );
    });

    test('History steps display or status == Delivered', () {
      final outForDelivery = OrderStepValue('Delivered');

      final fixedStep = [
        'Out for delivery',
        'Order packed and ready for delivery',
        'Picking in progress',
        'Pending release',
        'Order created',
        'Order received',
      ];

      final viewByOrderFixedSteps =
          fixedStep.where((element) => element != 'Pending release').toList();

      final viewByItemFixedSteps =
          fixedStep.where((element) => element != 'Order received').toList();

      expect(
        outForDelivery.viewByOrderHistorySteps.map((e) => e.title).toList(),
        ['Delivered', ...viewByOrderFixedSteps],
      );

      expect(
        outForDelivery.viewByItemHistorySteps.map((e) => e.title).toList(),
        ['Delivered', ...viewByItemFixedSteps],
      );
    });

    test('History steps display or status == Out for redelivery', () {
      final outForRedelivery = OrderStepValue('Out for redelivery');

      final fixedStep = [
        'Out for delivery',
        'Order packed and ready for delivery',
        'Picking in progress',
        'Pending release',
        'Order created',
      ];

      expect(
        outForRedelivery.viewByItemHistorySteps.map((e) => e.title).toList(),
        fixedStep,
      );
    });

    test('Check is in queue', () {
      // Return true if raw data return "in queue" text
      expect(OrderStepValue('in queue').isInQueue, true);
      expect(OrderStepValue('In Queue').isInQueue, true);
      expect(OrderStepValue('In queue').isInQueue, true);
      expect(OrderStepValue('in Queue').isInQueue, true);
      expect(OrderStepValue('OnHold').isInQueue, true);

      //Return false if raw data return text not equals to "in queue"
      expect(OrderStepValue('test').isInQueue, false);
    });

    test('Order confirmation message prefix', () {
      expect(
        OrderStepValue('OnHold').orderConfirmationPrefixMessage,
        'Your order is being created, please do not place a duplicate order while this order is being processed. We will send a confirmation email to',
      );
      expect(
        OrderStepValue('in queue').orderConfirmationPrefixMessage,
        'Your order is being created, please do not place a duplicate order while this order is being processed. We will send a confirmation email to',
      );

      expect(
        OrderStepValue('test').orderConfirmationPrefixMessage,
        'We’ll send a confirmation to',
      );
    });

    test('Order confirmation message suffix', () {
      expect(
        OrderStepValue('OnHold').orderConfirmationSuffixMessage,
        'once your order is successfully created.',
      );

      expect(
        OrderStepValue('in queue').orderConfirmationSuffixMessage,
        'once your order is successfully created.',
      );

      expect(
        OrderStepValue('test').orderConfirmationSuffixMessage,
        'once your order has been confirmed',
      );
    });
  });
  group('Phone Number Value Object -', () {
    test('Valid Phone Number', () {
      expect(
        PhoneNumber('1984i32ijnjnbfjshdiuoiwer9283092803502hfdsjfk')
            .validPhoneNumber,
        '1984329283092803',
      );
    });

    test('Display Telephone Number', () {
      expect(
        PhoneNumber('1984i32ijnjnbfjshdiuoiwer9283092803502hfdsjfk')
            .displayTelephoneNumber,
        '1984329283092803',
      );
      expect(
        PhoneNumber('').displayTelephoneNumber,
        'NA',
      );
    });
  });

  group('Tender Contract Reason Value Object -', () {
    test('Get tender contract reason title for code 735', () {
      expect(
        TenderContractReason('735').tenderContractReasonTitle,
        'Non-Contract Tender',
      );
    });
    test('Get tender contract reason title for code 730', () {
      expect(
        TenderContractReason('730').tenderContractReasonTitle,
        'Tender with Contract',
      );
    });
    test('Get tender contract reason title for code 705', () {
      expect(
        TenderContractReason('705').tenderContractReasonTitle,
        'Guaranteed Order',
      );
    });
    test('Get tender contract reason title for code 715', () {
      expect(
        TenderContractReason('715').tenderContractReasonTitle,
        'Extended Term',
      );
    });
    test('Get tender contract reason title for code 700', () {
      expect(
        TenderContractReason('700').tenderContractReasonTitle,
        'Loan',
      );
    });
  });
}
