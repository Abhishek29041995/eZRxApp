import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'package:ezrxmobile/presentation/products/filter_by_page/widgets/header.dart';
part 'package:ezrxmobile/presentation/products/filter_by_page/widgets/selected_item.dart';
part 'package:ezrxmobile/presentation/products/filter_by_page/widgets/item_builder.dart';
part 'package:ezrxmobile/presentation/products/filter_by_page/widgets/search_bar.dart';

class FilterByPage extends StatelessWidget {
  final MaterialFilterType materialFilterType;
  const FilterByPage({
    super.key,
    required this.materialFilterType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Header(materialFilterType: materialFilterType),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: _SearchBar(),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: _SelectedItem(materialFilterType: materialFilterType),
          ),
          Expanded(
            child: BlocBuilder<MaterialFilterBloc, MaterialFilterState>(
              buildWhen: (previous, current) =>
                  previous.displayMaterialFilter !=
                  current.displayMaterialFilter,
              builder: (_, state) {
                return materialFilterType == MaterialFilterType.manufactured
                    ? Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          top: 10.0,
                        ),
                        child: ScrollList<String>(
                          isLoading: state.isFetching,
                          dismissOnDrag: true,
                          itemBuilder: (_, index, item) {
                            return _ItemBuilder(
                              item: state.displayMaterialFilter,
                              index: index,
                              materialFilterType: materialFilterType,
                            );
                          },
                          items: state.displayMaterialFilter
                              .manufactureMapOptions.entries
                              .map((e) => e.key)
                              .toList(),
                          noRecordFoundWidget: const NoRecordFound(),
                          controller: ScrollController(),
                        ),
                      )
                    : materialFilterType == MaterialFilterType.countryList
                        ? Padding(
                            padding: const EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                              top: 10.0,
                            ),
                            child: ScrollList<MaterialFilterCountry>(
                              isLoading: state.isFetching,
                              dismissOnDrag: true,
                              itemBuilder: (_, index, item) {
                                return _ItemBuilder(
                                  item: state.displayMaterialFilter,
                                  index: index,
                                  materialFilterType: materialFilterType,
                                );
                              },
                              items: state.displayMaterialFilter
                                  .countryMapOptions.entries
                                  .map((e) => e.key)
                                  .toList(),
                              noRecordFoundWidget: const NoRecordFound(),
                              controller: ScrollController(),
                            ),
                          )
                        : const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
