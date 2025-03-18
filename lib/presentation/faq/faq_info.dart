import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/faq/faq_bloc.dart';
import 'package:ezrxmobile/domain/faq/entity/faq_category_group.dart';
import 'package:ezrxmobile/domain/faq/entity/faq_item.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/faq/widgets/contact_us_button.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;
part 'package:ezrxmobile/presentation/faq/widgets/category_tile.dart';
part 'package:ezrxmobile/presentation/faq/widgets/show_contact_us_button.dart';

class FaqInfoPage extends StatelessWidget {
  const FaqInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FaqBloc, FaqState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching ||
          previous.selectedCategory != current.selectedCategory ||
          previous.searchKey != current.searchKey,
      builder: (context, state) {
        if (state.isFetching && state.faqInfo.faqList.isEmpty) {
          return LoadingShimmer.logo(
            key: WidgetKeys.loaderImage,
          );
        }

        return ScrollList<FAQCategoryGroup>(
          controller: ScrollController(),
          dismissOnDrag: true,
          noRecordFoundWidget: const NoRecordFound(
            key: WidgetKeys.faqNotFoundRecordKey,
            title: "That didn't match anything",
            subTitle:
                "Try adjusting your search to find what you're looking for or",
            svgImage: SvgImage.faqSearch,
            actionButton: ContactUsButton(),
          ),
          isLoading: state.isFetching,
          itemBuilder: (context, index, item) => Column(
            children: [
              _CategoryTile(
                key: WidgetKeys.genericKey(
                  key: item.faqItem.first.category.getOrDefaultValue(''),
                ),
                faqCategoryGroup: item,
              ),
              index == state.getSearchedFaqList.getFAQItemList.length - 1
                  ? const _ShowContactUsButton()
                  : const SizedBox.shrink(),
            ],
          ),
          items: state.getSearchedFaqList.getFAQItemList,
          onRefresh: () => context.read<FaqBloc>().add(
                FaqEvent.getFaq(
                  salesOrg: context.read<EligibilityBloc>().state.salesOrg,
                ),
              ),
          onLoadingMore: () => context.read<FaqBloc>().add(
                FaqEvent.loadMoreAFaq(
                  salesOrg: context.read<EligibilityBloc>().state.salesOrg,
                ),
              ),
        );
      },
    );
  }
}
