part of 'package:ezrxmobile/presentation/faq/faq_info.dart';

class _CategoryTile extends StatelessWidget {
  final FAQCategoryGroup faqCategoryGroup;
  const _CategoryTile({
    super.key,
    required this.faqCategoryGroup,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FaqBloc, FaqState>(
      buildWhen: (previous, current) =>
          previous.getSearchedFaqList != current.getSearchedFaqList,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            !state.searchKey.validateNotEmpty &&
                    state.selectedCategory.getOrDefaultValue('') !=
                        faqCategoryGroup.displayName
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: padding12,
                      top: padding24,
                    ),
                    child: Text(
                      faqCategoryGroup.displayName,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: ZPColors.primary),
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(
              height: padding12,
            ),
            ...faqCategoryGroup.faqItem.map(
              (e) => CustomCard(
                padding: const EdgeInsets.symmetric(horizontal: padding12),
                margin: const EdgeInsets.symmetric(
                  horizontal: padding12,
                  vertical: padding6,
                ),
                child: custom.ExpansionTile(
                  threeLineTitle: true,
                  initiallyExpanded: false,
                  iconColor: ZPColors.primary,
                  title: Text(
                    e.question,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: ZPColors.primary),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: padding12),
                      child: Text(
                        e.answer,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: ZPColors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
