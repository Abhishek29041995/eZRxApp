import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceDisplayWidget extends StatelessWidget {
  const PriceDisplayWidget({super.key, 
    required this.priceComponent,
  });

  final PriceComponent priceComponent;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.aplSimulatorOrder != current.aplSimulatorOrder,
      builder: (context, state) {
        if (state.isAplProductLoading) {
          return SizedBox(
            width: Responsive.isLargerThan(context, Breakpoint.desktop)
                ? MediaQuery.of(context).size.width * 0.2
                : MediaQuery.of(context).size.width * 0.3,
            child: LoadingShimmer.tile(),
          );
        }

        return priceComponent;
      },
    );
  }
}
