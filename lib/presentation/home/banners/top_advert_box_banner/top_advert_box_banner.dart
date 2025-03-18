import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/home/banners/top_advert_box_banner/top_advert_box_banner_tile.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopAdvertBoxBanner extends StatelessWidget {
  const TopAdvertBoxBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<BannerBloc>(),
      child: BlocListener<EligibilityBloc, EligibilityState>(
        //This check is required for refresh the data whenever sales org is refreshed
        //Whenever sales org is refreshed, the customer code is also refreshed after that
        //and isLoadingCustomerCode value will be changed
        listenWhen: (previous, current) =>
            previous.isLoadingCustomerCode != current.isLoadingCustomerCode &&
            !current.isLoadingCustomerCode,
        listener: (context, state) {
          context.read<BannerBloc>().add(
                BannerEvent.fetch(
                  isPreSalesOrg: false,
                  country: state.salesOrg.country,
                  salesOrganisation: state.salesOrganisation,
                  role: state.user.role.type.getEZReachRoleType,
                  bannerType: 'top_advert_box',
                  branchCode: '',
                  targetCustomerType: '',
                ),
              );
        },
        child: BlocBuilder<BannerBloc, BannerState>(
          buildWhen: (previous, current) => previous.banner != current.banner,
          builder: (context, state) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(
                vertical: state.banner.isEmpty ? 0 : padding24,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.banner.length,
              itemBuilder: (context, index) {
                final bannerUrl = Responsive.isMobile(context)
                    ? state.banner[index].mobileBannerUrl
                    : state.banner[index].tabBannerUrl;

                return TopAdvertBoxBannerTile(
                  imageUrl: bannerUrl,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
