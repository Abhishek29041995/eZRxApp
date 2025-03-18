import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/attachments/return_request_attachment_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/info_label.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_seller_with_logo.dart';
import 'package:ezrxmobile/presentation/core/mixin/bottomsheet_mixin.dart';
import 'package:ezrxmobile/presentation/core/outside_return_policy_tag.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/regexes.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/switch_widget.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/new_request/tabs/return_details_tab/widgets/balance_quantity_field.dart';
import 'package:ezrxmobile/presentation/returns/new_request/tabs/return_details_tab/widgets/reason_dropdown.dart';
import 'package:ezrxmobile/presentation/returns/new_request/tabs/return_details_tab/widgets/return_counter_offer.dart';
import 'package:ezrxmobile/presentation/returns/new_request/tabs/return_details_tab/widgets/return_quantity_field.dart';
import 'package:ezrxmobile/presentation/returns/new_request/tabs/return_details_tab/widgets/return_type_section.dart';
import 'package:ezrxmobile/presentation/returns/new_request/tabs/return_details_tab/widgets/return_value_field.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/bonus_material_info.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/expandable_info.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/material_details_section.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/material_info_widget.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/material_quantity_and_price.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

part 'widgets/return_material_widget.dart';
part 'widgets/material_bonus_detail_section.dart';
part 'widgets/bonus_item_section.dart';
part 'widgets/material_bonus_info_section.dart';
part 'widgets/material_return_details_section.dart';
part 'widgets/comment_field.dart';
part 'widgets/upload_attachement_section.dart';

@RoutePage()
class ReturnDetailsTab extends StatelessWidget {
  const ReturnDetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewRequestBloc, NewRequestState>(
      buildWhen: (previous, current) =>
          previous.selectedItems != current.selectedItems,
      builder: (context, state) {
        return ListView(
          key: WidgetKeys.scrollList,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          children: [
            if (state.containsMPItems)
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 5),
                child: MarketPlaceSellerWithLogo(
                  state.selectedItems.first.principalName.name,
                ),
              ),
            ...state.selectedItems
                .map(
                  (item) => _ReturnMaterialWidget(
                    item: item,
                    detail: state.getReturnItemDetails(item.uuid),
                  ),
                )
                ,
          ],
        );
      },
    );
  }
}
