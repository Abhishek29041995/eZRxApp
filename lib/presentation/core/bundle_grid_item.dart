import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/clevertap_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';

class BundleGridItem extends StatelessWidget {
  final MaterialInfo materialInfo;
  final bool isHomeTab;

  const BundleGridItem({
    super.key,
    required this.materialInfo,
    this.isHomeTab = false,
  });

  bool get _canDisplayMoreMaterials => isHomeTab
      ? materialInfo.listingVisibleMaterial.length > 2
      : materialInfo.isMaterialHiddenOnListing;

  int get _materialLengthSkip =>
      isHomeTab ? 2 : materialInfo.listingVisibleMaterial.length;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _bundleOnTap(context, materialInfo),
      child: CustomCard(
        clipBehavior: Clip.hardEdge,
        key: WidgetKeys.materialListBundleCard,
        margin: const EdgeInsets.all(padding6),
        padding: const EdgeInsets.all(0),
        width: Responsive.isMobile(context)
            ? MediaQuery.of(context).size.width * 0.87
            : MediaQuery.of(context).size.width * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColoredBox(
              color: ZPColors.blueTagColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTag.bundleOffer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: padding6,
                      horizontal: padding12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            if (materialInfo.isMarketPlace) ...[
                              MarketPlaceLogo.small(),
                              const SizedBox(width: 4),
                            ],
                            Text(
                              materialInfo.bundle.bundleCode,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: ZPColors.neutralsGrey1),
                              key: WidgetKeys.bundlesNumber,
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          materialInfo.bundle.bundleName.getOrDefaultValue(''),
                          style: Theme.of(context).textTheme.labelSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          key: WidgetKeys.bundlesDescription,
                        ),
                        const SizedBox(height: 3),
                        Text(
                          (materialInfo.manufacturerPrefix.isNotEmpty
                                  ? '${context.tr(materialInfo.manufacturerPrefix)}: '
                                  : '') +
                              materialInfo.getManufactured,
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: ZPColors.neutralsGrey1,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          key: WidgetKeys.bundlesManufactured,
                        ),
                        const SizedBox(height: 3),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ...materialInfo.listingVisibleMaterial
                .take(_materialLengthSkip)
                .map(
                  (e) => isHomeTab
                      ? Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            top: 5,
                          ),
                          child: Text(
                            '\u2022  ${e.materialDescription.getOrDefaultValue('')}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      : _BundleMaterial(materialData: e),
                ),
            if (_canDisplayMoreMaterials)
              Padding(
                key: WidgetKeys.bundleMaterialCount(
                  materialInfo.bundle.bundleCode,
                ),
                padding: const EdgeInsets.symmetric(vertical: 9).copyWith(
                  left: isHomeTab ? 30 : 0,
                ),
                child: Text(
                  '+ ${materialInfo.data.skip(_materialLengthSkip).length} materials',
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 1,
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _bundleOnTap(BuildContext context, MaterialInfo materialInfo) {
    trackMixpanelEvent(
      TrackingEvents.productItemClicked,
      props: {
        TrackingProps.clickAt:
            RouterUtils.buildRouteTrackingName(context.router.currentPath),
        TrackingProps.isBundle: true,
        TrackingProps.productName: materialInfo.defaultMaterialDescription,
        TrackingProps.productNumber: materialInfo.materialNumber.displayMatNo,
        TrackingProps.productManufacturer: materialInfo.getManufactured,
        TrackingProps.section: 'All product',
      },
    );

    trackClevertapEvent(
      TrackingEvents.productItemClicked,
      props: {
        TrackingProps.clickAt:
            RouterUtils.buildRouteTrackingName(context.router.currentPath),
        TrackingProps.isBundle: true,
        TrackingProps.productName: materialInfo.defaultMaterialDescription,
        TrackingProps.productNumber: materialInfo.materialNumber.displayMatNo,
        TrackingProps.productManufacturer: materialInfo.getManufactured,
        TrackingProps.tag: 'bundle',
      },
    );

    context.router.push(BundleDetailPageRoute(materialInfo: materialInfo));
  }
}

class _BundleMaterial extends StatelessWidget {
  final MaterialData materialData;

  const _BundleMaterial({
    required this.materialData,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      key: WidgetKeys.materialListBundleMaterial(
        materialData.materialNumber.getOrDefaultValue(''),
      ),
      children: [
        CustomCard(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
          showShadow: false,
          showBorder: true,
          child: ProductImage(
            materialNumber: materialData.materialNumber,
            height: MediaQuery.of(context).size.height * 0.03,
            width: MediaQuery.of(context).size.height * 0.03,
            fit: BoxFit.contain,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text(
              materialData.defaultMaterialDescription,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ),
      ],
    );
  }
}
