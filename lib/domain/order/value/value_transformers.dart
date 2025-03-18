import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_step.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:flutter/material.dart';

BonusMaterialCalculationEnum getBonusCalculationEnum(String calculation) {
  switch (calculation) {
    case '001':
      return BonusMaterialCalculationEnum.apl001;
    case '002':
      return BonusMaterialCalculationEnum.apl002;
    case '915':
      return BonusMaterialCalculationEnum.calculation915;
    case '914':
      return BonusMaterialCalculationEnum.calculation914;
    case '913':
      return BonusMaterialCalculationEnum.calculation913;
    case '911':
      return BonusMaterialCalculationEnum.calculation911;
    case '912':
    default:
      return BonusMaterialCalculationEnum.calculation912;
  }
}

bool checkMaterialType(String type) {
  return isEqualsIgnoreCase(type, 'Comm');
}

bool checkMaterialTypeBonus(String type) {
  return isEqualsIgnoreCase(type, 'Bonus');
}

bool contractIs730(String tenderReason) {
  return tenderReason == '730';
}

bool materialBundleTypeIsPercent(String bundleType) {
  return bundleType == '%';
}

bool materialEligibleForTaxExclusion(String taxClassification) {
  return isEqualsIgnoreCase(taxClassification, 'Product : No Tax') ||
      isEqualsIgnoreCase(taxClassification, 'Exempt');
}
// Need to revisit once Tax Exempt User story is ready
// bool materialTaxClassificationIsExempt(String taxClassification) {
//   return taxClassification == 'Exempt';
// }

bool havingPrincipalCodeForAllMaterial(String principalCode) =>
    principalCode == '0000000000';

bool havingMinistryOfHealthPrincipalCode(String principalCode) =>
    principalCode == locator<Config>().ministryOfHealthPrincipalCode;

bool havingSubmitPrincipalForSalesRep(String principalCode) =>
    principalCode == '100225' || principalCode == '101252';

bool havingPnGPrincipalCode(String principalCode) =>
    principalCode == '105307' || principalCode == '101308';

bool havingAbbotPrincipalCode(String principalCode) =>
    principalCode == '107381';

int getParsedValue(String zDP5Value) =>
    zDP5Value.isEmpty ? 0 : int.parse(zDP5Value);

bool isValueNotEmpty(String zDP5Value) => zDP5Value.isNotEmpty;

String intToString(int value) => value == 0 ? '' : '$value';

bool checkIfSuccessful(int value) => value == 1;

double getDoubleParsedValue(String value) =>
    value.isEmpty ? 0 : double.parse(value);

String getPaymentTermValue(String value) => value.isEmpty
    ? ''
    : value.characters.getRange(0, value.indexOf('-')).string.trim();

PriceOverrideValue getPriceOverrideValue(double value) =>
    PriceOverrideValue(value);

Zdp8OverrideValue getZdp8OverrideValue(double value) =>
    Zdp8OverrideValue(value);

bool isBonusReturnType(String prsfd) => isEqualsIgnoreCase(prsfd, 'B');

int getParentLineNumberIntValue(int value) => value - (value % 10);

String getOrderStatus(String status) =>
    status.isEmpty ? '-' : stringCapitalize(status);

bool checkIfInQueue(String value) =>
    isEqualsIgnoreCase(value, 'in queue') ||
    isEqualsIgnoreCase(value, 'OnHold');

String queueStateToOrderConfirmationIcon(bool isInQueue) =>
    isInQueue ? SvgImage.orderInQueue : SvgImage.orderCreated;

String queueStateToOrderConfirmationPrefixMessage(bool isInQueue) => isInQueue
    ? 'Your order is being created, please do not place a duplicate order while this order is being processed. We will send a confirmation email to'
    : 'We’ll send a confirmation to';

String queueStateToOrderConfirmationSuffixMessage(bool isInQueue) => isInQueue
    ? 'once your order is successfully created.'
    : 'once your order has been confirmed';

String getOrderNumberPrefix(bool value) => value ? 'Queue' : 'Order';

