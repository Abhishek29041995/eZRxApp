import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/section_tile.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/widgets/product_card.dart';
import 'package:ezrxmobile/presentation/home/widgets/product_loading_shimmer.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrowseProduct extends StatelessWidget {
  const BrowseProduct({super.key});

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
            selectedMaterialFilter: MaterialFilter.empty(),
            user: eligibilityState.user,
          ),
        ),
      child: MultiBlocListener(
        listeners: [
          BlocListener<EligibilityBloc, EligibilityState>(
            listenWhen: (previous, current) => current.isRefreshed(previous),
            listener: (context, state) {
              context.read<MaterialListBloc>().add(
                    MaterialListEvent.initialized(
                      salesOrganisation: state.salesOrganisation,
                      configs: state.salesOrgConfigs,
                      customerCodeInfo: state.customerCodeInfo,
                      shipToInfo: state.shipToInfo,
                      selectedMaterialFilter: MaterialFilter.empty(),
                      user: state.user,
                    ),
                  );
            },
          ),
          BlocListener<MaterialListBloc, MaterialListState>(
            listenWhen: (previous, current) =>
                previous.materialList != current.materialList,
            listener: (context, state) {
              if (state.materialList.isNotEmpty) {
                context.read<MaterialPriceBloc>().add(
                      MaterialPriceEvent.fetch(
                        comboDealEligible: context
                            .read<EligibilityBloc>()
                            .state
                            .comboDealEligible,
                        materials: state.materialList,
                      ),
                    );
              }
            },
          ),
        ],
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
              previous.isFetching != current.isFetching ||
              previous.materialList != current.materialList,
          builder: (_, state) {
            return state.isFetching || state.materialList.isNotEmpty
                ? Column(
                    key: WidgetKeys.browseProduct,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: padding12,
                          top: padding6,
                        ),
                        child: SectionTitle(
                          key: WidgetKeys.browseProductIcon,
                          title: 'Browse products',
                          onTapIconButton: () => state.isFetching
                              ? null
                              : _navigateForMoreProducts(context),
                        ),
                      ),
                      SizedBox(
                        height: eligibilityState
                            .salesOrgConfigs.browseProductsCardHeight,
                        child: state.isFetching
                            ? const ProductLoadingShimmer(
                                key: WidgetKeys.browseProductLoadingShimmer,
                              )
                            : ListView(
                                padding: const EdgeInsets.only(left: padding6),
                                scrollDirection: Axis.horizontal,
                                children: state.materialList
                                    .map(
                                      (e) => ProductCard(
                                        material: e,
                                        widgetKey:
                                            WidgetKeys.browseProductsList,
                                        section: 'Browse products',
                                        onFavouriteTap: () {
                                          context.read<MaterialListBloc>().add(
                                                e.isFavourite
                                                    ? MaterialListEvent
                                                        .deleteFavourite(
                                                        item: e,
                                                      )
                                                    : MaterialListEvent
                                                        .addFavourite(
                                                        item: e,
                                                      ),
                                              );
                                        },
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

  void _navigateForMoreProducts(BuildContext context) {
    if (context.read<MaterialListBloc>().state.isFilterSelected) {
      context.read<MaterialListBloc>().add(
            MaterialListEvent.fetch(
              selectedMaterialFilter: MaterialFilter.empty(),
            ),
          );
    }
    context.navigateTo(const ProductsTabRoute());
  }
}
