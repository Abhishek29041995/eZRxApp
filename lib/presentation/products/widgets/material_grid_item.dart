import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/favorite_icon.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/product_price_label.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/widgets/combo_offer_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/covid_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/offer_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/stock_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/tender_label.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialGridItem extends StatelessWidget {
  final MaterialInfo materialInfo;
  final VoidCallback onTap;
  final VoidCallback onFavouriteTap;

  const MaterialGridItem({
    required this.materialInfo,
    required this.onTap,
    required this.onFavouriteTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomCard(
        clipBehavior: Clip.antiAlias,
        key: WidgetKeys.materialListMaterialCard,
        margin: const EdgeInsets.all(padding6),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 4,
                  child: ColoredBox(
                    color: ZPColors.white,
                    child: Stack(
                      children: [
                        Center(
                          child: ProductImage(
                            materialNumber: materialInfo.materialNumber,
                            fit: BoxFit.fill,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StockLabel(
                              materialInfo: materialInfo,
                            ),
                            OfferLabel(
                              materialInfo: materialInfo,
                            ),
                            ComboOfferLabel(
                              materialInfo: materialInfo,
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (materialInfo.isPoison)
                                ProductTag.poison(isRounded: false),
                              if (materialInfo.isSampleMaterial)
                                ProductTag.sample(isRounded: false),
                              if (materialInfo.isGimmick)
                                ProductTag.gimmickTag(isRounded: false),
                              CovidLabel(
                                materialInfo: materialInfo,
                              ),
                              TenderLabel(materialInfo: materialInfo),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: FavouriteIcon(
                            isFavourite: materialInfo.isFavourite,
                            onTap: () {
                              if (!materialInfo.isFavourite) {
                                trackMixpanelEvent(
                                  TrackingEvents.addProductToFavorite,
                                  props: {
                                    TrackingProps.productName:
                                        materialInfo.displayDescription,
                                    TrackingProps.productNumber: materialInfo
                                        .materialNumber.displayMatNo,
                                    TrackingProps.productManufacturer:
                                        materialInfo.getManufactured,
                                    TrackingProps.clickAt:
                                        RouterUtils.buildRouteTrackingName(
                                      context.router.currentPath,
                                    ),
                                  },
                                );
                              }

                              onFavouriteTap.call();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: ZPColors.lightGrey,
                  indent: 0,
                  endIndent: 0,
                  height: 1,
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: padding6,
                      horizontal: padding12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          materialInfo.combinationCode(
                            showGMCPart: context
                                .read<EligibilityBloc>()
                                .state
                                .salesOrgConfigs
                                .enableGMC,
                            showIRNPart: false,
                          ),
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: ZPColors.darkGray,
                                  ),
                          key: WidgetKeys.materialNumberText,
                        ),
                        if (context
                                .read<EligibilityBloc>()
                                .state
                                .salesOrgConfigs
                                .enableIRN &&
                            materialInfo.getIRN.isValidIRN)
                          Text(
                            materialInfo.getIRN.getValue(),
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: ZPColors.darkGray,
                                    ),
                            key: WidgetKeys.itemRegistrationNumber,
                          ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              materialInfo.displayDescription,
                              key: WidgetKeys.nameCart,
                              style: Theme.of(context).textTheme.labelSmall,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Text(
                          (materialInfo.manufacturerPrefix.isNotEmpty
                                  ? '${context.tr(materialInfo.manufacturerPrefix)}: '
                                  : '') +
                              materialInfo.getManufactured,
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: ZPColors.darkGray,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          key: WidgetKeys.manufacturerMaterials,
                        ),
                        const SizedBox(height: padding6),
                        ProductPriceLabel(materialInfo: materialInfo),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (materialInfo.isMarketPlace)
              const Positioned(
                top: 10,
                right: 10,
                child: MarketPlaceLogo(),
              ),
          ],
        ),
      ),
    );
  }
}