List<OrderHistoryStep> getOrderHistorySteps({
  required bool isViewByOrder,
  required String stepTitle,
}) {
  final baseSteps = <OrderHistoryStep>[
    if (isViewByOrder || isEqualsIgnoreCase(stepTitle, 'Order received'))
      OrderHistoryStep.empty().copyWith(
        title: 'Order received',
        icon: Icons.pending_actions,
      ),
    OrderHistoryStep.empty().copyWith(
      title: 'Order created',
      icon: Icons.inventory_outlined,
    ),
  ];

  final otherSteps = <OrderHistoryStep>[
    OrderHistoryStep.empty().copyWith(
      title: 'Pending release',
      icon: Icons.query_builder,
    ),
    OrderHistoryStep.empty().copyWith(
      title: 'Picking in progress',
      icon: Icons.inventory_2_outlined,
    ),
    OrderHistoryStep.empty().copyWith(
      title: 'Order packed and ready for delivery',
      icon: Icons.inventory_2_outlined,
    ),
    OrderHistoryStep.empty().copyWith(
      title: 'Out for delivery',
      icon: Icons.local_shipping_outlined,
    ),
    OrderHistoryStep.empty().copyWith(
      title: 'Delivered',
      icon: Icons.cancel,
    ),
  ];

  var result = <OrderHistoryStep>[];

  switch (stepTitle.toLowerCase()) {
    case 'cancelled':
    case 'order cancelled':
      result = <OrderHistoryStep>[
        ...baseSteps,
        OrderHistoryStep.empty().copyWith(
          title: stepTitle,
          icon: Icons.cancel,
        ),
      ];
      break;
    case 'delivered - partial rejection':
    case 'delivered - rejected upon delivery':
      result = [
        ...baseSteps,
        ...otherSteps,
      ];
      break;
    case 'out for redelivery':
      result = [
        ...baseSteps,
        ...otherSteps,
      ]..removeLast();
      break;
    default:
      if (isViewByOrder) {
        otherSteps.removeAt(0);
      }
      final fullSteps = [
        ...baseSteps,
        ...otherSteps..removeLast(),
        OrderHistoryStep.empty().copyWith(
          title: 'Delivered',
          icon: Icons.check,
        ),
      ];

      final stepIndex = fullSteps.indexWhere(
        (step) => isEqualsIgnoreCase(step.title, stepTitle),
      );
      result = stepIndex > -1
          ? fullSteps.sublist(0, stepIndex + 1)
          : [
              ...baseSteps,
              OrderHistoryStep.empty().copyWith(
                title: stepTitle,
                icon: Icons.check,
              ),
            ];
      break;
  }

  if (result.isNotEmpty) {
    result = [
      if (result.length - 1 > -1) ...result.sublist(0, result.length - 1),
      result.last.copyWith(state: OrderHistoryStepStates.active),
    ];
  }

  return result.reversed.toList();
}

//We're separate with paymentStatus on core value object so we're ignore this
//ignore: code-duplication
String getOrderSAPStatus(String status) {
  if (status.isEmpty) {
    return '-';
  }

  return status.contains('-') ? status.split('-').first.trim() : status;
}

String getDeliveryDateTitle(String status) {
  if (status.toLowerCase().contains('delivered')) {
    return 'Delivered';
  }

  return 'Expected delivery';
}

bool isPaymentTermCodeOutsideOfSystem(String value) {
  return isEqualsIgnoreCase(value, 'C024') || isEqualsIgnoreCase(value, 'A007');
}

String getTenderOrderReasonTitle(String status) {
  switch (status) {
    case '730':
      return 'Tender with Contract';
    case '705':
      return 'Guaranteed Order';
    case '715':
      return 'Extended Term';
    case '700':
      return 'Loan';
    case '735':
    default:
      return 'Non-Contract Tender';
  }
}

bool checkIfValueIsNotRequired(String value) =>
    isEqualsIgnoreCase(value, 'NOT REQUIRED');

String getDeliveryOptionTitle(String value) {
  final result = {
    'standardDelivery': 'Standard delivery',
    'requestDeliveryDate': 'Request delivery date',
    'urgentDelivery': 'Urgent delivery',
  };

  return result[value] ?? '';
}

String getDeliveryOptionIcon(String value) {
  final result = {
    'standardDelivery': SvgImage.standardDeliveryIcon,
    'requestDeliveryDate': SvgImage.requestDateDeliveryIcon,
    'urgentDelivery': SvgImage.urgentDeliveryIcon,
  };

  return result[value] ?? '';
}

String getDeliveryOptionDescription(String value) {
  final descriptions = {
    'standardDelivery': 'Receive your order in {number} business days.',
    'requestDeliveryDate':
        'Schedule your delivery date. Delivery can only be requested on available days on the calendar.',
    'urgentDelivery':
        'Get your items delivered in the fastest time possible. Only available on business days.',
  };

  return descriptions[value] ?? '';
}

String getUrgentDeliveryTimePickerOptionTitle(String value) {
  final result = {
    'todayUrgentDelivery': 'Today, 1PM - 6PM (order before 10:30 AM)',
    'tomorrowUrgentDelivery': 'Tomorrow, 9AM - 12AM (order before 4PM)',
    'saturdayUrgentDelivery': 'Saturday, 9AM - 1PM (order before 4PM)',
  };

  return result[value] ?? '';
}

String getDeliveryOptionPrice(String value) {
  final result = {
    'standardDelivery': 'FREE',
    'requestDeliveryDate': 'FREE',
    'urgentDelivery': '{urgentDeliveryPrice}',
  };

  return result[value] ?? '';
}
