import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderTypeBanner extends StatelessWidget {
  static const height = 50;
  final EdgeInsets padding;

  const OrderTypeBanner({
    super.key,
    this.padding = const EdgeInsets.symmetric(horizontal: padding12),
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EligibilityBloc, EligibilityState>(
      buildWhen: (previous, current) =>
          previous.isShowOrderType != current.isShowOrderType ||
          previous.selectedOrderTypeInfo != current.selectedOrderTypeInfo,
      builder: (context, state) {
        if (!state.isShowOrderType) return const SizedBox.shrink();

        return ListTile(
          contentPadding: padding,
          tileColor: ZPColors.bannerBackground,
          title: Text(
            '${context.tr('Order Type')}: ${state.selectedOrderTypeInfo.displayText}',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          trailing: IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.edit_outlined),
            iconSize: 20,
            onPressed: () =>
                context.router.push(const SelectOrderTypeBottomSheetRoute()),
          ),
        );
      },
    );
  }
}
