import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:flutter/material.dart';

class ProductLoadingShimmer extends StatelessWidget {
  final bool gridView;
  const ProductLoadingShimmer({super.key, this.gridView = false});

  @override
  Widget build(BuildContext context) {
    return gridView
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              children: List.generate(
                10,
                (index) => LoadingShimmer.product(),
              ),
            ),
          )
        : ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              4,
              (index) => LoadingShimmer.product(),
            ),
          );
  }
}
