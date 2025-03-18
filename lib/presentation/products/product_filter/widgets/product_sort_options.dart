part of 'package:ezrxmobile/presentation/products/product_filter/product_filter_page.dart';

class _ProductSortOptions extends StatelessWidget {
  const _ProductSortOptions();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr('Sort by'),
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        const SizedBox(height: 16.0),
        BlocBuilder<MaterialFilterBloc, MaterialFilterState>(
          buildWhen: (previous, current) =>
              previous.materialFilter.sortBy != current.materialFilter.sortBy &&
              previous.displaySortFilter != current.displaySortFilter,
          builder: (context, state) => Column(
            children: state.displaySortFilter
                .map(
                  (e) => RadioListTile(
                    key: WidgetKeys.sortByRadio(e.title),
                    title: Text(
                      context.tr(e.title),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: ZPColors.neutralsBlack,
                          ),
                    ),
                    visualDensity: const VisualDensity(
                      horizontal: -4.0,
                      vertical: -4.0,
                    ),
                    contentPadding: EdgeInsets.zero,
                    value: e,
                    groupValue: state.materialFilter.sortBy,
                    onChanged: (value) =>
                        context.read<MaterialFilterBloc>().add(
                              MaterialFilterEvent.updateSelectedMaterialFilter(
                                MaterialFilterType.sortBy,
                                value ?? Sort.az,
                              ),
                            ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
