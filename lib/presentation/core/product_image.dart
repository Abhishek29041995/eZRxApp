import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductImage extends StatelessWidget {
  final MaterialNumber materialNumber;
  final double? height;
  final double? width;
  final BoxFit fit;

  const ProductImage({
    super.key,
    required this.materialNumber,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductImageBloc, ProductImageState>(
      buildWhen: (previous, current) =>
          previous.productImageMap != current.productImageMap,
      builder: (context, state) {
        return CustomImage(
          key: WidgetKeys.productImage,
          imageUrl: state.getMaterialImage(materialNumber).thumbNail,
          fit: fit,
          height: height,
          width: width,
        );
      },
    );
  }
}
