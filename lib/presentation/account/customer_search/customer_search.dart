import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;

part 'package:ezrxmobile/presentation/account/customer_search/widgets/delivery_address_item.dart';

part 'package:ezrxmobile/presentation/account/customer_search/widgets/ship_to_address_section.dart';

part 'package:ezrxmobile/presentation/account/customer_search/widgets/delivery_address_search_section.dart';

part 'package:ezrxmobile/presentation/account/customer_search/widgets/change_delivery_address.dart';

part 'package:ezrxmobile/presentation/account/customer_search/widgets/ship_to_address_title.dart';

part 'package:ezrxmobile/presentation/account/customer_search/widgets/ship_to_address_info.dart';

part 'package:ezrxmobile/presentation/account/customer_search/widgets/show_default_tag.dart';

part 'package:ezrxmobile/presentation/account/customer_search/widgets/title_section.dart';

@RoutePage()
class CustomerSearchPage extends StatelessWidget {
  const CustomerSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EligibilityBloc, EligibilityState>(
      buildWhen: (previous, current) =>
          previous.haveCustomerCodeInfo != current.haveCustomerCodeInfo,
      builder: (_, eligibilityState) {
        return Scaffold(
          key: WidgetKeys.customerSearchPage,
          appBar: AppBar(
            title: Text(
              context.tr('Select delivery address'),
              style: Theme.of(context).textTheme.labelLarge,
            ),
            centerTitle: false,
            automaticallyImplyLeading: eligibilityState.haveCustomerCodeInfo,
            leading: eligibilityState.haveCustomerCodeInfo
                ? PopScope(
                    canPop: eligibilityState.haveCustomerCodeInfo,
                    child: IconButton(
                      key: WidgetKeys.backButton,
                      icon: const Icon(Icons.arrow_back_ios_sharp),
                      onPressed: () => context.maybePop(),
                    ),
                    onPopInvoked: (bool didPop) async {
                      if (didPop) return;

                      await SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop');
                    },
                  )
                : null,
            actions: [
              if (eligibilityState.user.isMultiSalesOrgs)
                BlocConsumer<SalesOrgBloc, SalesOrgState>(
                  listenWhen: (previous, current) =>
                      (previous.isLoading != current.isLoading &&
                          !current.isLoading) &&
                      (previous.salesOrganisation !=
                              SalesOrganisation.empty() &&
                          previous.salesOrganisation !=
                              current.salesOrganisation),
                  listener: (context, state) {
                    context.read<EligibilityBloc>().add(
                          EligibilityEvent.selectedCustomerCode(
                            customerCodeInfo: CustomerCodeInfo.empty(),
                            shipToInfo: ShipToInfo.empty(),
                          ),
                        );
                  },
                  buildWhen: (previous, current) {
                    return previous.salesOrg != current.salesOrg;
                  },
                  builder: (context, state) {
                    return InkWell(
                      onTap: () {
                        context.read<SalesOrgBloc>().add(
                              SalesOrgEvent.fetchAvailableSalesOrg(
                                avialableSalesOrgList: context
                                    .read<UserBloc>()
                                    .state
                                    .user
                                    .userSalesOrganisations,
                              ),
                            );
                        context.router.push(
                          SalesOrgSearchRoute(
                            avialableSalesOrgList: context
                                .read<UserBloc>()
                                .state
                                .user
                                .userSalesOrganisations,
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: padding12),
                        child: Column(
                          children: [
                            ClipOval(
                              child: SizedBox(
                                height: 25.0,
                                width: 25.0,
                                child: SvgPicture.asset(
                                  key: WidgetKeys.countryFlag,
                                  state.salesOrg.countryFlag,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const SizedBox(height: padding6),
                            Text(
                              '${state.salesOrg.buName} ${state.salesOrg.getOrDefaultValue('')}',
                              style: Theme.of(context).textTheme.bodySmall,
                              key: WidgetKeys.changeSalesOrgButton,
                            ).tr(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
          body: Column(
            children: [
              AnnouncementWidget(
                currentPath: context.router.currentPath,
              ),
              const _DeliveryAddressSearchSection(),
              BlocConsumer<CustomerCodeBloc, CustomerCodeState>(
                listenWhen: (previous, current) =>
                    previous.apiFailureOrSuccessOption !=
                    current.apiFailureOrSuccessOption,
                listener: (context, state) {
                  state.apiFailureOrSuccessOption.fold(
                    () {},
                    (either) => either.fold(
                      (failure) {
                        ErrorUtils.handleApiFailure(context, failure);
                      },
                      (_) {},
                    ),
                  );
                },
                buildWhen: (previous, current) =>
                    previous.isFetching != current.isFetching,
                builder: (context, state) {
                  return _BodyContent(
                    state: state,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _BodyContent extends StatelessWidget {
  final CustomerCodeState state;

  const _BodyContent({
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: state.isFetching && state.customerCodeList.isEmpty
          ? LoadingShimmer.logo(
              key: WidgetKeys.loaderImage,
            )
          : ScrollList<CustomerCodeInfo>(
              controller: ScrollController(),
              key: WidgetKeys.customerCodeList,
              dismissOnDrag: true,
              onRefresh: () {
                context.read<CustomerCodeBloc>().add(
                      CustomerCodeEvent.fetch(
                        searchValue: SearchKey.empty(),
                      ),
                    );
              },
              onLoadingMore: () {
                context.read<CustomerCodeBloc>().add(
                      const CustomerCodeEvent.loadMore(),
                    );
              },
              isLoading: state.isFetching,
              itemBuilder: (_, __, item) =>
                  _DeliveryAddressItem(customerCodeInfo: item),
              items: state.customerCodeList,
              noRecordFoundWidget: const NoRecordFound(
                subTitle:
                    'Check the location name or code you have entered for any errors',
                svgImage: SvgImage.deliveryAddress,
              ),
            ),
    );
  }
}
