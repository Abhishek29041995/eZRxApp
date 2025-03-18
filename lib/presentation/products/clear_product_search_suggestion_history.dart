import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/product_search/product_search_bloc.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClearProductSearchSuggestionHistory extends StatelessWidget {
  const ClearProductSearchSuggestionHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr('Clear search history?'),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: ZPColors.primary,
                ),
          ),
          const SizedBox(
            height: 35,
          ),
          const _ClearDeliveryAddressSection(),
        ],
      ),
    );
  }
}

class _ClearDeliveryAddressSection extends StatelessWidget {
  const _ClearDeliveryAddressSection();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              key: WidgetKeys.cancelButton,
              onPressed: () async {
                await context.router.maybePop();
              },
              child: Text(
                context.tr('Cancel'),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: ElevatedButton(
              key: WidgetKeys.confirmButton,
              onPressed: () {
                context.read<ProductSearchBloc>().add(
                      const ProductSearchEvent
                          .clearProductSearchSuggestionHistory(),
                    );
                context.router.maybePop();
              },
              child: Text(
                context.tr('Clear'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
