import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/deep_linking/deep_linking_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// aware issue :
// https://dev.azure.com/zuelligpharmadevops/eZRx%20Overall/_wiki/wikis/eZRx-Overall.wiki/3443/eZRx-banner-workflow-doubt
class CarouselBannerTile extends StatelessWidget {
  final EZReachBanner banner;
  final int bannerPosition;

  const CarouselBannerTile({
    super.key,
    required this.bannerPosition,
    required this.banner,
  });
  @override
  Widget build(BuildContext context) {
    final bannerUrl = Responsive.isMobile(context)
        ? banner.mobileBannerUrl
        : banner.tabBannerUrl;

    return GestureDetector(
      onTap: () async {
        trackMixpanelEvent(
          TrackingEvents.bannerClick,
          props: {
            TrackingProps.bannerId: banner.id,
            TrackingProps.bannerTitle: banner.title,
            TrackingProps.bannerOrder: bannerPosition,
            TrackingProps.bannerRedirected: banner.navigationalURL.type,
          },
        );

        if (banner.navigationalURL.isInternalLink) {
          context.read<DeepLinkingBloc>().add(
                DeepLinkingEvent.addPendingLink(
                  EzrxLink(banner.navigationalURL.getOrDefaultValue('')),
                  banner: banner,
                ),
              );
        } else if (banner.navigationalURL.isExternalLink) {
          await context.router.push(
            WebViewPageRoute(
              url: banner.navigationalURL.getOrDefaultValue(''),
            ),
          );
        } else if (banner.keyword.isValid() && context.mounted) {
          locator<MixpanelService>().setBannerOrderFlow(banner);
          //to update search on product listing page
          context.read<MaterialListBloc>().add(
                MaterialListEvent.updateSearchKey(
                  searchKey: banner.keyword.getOrDefaultValue(''),
                ),
              );
          //to fetch materials
          context.read<MaterialListBloc>().add(
                MaterialListEvent.fetch(
                  selectedMaterialFilter:
                      context.read<MaterialFilterBloc>().state.materialFilter,
                ),
              );
          await context.navigateTo(const ProductsTabRoute());
        }
      },
      child: CustomImage(
        fit: BoxFit.fill,
        imageUrl: bannerUrl,
        placeholder: LoadingShimmer.logo(),
        errorWidget:
            bannerUrl.isEmpty ? LoadingShimmer.logo() : const Icon(Icons.error),
      ),
    );
  }
}
