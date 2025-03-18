part of 'package:ezrxmobile/presentation/products/filter_by_page/filter_by_page.dart';

class _SelectedItem extends StatelessWidget {
  final MaterialFilterType materialFilterType;
  const _SelectedItem({required this.materialFilterType});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialFilterBloc, MaterialFilterState>(
      buildWhen: (previous, current) =>
          previous.materialFilter != current.materialFilter,
      builder: (context, state) {
        switch (materialFilterType) {
          case MaterialFilterType.manufactured:
            return Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: state.materialFilter.manufactureMapOptions.entries
                  .where((element) => element.value)
                  .map(
                    (e) => ChoiceChip(
                      key: WidgetKeys.manufacturerFilterSelected(e.key),
                      label: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              e.key,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: ZPColors.shadesBlack,
                                  ),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            const Icon(
                              Icons.cancel,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      selected: false,
                      onSelected: (value) {
                        context.read<MaterialFilterBloc>().add(
                              MaterialFilterEvent.updateSelectedMaterialFilter(
                                materialFilterType,
                                e.key,
                              ),
                            );
                      },
                    ),
                  )
                  .toList(),
            );
          case MaterialFilterType.countryList:
            return Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: state.materialFilter.countryMapOptions.entries
                  .where((element) => element.value)
                  .map(
                    (e) => ChoiceChip(
                      label: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              e.key.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: ZPColors.shadesBlack,
                                  ),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            const Icon(
                              Icons.cancel,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      selected: false,
                      onSelected: (value) {
                        context.read<MaterialFilterBloc>().add(
                              MaterialFilterEvent.updateSelectedMaterialFilter(
                                materialFilterType,
                                e.key,
                              ),
                            );
                      },
                    ),
                  )
                  .toList(),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
