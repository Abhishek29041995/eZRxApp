import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/covid_tag.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/core/tender_tag_for_product_tile.dart';
import 'package:flutter/material.dart';

class ImageBoxWidget extends StatelessWidget {
  const ImageBoxWidget({
    super.key,
    required this.materialNumber,
    required this.isCovidItem,
    required this.showOfferTag,
    required this.showBundleTag,
    required this.showTenderTag,
  });

  final bool isCovidItem;
  final bool showOfferTag;
  final bool showBundleTag;
  final MaterialNumber materialNumber;
  final bool showTenderTag;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      showBorder: true,
      showShadow: false,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.fromLTRB(0, 7, 8, 0),
      child: Stack(
        children: [
          ProductImage(
            materialNumber: materialNumber,
            fit: BoxFit.fitHeight,
            width: 80,
            height: 80,
          ),
          if (showOfferTag) ProductTag.onOfferIcon(),
          if (showBundleTag) ProductTag.bundleOfferIcon(),
          if (isCovidItem)
            Positioned(
              top: MediaQuery.of(context).size.height * 0.055,
              child: const CovidTag(),
            ),
          if (showTenderTag)
            Positioned(
              bottom: showOfferTag ? 13 : null,
              child: const TenderTagForProductTile(),
            ),
        ],
      ),
    );
  }
}
