import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/common/clevertap_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/products/clear_product_search_suggestion_history.dart';
import 'package:ezrxmobile/presentation/products/widgets/scan_camera_button.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/application/order/product_search/product_search_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
part 'package:ezrxmobile/presentation/products/product_suggestion/widgets/history_tile.dart';
part 'package:ezrxmobile/presentation/products/product_suggestion/widgets/suggest_product_tile.dart';
part 'package:ezrxmobile/presentation/products/product_suggestion/widgets/product_search_history_suggestion_section.dart';
part 'package:ezrxmobile/presentation/products/product_suggestion/widgets/product_suggestion_section.dart';
part 'package:ezrxmobile/presentation/products/product_suggestion/widgets/product_search_section.dart';

@RoutePage()
class ProductSuggestionPage extends StatelessWidget {
  final String parentRoute;

  const ProductSuggestionPage({
    super.key,
    required this.parentRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.productSearchPage,
      appBar: AppBar(
        title: BlocBuilder<ProductSearchBloc, ProductSearchState>(
          buildWhen: (previous, current) =>
              previous.searchKey != current.searchKey,
          builder: (context, state) {
            return _ProductSearchSection(
              parentRoute: parentRoute,
              initSearchValue: state.searchKey,
            );
          },
        ),
        elevation: 0,
        titleSpacing: 0,
      ),
      body: _BodyContent(parentRoute: parentRoute),
    );
  }
}

class _BodyContent extends StatelessWidget {
  final String parentRoute;
  const _BodyContent({
    required this.parentRoute,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductSearchBloc, ProductSearchState>(
      buildWhen: (previous, current) =>
          previous.searchKey.validateNotEmpty !=
          current.searchKey.validateNotEmpty,
      builder: (context, state) => state.searchKey.validateNotEmpty
          ? _ProductSuggestionSection(parentRoute: parentRoute)
          : const _ProductSearchHistorySuggestionSection(),
    );
  }
}
