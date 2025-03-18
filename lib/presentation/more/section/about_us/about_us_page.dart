import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/scroll_to_top_widget.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/domain/about_us/entities/about_us.dart';
import 'package:ezrxmobile/application/about_us/about_us_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
part 'package:ezrxmobile/presentation/more/section/about_us/widgets/content_split_section.dart';
part 'package:ezrxmobile/presentation/more/section/about_us/widgets/who_we_are_section.dart';
part 'package:ezrxmobile/presentation/more/section/about_us/widgets/our_partners_section.dart';
part 'package:ezrxmobile/presentation/more/section/about_us/widgets/certifications_section.dart';

@RoutePage()
class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrollAtInitialPosition = true;
  @override
  void initState() {
    super.initState();
    context.read<AboutUsBloc>().add(const AboutUsEvent.fetchAboutUsInfo());
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      _isScrollAtInitialPosition = _scrollController.initialScrollOffset ==
          _scrollController.position.pixels;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.commonAppBar(
        title: Text(
          context.tr('About Us'),
        ),
        customerBlockedOrSuspended:
            context.read<EligibilityBloc>().state.customerBlockOrSuspended,
      ),
      body: BlocConsumer<AboutUsBloc, AboutUsState>(
        listenWhen: (previous, current) =>
            previous.apiFailureOrSuccessOption !=
            current.apiFailureOrSuccessOption,
        listener: (context, state) => state.apiFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) => ErrorUtils.handleApiFailure(context, failure),
            (_) {},
          ),
        ),
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching,
        builder: (context, state) {
          if (state.isFetching) {
            return LoadingShimmer.logo(
              key: WidgetKeys.loaderImage,
            );
          }
          final aboutUsInfo = state.aboutUsInfo;

          return RefreshIndicator(
            onRefresh: () async => context.read<AboutUsBloc>().add(
                  const AboutUsEvent.fetchAboutUsInfo(),
                ),
            child: aboutUsInfo != AboutUs.empty()
                ? ListView(
                    key: WidgetKeys.aboutUsListContent,
                    controller: _scrollController,
                    children: [
                      CustomImage(
                        imageUrl: aboutUsInfo.banner.media.src,
                        errorWidget: const SizedBox.shrink(),
                        width: double.infinity,
                        height: 200,
                      ),
                      _HeaderSection(
                        bannerTemplate: aboutUsInfo.banner,
                        appMarket: state.salesOrg.appMarket,
                      ),
                      _OurCertificationsSection(
                        certifications: aboutUsInfo.certifications,
                      ),
                      _WhoWeAreSection(
                        whoWeAre: state.aboutUsInfo.whoWeAre,
                      ),
                      _OurPartnersSection(
                        ourPartners: aboutUsInfo.ourPartners,
                      ),
                      ...aboutUsInfo.contentSplit.map(
                        (e) => _ContentSplitSection(contentSplit: e),
                      ),
                    ],
                  )
                : ListView(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height),
                    ],
                  ),
          );
        },
      ),
      floatingActionButton: ScrollToTopWidget(
        scrollController: _scrollController,
        isVisible: !_isScrollAtInitialPosition,
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  final BannerTemplate bannerTemplate;
  final AppMarket appMarket;
  const _HeaderSection({
    required this.bannerTemplate,
    required this.appMarket,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      key: WidgetKeys.aboutUsHeaderSection,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bannerTemplate.title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: ZPColors.extraDarkGreen,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            bannerTemplate.content,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ZPColors.neutralsBlack,
                ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () =>
                  context.router.push(ContactUsPageRoute(appMarket: appMarket)),
              child: Text(bannerTemplate.buttonName),
            ),
          ),
        ],
      ),
    );
  }
}
