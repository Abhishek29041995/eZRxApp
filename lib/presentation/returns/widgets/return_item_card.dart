import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/bonus_tag.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/outside_return_policy_tag.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/return_list_item_card.dart';
import 'package:ezrxmobile/presentation/returns/widgets/return_detail_attachment_tile.dart';
import 'package:ezrxmobile/presentation/returns/widgets/return_override_info_icon.dart';
import 'package:ezrxmobile/presentation/returns/widgets/return_summary_item_price.dart';
import 'package:ezrxmobile/presentation/returns/widgets/ware_house_storage_condition_tag.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:ezrxmobile/presentation/returns/widgets/return_bonus_item_card.dart';
part 'package:ezrxmobile/presentation/returns/widgets/expandable_details_section.dart';
part 'package:ezrxmobile/presentation/returns/widgets/return_item_expand_section.dart';

class ReturnItemCard extends StatelessWidget {
  const ReturnItemCard({
    super.key,
    required this.returnRequestInformation,
    required this.downloadingAttachments,
    required this.downloadAttachment,
  });
  final ReturnRequestInformation returnRequestInformation;
  final List<PoDocuments> downloadingAttachments;
  final Function(PoDocuments) downloadAttachment;

  @override
  Widget build(BuildContext context) {
    final salesOrgConfigs =
        context.read<EligibilityBloc>().state.salesOrgConfigs;
    if (returnRequestInformation.isEmpty) return const SizedBox.shrink();
    if (returnRequestInformation.prsfd.isBonus) {
      return CustomCard(
        key: WidgetKeys.returnItemDetailOnlyBonusMaterial(
          returnRequestInformation.materialNumber.displayMatNo,
          returnRequestInformation.returnQuantity.toString(),
          StringUtils.displayPrice(
            salesOrgConfigs,
            returnRequestInformation.totalPrice,
          ),
        ),
        child: ListTile(
          title: _ReturnBonusItemSection(
            isExpandable: true,
            bonusItem: returnRequestInformation,
            downloadingAttachments: downloadingAttachments,
            downloadAttachment: downloadAttachment,
          ),
        ),
      );
    }

    return ReturnListItemCard.detailItem(
      key: WidgetKeys.returnItemDetailMaterial(
        returnRequestInformation.materialNumber.displayMatNo,
        returnRequestInformation.returnQuantity.toString(),
        StringUtils.displayPrice(
          salesOrgConfigs,
          returnRequestInformation.totalPrice,
        ),
      ),
      data: returnRequestInformation,
      bottomWidget: _ExpandableDetailSection(
        isExpanded: false,
        isExpandable: true,
        expandWidget: _ReturnItemExpandSection(
          key: WidgetKeys.returnItemDetailBonusItem,
          returnRequestInformation: returnRequestInformation,
          downloadingAttachments: downloadingAttachments,
          downloadAttachment: downloadAttachment,
        ),
      ),
    );
  }
}
