import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:flutter/material.dart';

class TopAdvertBoxBannerTile extends StatelessWidget {
  final String imageUrl;
  const TopAdvertBoxBannerTile({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 3),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: CustomImage(
          imageUrl: imageUrl,
          placeholder: LoadingShimmer.logo(),
          errorWidget: imageUrl.isEmpty
              ? LoadingShimmer.logo()
              : const Icon(Icons.error),
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
