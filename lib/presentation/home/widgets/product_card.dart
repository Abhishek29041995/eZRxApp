import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/clevertap_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/products/widgets/material_grid_item.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final MaterialInfo material;
  final Key widgetKey;
  final String section;
  final bool isSimilarProduct;
  final Function() onFavouriteTap;
  const ProductCard({
    super.key,
    this.isSimilarProduct = false,
    required this.widgetKey,
    required this.material,
    required this.section,
    required this.onFavouriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.isLargerThan(context, Breakpoint.desktop)
          ? MediaQuery.of(context).size.width * 0.25
          : MediaQuery.of(context).size.width * 0.45,
      child: MaterialGridItem(
        key: widgetKey,
        materialInfo: material,
        onTap: () => _productOnTap(context),
        onFavouriteTap: onFavouriteTap,
      ),
    );
  }

  void _productOnTap(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    final clickAt =
        RouterUtils.buildRouteTrackingName(context.router.currentPath);
    final isOffer = context.read<MaterialPriceBloc>().state.displayOfferTag(
          material,
          eligibilityState.user,
        );
    final isOOSPreorder = material.displayOOSPreorderTag(
      eligibilityState.salesOrgConfigs.hideStockDisplay,
    );

    final tags = <String>[];
    if (isOffer) tags.add('On Offer');
    if (isOOSPreorder) {
      tags.add(
        eligibilityState.salesOrgConfigs.addOosMaterials.productTag(
          eligibilityState.validateOutOfStockValue,
        ),
      );
    }
    trackMixpanelEvent(
      TrackingEvents.productItemClicked,
      props: {
        TrackingProps.clickAt: clickAt,
        TrackingProps.isBundle: false,
        TrackingProps.productName: material.displayDescription,
        TrackingProps.productNumber: material.materialNumber.displayMatNo,
        TrackingProps.productManufacturer: material.getManufactured,
        TrackingProps.section: section,
        TrackingProps.tag: tags.join(', '),
      },
    );
    trackClevertapEvent(
      TrackingEvents.productItemClicked,
      props: {
        TrackingProps.clickAt: clickAt,
        TrackingProps.isBundle: false,
        TrackingProps.productName: material.displayDescription,
        TrackingProps.productNumber: material.materialNumber.displayMatNo,
        TrackingProps.productManufacturer: material.getManufactured,
        TrackingProps.tag: tags.join(', '),
      },
    );
    context.router.push(ProductDetailsPageRoute(materialInfo: material));
  }
}
