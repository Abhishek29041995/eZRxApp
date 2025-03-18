part of 'package:ezrxmobile/presentation/home/product_offer_section/product_offer_section.dart';

class _ProductTile extends StatelessWidget {
  final MaterialInfo materialInfo;
  const _ProductTile({required this.materialInfo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateToDetails(context, materialInfo),
      child: SizedBox(
        width: Responsive.isMobile(context)
            ? MediaQuery.of(context).size.width * 0.9
            : MediaQuery.of(context).size.width * 0.45,
        child: Stack(
          children: [
            CustomCard(
              margin: const EdgeInsets.all(padding6),
              child: ListTile(
                key: WidgetKeys.productOnOffer,
                contentPadding: const EdgeInsets.all(padding6),
                minVerticalPadding: 0,
                title: Row(
                  children: [
                    Stack(
                      children: [
                        CustomCard(
                          showBorder: true,
                          showShadow: false,
                          child: ProductImage(
                            key: WidgetKeys.materialNumberInfo,
                            materialNumber: materialInfo.materialNumber,
                            fit: BoxFit.fitHeight,
                            height: 100,
                            width: 100,
                          ),
                        ),
                        ProductTag.onOfferIcon(),
                      ],
                    ),
                    const SizedBox(
                      width: padding6,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
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
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: ZPColors.extraLightGrey4),
                          ),
                          PreOrderLabel(
                            stockInfo: materialInfo.productStockInfo,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              materialInfo.name,
                              style: Theme.of(context).textTheme.labelSmall,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            materialInfo.getManufactured,
                            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              color: ZPColors.extraLightGrey4,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ProductPriceLabel(
                                  materialInfo: materialInfo,
                                ),
                              ),
                              FavouriteIcon(
                                key: WidgetKeys.favIcon(
                                  materialInfo.materialNumber
                                      .getOrDefaultValue(''),
                                ),
                                isFavourite: materialInfo.isFavourite,
                                visualDensity: const VisualDensity(
                                  horizontal: -4,
                                  vertical: -4,
                                ),
                                onTap: () {
                                  if (materialInfo.isFavourite) {
                                    trackMixpanelEvent(
                                      TrackingEvents.addProductToFavorite,
                                      props: {
                                        TrackingProps.productName:
                                            materialInfo.displayDescription,
                                        TrackingProps.productNumber:
                                            materialInfo
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
                                  materialInfo.isFavourite
                                      ? context.read<MaterialListBloc>().add(
                                            MaterialListEvent.deleteFavourite(
                                              item: materialInfo,
                                            ),
                                          )
                                      : context.read<MaterialListBloc>().add(
                                            MaterialListEvent.addFavourite(
                                              item: materialInfo,
                                            ),
                                          );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToDetails(BuildContext context, MaterialInfo materialInfo) {
    trackMixpanelEvent(
      TrackingEvents.productItemClicked,
      props: {
        TrackingProps.clickAt:
            RouterUtils.buildRouteTrackingName(context.router.currentPath),
        TrackingProps.isBundle: false,
        TrackingProps.productName: materialInfo.displayDescription,
        TrackingProps.productNumber: materialInfo.materialNumber.displayMatNo,
        TrackingProps.productManufacturer: materialInfo.getManufactured,
        TrackingProps.section: 'Products on offer',
        TrackingProps.tag: 'On Offer',
      },
    );
    trackClevertapEvent(
      TrackingEvents.productItemClicked,
      props: {
        TrackingProps.clickAt:
            RouterUtils.buildRouteTrackingName(context.router.currentPath),
        TrackingProps.isBundle: false,
        TrackingProps.productName: materialInfo.displayDescription,
        TrackingProps.productNumber: materialInfo.materialNumber.displayMatNo,
        TrackingProps.productManufacturer: materialInfo.getManufactured,
        TrackingProps.tag: 'On Offer',
      },
    );

    context.router.push(ProductDetailsPageRoute(materialInfo: materialInfo));
  }
}
