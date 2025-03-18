import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/bundle_grid_item.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/core/section_tile.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';

class BundleSection extends StatelessWidget {
  const BundleSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return BlocProvider<MaterialListBloc>(
      create: (context) => locator<MaterialListBloc>()
        ..add(
          MaterialListEvent.initialized(
            salesOrganisation: eligibilityState.salesOrganisation,
            configs: eligibilityState.salesOrgConfigs,
            customerCodeInfo: eligibilityState.customerCodeInfo,
            shipToInfo: eligibilityState.shipToInfo,
            selectedMaterialFilter: MaterialFilter.empty().copyWith(
              bundleOffers: true,
            ),
            user: eligibilityState.user,
          ),
        ),
      child: BlocListener<EligibilityBloc, EligibilityState>(
        listenWhen: (previous, current) => current.isRefreshed(previous),
        listener: (context, state) {
          context.read<MaterialListBloc>().add(
                MaterialListEvent.initialized(
                  salesOrganisation: state.salesOrganisation,
                  configs: state.salesOrgConfigs,
                  customerCodeInfo: state.customerCodeInfo,
                  shipToInfo: state.shipToInfo,
                  selectedMaterialFilter: MaterialFilter.empty().copyWith(
                    bundleOffers: true,
                  ),
                  user: state.user,
                ),
              );
        },
        child: BlocConsumer<MaterialListBloc, MaterialListState>(
          listenWhen: (previous, current) =>
              previous.apiFailureOrSuccessOption !=
              current.apiFailureOrSuccessOption,
          listener: (context, state) => state.apiFailureOrSuccessOption.fold(
            () => {},
            (either) => either.fold(
              (failure) =>
                  ErrorUtils.handleStockInfoApiFailure(context, failure),
              (_) => {},
            ),
          ),
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching,
          builder: (_, state) {
            return state.isFetching || state.materialList.isNotEmpty
                ? Column(
                    key: WidgetKeys.bundlesBody,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: padding12,
                          top: padding6,
                        ),
                        child: SectionTitle(
                          key: WidgetKeys.bundles,
                          title: 'Bundles',
                          onTapIconButton: () => state.isFetching
                              ? null
                              : _navigateForMoreBundle(context),
                        ),
                      ),
                      SizedBox(
                        height: 220,
                        child: state.isFetching
                            ? LoadingShimmer.logo(
                                key: WidgetKeys.bundleSectionLoaderImage,
                              )
                            : ListView(
                                padding: const EdgeInsets.only(left: padding6),
                                key: WidgetKeys.bundlesList,
                                scrollDirection: Axis.horizontal,
                                children: state.materialList
                                    .map(
                                      (e) => BundleGridItem(
                                        materialInfo: e,
                                        isHomeTab: true,
                                      ),
                                    )
                                    .toList(),
                              ),
                      ),
                    ],
                  )
                : const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  void _navigateForMoreBundle(BuildContext context) {
    context.read<MaterialListBloc>().add(
          MaterialListEvent.fetch(
            selectedMaterialFilter: MaterialFilter.empty().copyWith(
              bundleOffers: true,
            ),
          ),
        );
    context.navigateTo(const ProductsTabRoute());
  }
}
