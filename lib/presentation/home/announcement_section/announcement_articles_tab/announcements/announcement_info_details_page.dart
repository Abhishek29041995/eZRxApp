import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_attachment_bloc/announcement_attachment_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_details/announcement_info_details_bloc.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_info_details.dart';
import 'package:ezrxmobile/domain/announcement_info/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/core/scroll_to_top_widget.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements/widgets/announcement_manufacture_source.dart';
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements/widgets/new_announcement_icon.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
part 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements/widgets/announcement_info_bottom_sheet.dart';
part 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements/widgets/announcement_info_item_description.dart';
part 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements/widgets/announcement_info_title_section.dart';
part 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements/widgets/announcement_info_attachment_section.dart';

@RoutePage()
class AnnouncementInfoDetailsPage extends StatefulWidget {
  const AnnouncementInfoDetailsPage({super.key});

  @override
  State<AnnouncementInfoDetailsPage> createState() =>
      _AnnouncementInfoDetailsPageState();
}

class _AnnouncementInfoDetailsPageState
    extends State<AnnouncementInfoDetailsPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrollAtInitialPosition = true;
  bool _isBackButtonEnableForAppbar = false;

  @override
  void initState() {
    super.initState();
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
      _isBackButtonEnableForAppbar = _scrollController.position.pixels > 220;
    });
  }

  void _changeStateOnMovingToNewDetails() {
    setState(() {
      _isScrollAtInitialPosition = true;
      _isBackButtonEnableForAppbar = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AnnouncementInfoDetailsBloc,
        AnnouncementInfoDetailsState>(
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
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return Scaffold(
          key: WidgetKeys.announcementDetailsPageKey,
          body: SafeArea(
            child: state.isLoading
                ? LoadingShimmer.logo(
                    key: WidgetKeys.loaderImage,
                  )
                : CustomScrollView(
                    controller: _scrollController,
                    key: WidgetKeys.announcementInfoDetailList,
                    slivers: [
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        expandedHeight: 300,
                        floating: true,
                        snap: true,
                        pinned: true,
                        flexibleSpace: Stack(
                          children: [
                            FlexibleSpaceBar(
                              key: WidgetKeys.announcementDetailImageKey,
                              background: CustomImage(
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.contain,
                                imageUrl:
                                    state.announcementInfoDetails.thumbnail,
                                errorWidget: const NoRecordFound(
                                  svgImage: SvgImage.noImageAvailable,
                                  title: 'Image not available',
                                  subTitle: '',
                                ),
                              ),
                            ),
                            if (!_isBackButtonEnableForAppbar)
                              IconButton(
                                key: WidgetKeys.announcementDetailsBackButton,
                                onPressed: () => context.router.maybePop(),
                                icon: const CircleAvatar(
                                  maxRadius: 13,
                                  backgroundColor:
                                      ZPColors.defaultReturnSummaryStatusColor,
                                  child: Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    size: 15,
                                    color: ZPColors.white,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        centerTitle: false,
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    minLeadingWidth: 0,
                                    horizontalTitleGap:
                                        _isBackButtonEnableForAppbar ? 5 : 0,
                                    leading: _isBackButtonEnableForAppbar
                                        ? IconButton(
                                            key: WidgetKeys
                                                .announcementDetailsBottomBackButtonKey,
                                            onPressed: () =>
                                                context.router.maybePop(),
                                            constraints: const BoxConstraints(),
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            icon: const Icon(
                                              Icons.arrow_back_ios_rounded,
                                              size: 20,
                                            ),
                                          )
                                        : null,
                                    title: _AnnouncementInfoTitleSection(
                                      details: state.announcementInfoDetails,
                                    ),
                                  ),
                                  Html(
                                    style: {
                                      'body': Style(
                                        padding: HtmlPaddings.all(0),
                                        margin: Margins.all(0),
                                      ),
                                    },
                                    data: state.announcementInfoDetails.content
                                        .appendedImgSrcWithBaseUrlWithMedia,
                                    shrinkWrap: true,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                            _AnnouncementInfoAttachmentSection(
                              documentList:
                                  state.announcementInfoDetails.documents,
                            ),
                            _AnnouncementInfoBottomSheet(
                              key: WidgetKeys.announcementDetailOtherSection,
                              isLoading: state.isLoading,
                              changeState: _changeStateOnMovingToNewDetails,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
          floatingActionButton: ScrollToTopWidget(
            scrollController: _scrollController,
            isVisible: !_isScrollAtInitialPosition,
          ),
        );
      },
    );
  }
}
