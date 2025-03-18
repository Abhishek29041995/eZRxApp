import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';

class StatusSelectorFilter<T> extends StatelessWidget {
  final List<T> statusesDisplay;
  final List<T> filteredStatuses;
  final Function(T, bool) onStatusSelected;

  const StatusSelectorFilter({
    required this.statusesDisplay,
    required this.onStatusSelected,
    required this.filteredStatuses,
    super.key,
  });

  String _getStatusDisplay(T status) {
    if (status is FilterStatus) {
      return status.getValue();
    }
    if (status is String) {
      return status;
    }
    if (status is StatusType) {
      return status.displayPaymentStatus;
    }

    return status.toString();
  }

  Key _getStatusKey({required T status}) {
    if (status is FilterStatus) {
      return WidgetKeys.paymentSummaryFilterStatus(_getStatusDisplay(status));
    }

    return WidgetKeys.genericKey(key: _getStatusDisplay(status));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: statusesDisplay.map((T status) {
        final value = filteredStatuses.contains(status);

        return CheckboxListTile(
          key: _getStatusKey(status: status),
          contentPadding: EdgeInsets.zero,
          title: Text(
            context.tr(_getStatusDisplay(status)),
            style: Theme.of(context).textTheme.titleSmall,
          ),
          controlAffinity: ListTileControlAffinity.leading,
          dense: true,
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          onChanged: (bool? value) => onStatusSelected(status, value ?? false),
          value: value,
        );
      }).toList(),
    );
  }
}
