import 'package:cached_network_image/cached_network_image.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Widget? errorWidget;
  final Widget? placeholder;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;
  const CustomImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.errorWidget,
    this.imageBuilder,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    final defaultHeight = MediaQuery.of(context).size.height * 0.08;
    final defaultWidth = MediaQuery.of(context).size.height * 0.08;

    if (imageUrl.isEmpty) {
      return _ErrorWidget(
        height: height ?? defaultHeight,
        width: width ?? defaultWidth,
      );
    }

    return CachedNetworkImage(
      key: WidgetKeys.imageBanner,
      imageUrl: imageUrl,
      fit: fit,
      height: height ?? defaultHeight,
      width: width ?? defaultWidth,
      imageBuilder: imageBuilder,
      placeholder: (context, url) =>
          placeholder ??
          LoadingShimmer.withChild(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.0),
                  topLeft: Radius.circular(8.0),
                ),
                color: ZPColors.white,
              ),
              width: width ?? defaultWidth,
              height: height ?? defaultHeight,
            ),
          ),
      errorWidget: (context, url, error) =>
          errorWidget ??
          _ErrorWidget(
            height: height ?? defaultHeight,
            width: width ?? defaultWidth,
          ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  final double height;
  final double width;

  const _ErrorWidget({
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      width: width,
      height: height,
      child: SvgPicture.asset(
        SvgImage.defaultProductImage,
        fit: BoxFit.contain,
      ),
    );
  }
}
