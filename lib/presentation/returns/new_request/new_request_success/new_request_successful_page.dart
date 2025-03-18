import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_seller_with_logo.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/new_request/tabs/return_review_tab/widgets/bonus_material_return_widget.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/bonus_material_return_info.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/return_list_item_card.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/upload_file_list.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/details/return_details_by_request_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'package:ezrxmobile/presentation/returns/new_request/new_request_success/widgets/return_request_success_message.dart';
part 'package:ezrxmobile/presentation/returns/new_request/new_request_success/widgets/addition_info_summary.dart';
part 'package:ezrxmobile/presentation/returns/new_request/new_request_success/widgets/return_summary.dart';
part 'package:ezrxmobile/presentation/returns/new_request/new_request_success/widgets/return_item_list.dart';
part 'package:ezrxmobile/presentation/returns/new_request/new_request_success/widgets/return_item.dart';
part 'package:ezrxmobile/presentation/returns/new_request/new_request_success/widgets/return_expandable_section.dart';
part 'package:ezrxmobile/presentation/returns/new_request/new_request_success/widgets/expandable_material_details.dart';
part 'package:ezrxmobile/presentation/returns/new_request/new_request_success/widgets/expandable_return_details.dart';
part 'package:ezrxmobile/presentation/returns/new_request/new_request_success/widgets/expandable_bonus_items.dart';

@RoutePage()
class NewRequestSuccessfulPage extends StatelessWidget {
  const NewRequestSuccessfulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.commonAppBar(
        title: Text(
          context.tr('Return request submitted'),
        ),
        customerBlockedOrSuspended:
            context.read<EligibilityBloc>().state.customerBlockOrSuspended,
        leadingWidget: IconButton(
          onPressed: () => context.router.maybePop(),
          icon: const Icon(Icons.close),
        ),
      ),
      body: const _BodyContent(),
    );
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _ReturnRequestSuccessMessage(),
            const _AdditionInfoSummary(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 16.0,
              ),
              child: AddressInfoSection.returnRequest(),
            ),
            const Divider(
              indent: 0,
              thickness: 1,
              endIndent: 0,
              height: 1,
              color: ZPColors.extraLightGrey2,
            ),
            const SizedBox(height: 16),
            const _ReturnSummary(),
            const SizedBox(height: 16),
            const Divider(
              indent: 0,
              thickness: 1,
              endIndent: 0,
              height: 1,
              color: ZPColors.extraLightGrey2,
            ),
            const SizedBox(height: 16),
            const _ReturnItemList(),
          ],
        ),
      ),
    );
  }
}
