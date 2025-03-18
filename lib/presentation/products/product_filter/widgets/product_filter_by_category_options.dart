part of 'package:ezrxmobile/presentation/products/product_filter/product_filter_page.dart';

class _ProductFilterByCategoryOptions extends StatelessWidget {
  const _ProductFilterByCategoryOptions();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialFilterBloc, MaterialFilterState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, state) => state.materialFilter.displayCategorySection
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.tr('Filter by'),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
                const SizedBox(height: 22.0),
                if (state.materialFilter.displayManufactureOption) ...[
                  const _ManufacturerSection(),
                  const SizedBox(height: 22.0),
                ],
                if (state.materialFilter.displayCountryOfOriginOption)
                  const _CountryOfOriginSection(),
              ],
            )
          : const SizedBox(),
    );
  }
}

class _ManufacturerSection extends StatelessWidget {
  const _ManufacturerSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialFilterBloc, MaterialFilterState>(
      buildWhen: (previous, current) =>
          previous.materialFilter.manufactureListSelected !=
          current.materialFilter.manufactureListSelected,
      builder: (context, state) => InkWell(
        key: WidgetKeys.filterManufacturerButton,
        onTap: () => _showFilterByPage(
          context: context,
          materialFilterType: MaterialFilterType.manufactured,
        ),
        child: Row(
          children: [
            Text(
              context.tr(
                context
                    .read<EligibilityBloc>()
                    .state
                    .productManufacturerFilterTitle,
              ),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
            const SizedBox(width: 4.0),
            if (state.materialFilter.manufactureListSelected.isNotEmpty)
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: ZPColors.primary,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 2.0,
                  ),
                  child: Text(
                    '${state.materialFilter.manufactureListSelected.length} ${context.tr('selected')}',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: ZPColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                    key: WidgetKeys.manufactureListSelectedLength,
                  ),
                ),
              ),
            const SizedBox(width: 4.0),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: ZPColors.extraDarkGreen,
              size: 12,
            ),
          ],
        ),
      ),
    );
  }
}

class _CountryOfOriginSection extends StatelessWidget {
  const _CountryOfOriginSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialFilterBloc, MaterialFilterState>(
      buildWhen: (previous, current) =>
          previous.materialFilter.countryListSelected !=
          current.materialFilter.countryListSelected,
      builder: (context, state) => InkWell(
        key: WidgetKeys.filterCountryOfOriginButton,
        onTap: () => _showFilterByPage(
          context: context,
          materialFilterType: MaterialFilterType.countryList,
        ),
        child: Row(
          children: [
            Text(
              context.tr('Country of origin'),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
            const SizedBox(width: 4.0),
            if (state.materialFilter.countryListSelected.isNotEmpty)
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: ZPColors.primary,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 2.0,
                  ),
                  child: Text(
                    '${state.materialFilter.countryListSelected.length} ${context.tr('selected')}',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: ZPColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                    key: WidgetKeys.countryListSelectedLength,
                  ),
                ),
              ),
            const SizedBox(width: 4.0),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: ZPColors.extraDarkGreen,
              size: 12,
            ),
          ],
        ),
      ),
    );
  }
}

void _showFilterByPage({
  required BuildContext context,
  required MaterialFilterType materialFilterType,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    enableDrag: false,
    isDismissible: false,
    useSafeArea: true,
    builder: (_) => FilterByPage(
      materialFilterType: materialFilterType,
    ),
  ).then(
    (value) => context.read<MaterialFilterBloc>().add(
          const MaterialFilterEvent.updateSearchKey(''),
        ),
  );
}
