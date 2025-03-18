part of 'package:ezrxmobile/presentation/products/filter_by_page/filter_by_page.dart';

class _ItemBuilder extends StatelessWidget {
  final MaterialFilter item;
  final int index;
  final MaterialFilterType materialFilterType;
  const _ItemBuilder({
    required this.item,
    required this.index,
    required this.materialFilterType,
  });

  @override
  Widget build(BuildContext context) {
    switch (materialFilterType) {
      case MaterialFilterType.manufactured:
        final conditionOfLabel = index == 0 ||
            item.manufactureMapOptions.keys.elementAt(index)[0] !=
                item.manufactureMapOptions.keys.elementAt(index - 1)[0];
                
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            conditionOfLabel
                ? Column(
                    children: [
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        item.manufactureMapOptions.keys.elementAt(index)[0],
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: ZPColors.neutralsBlack,
                                ),
                      ),
                    ],
                  )
                : const SizedBox(),
            InkWell(
              key: WidgetKeys.suggestedManufacturer,
              onTap: () {
                context.read<MaterialFilterBloc>().add(
                      MaterialFilterEvent.updateSelectedMaterialFilter(
                        materialFilterType,
                        item.manufactureMapOptions.keys.elementAt(index),
                      ),
                    );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.manufactureMapOptions.keys.elementAt(index),
                      key: WidgetKeys.suggestedManufacturerText,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: ZPColors.extraLightGrey4,
                          ),
                    ),
                    item.manufactureMapOptions.values.elementAt(index)
                        ? const Icon(
                            Icons.check_outlined,
                            size: 16,
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        );
      case MaterialFilterType.countryList:
        final conditionOfLabel = index == 0 ||
            item.countryMapOptions.keys.elementAt(index).name[0] !=
                item.countryMapOptions.keys.elementAt(index - 1).name[0];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            conditionOfLabel
                ? Column(
                    children: [
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        item.countryMapOptions.keys.elementAt(index).name[0],
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: ZPColors.neutralsBlack,
                                ),
                      ),
                    ],
                  )
                : const SizedBox(),
            InkWell(
              key: WidgetKeys.suggestedCountry,
              onTap: () {
                context.read<MaterialFilterBloc>().add(
                      MaterialFilterEvent.updateSelectedMaterialFilter(
                        materialFilterType,
                        item.countryMapOptions.keys.elementAt(index),
                      ),
                    );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.countryMapOptions.keys.elementAt(index).name,
                      key: WidgetKeys.suggestedCountryText,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: ZPColors.extraLightGrey4,
                          ),
                    ),
                    item.countryMapOptions.values.elementAt(index)
                        ? const Icon(
                            Icons.check_outlined,
                            size: 16,
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        );
      default:
        return const SizedBox();
    }
  }
}
