part of 'package:ezrxmobile/presentation/faq/faq.dart';

class _CategoryChip extends StatelessWidget {
  const _CategoryChip();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: BlocBuilder<FaqBloc, FaqState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: padding12,
            ),
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: padding6,
                ),
                child: _CustomChip(
                  title: context.tr('All'),
                  isSelected: state.selectedCategory.isAll,
                  onChanged: (value) {
                    context.read<FaqBloc>().add(
                          FaqEvent.filterByFaqCategory(
                            selectedCategory: FAQCategory('All'),
                          ),
                        );
                  },
                ),
              ),
              ...state.faqInfo.faqList.getFAQItemList.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(
                    right: padding6,
                  ),
                  child: _CustomChip(
                    key: WidgetKeys.genericKey(
                      key: 'customChip${e.displayName}',
                    ),
                    title: e.displayName,
                    isSelected: state.selectedCategory.getOrDefaultValue('') ==
                        e.displayName,
                    onChanged: (value) {
                      context.read<FaqBloc>().add(
                            FaqEvent.filterByFaqCategory(
                              selectedCategory: FAQCategory(e.displayName),
                            ),
                          );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _CustomChip extends StatelessWidget {
  final String title;
  final ValueChanged<bool> onChanged;
  final bool isSelected;
  const _CustomChip({
    super.key,
    required this.title,
    required this.onChanged,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isSelected);
      },
      child: Chip(
        backgroundColor: isSelected ? ZPColors.primary : ZPColors.accentColor,
        label: Text(
          title,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isSelected ? ZPColors.accentColor : ZPColors.black,
              ),
        ),
      ),
    );
  }
}
