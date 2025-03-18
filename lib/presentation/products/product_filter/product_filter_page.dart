import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/filter_by_page/filter_by_page.dart';
import 'package:ezrxmobile/presentation/products/widgets/enum_material_filter.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:ezrxmobile/presentation/products/product_filter/widgets/product_filter_app_bar.dart';
part 'package:ezrxmobile/presentation/products/product_filter/widgets/product_filter_by_type_options.dart';
part 'package:ezrxmobile/presentation/products/product_filter/widgets/product_filter_by_category_options.dart';
part 'package:ezrxmobile/presentation/products/product_filter/widgets/product_sort_options.dart';
part 'package:ezrxmobile/presentation/products/product_filter/widgets/product_filter_apply_button.dart';
part 'package:ezrxmobile/presentation/products/product_filter/widgets/product_filter_reset_button.dart';
part 'package:ezrxmobile/presentation/products/product_filter/widgets/product_filter_list_tile_theme.dart';

class ProductFilterPage extends StatefulWidget {
  const ProductFilterPage({
    super.key,
  });

  @override
  State<ProductFilterPage> createState() => _ProductFilterPageState();
}

class _ProductFilterPageState extends State<ProductFilterPage> {
  @override
  void initState() {
    super.initState();
    context.read<MaterialFilterBloc>().add(
          MaterialFilterEvent.initSelectedMaterialFilter(
            context.read<MaterialListBloc>().state.selectedMaterialFilter,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _ProductFilterAppBar(),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
            children: const [
              _ProductFilterByTypeOptions(),
              SizedBox(height: 24.0),
              _ProductSortOptions(),
              SizedBox(height: 32.0),
              _ProductFilterByCategoryOptions(),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: ZPColors.extraLightGrey2),
            ),
          ),
          child: const Row(
            children: [
              Expanded(
                child: _ProductFilterResetButton(),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: _ProductFilterApplyButton(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
