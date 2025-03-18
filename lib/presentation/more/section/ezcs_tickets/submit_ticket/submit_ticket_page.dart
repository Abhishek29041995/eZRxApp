import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/submit_ticket/bloc/submit_ticket_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/confirm_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/radio_with_label.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/uploaded_documents_section.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:ezrxmobile/presentation/widgets/open_setting_bottomsheet.dart';
import 'package:ezrxmobile/presentation/widgets/select_attachment_bottomsheet.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;
import 'package:flutter_svg/flutter_svg.dart';

part 'package:ezrxmobile/presentation/more/section/ezcs_tickets/submit_ticket/widgets/your_detail_section.dart';
part 'package:ezrxmobile/presentation/more/section/ezcs_tickets/submit_ticket/widgets/customer_ticket_type_section.dart';
part 'package:ezrxmobile/presentation/more/section/ezcs_tickets/submit_ticket/widgets/ticket_priority_section.dart';
part 'package:ezrxmobile/presentation/more/section/ezcs_tickets/submit_ticket/widgets/ticket_content_section.dart';
part 'package:ezrxmobile/presentation/more/section/ezcs_tickets/submit_ticket/widgets/bottom_button_widget.dart';
part 'package:ezrxmobile/presentation/more/section/ezcs_tickets/submit_ticket/widgets/sub_category_widget.dart';
part 'package:ezrxmobile/presentation/more/section/ezcs_tickets/submit_ticket/widgets/order_related_information_widget.dart';

@RoutePage()
class SubmitTicketPage extends StatelessWidget {
  final String chatUrl;
  const SubmitTicketPage({super.key, required this.chatUrl});

  Future<void> _showCancelBottomsheet(
    BuildContext context,
  ) async {
    final result = await showModalBottomSheet<bool>(
      context: context,
      enableDrag: false,
      builder: (_) => ConfirmBottomSheet(
        key: WidgetKeys.confirmBottomSheet,
        title: 'Cancel Ticket?',
        content:
            'Your filled details will be lost and you will exit this page. This action cannot be undone.',
        cancelButtonText: 'Back to ticket',
        confirmButtonText: 'Yes, cancel',
        iconWidget: SvgPicture.asset(
          SvgImage.alert,
        ),
      ),
    );
    if (result == true && context.mounted) {
      unawaited(context.router.maybePop());
    }
  }

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<PoAttachmentBloc>()
            ..add(const PoAttachmentEvent.initialized()),
        ),
        BlocProvider(
          create: (context) => locator<SubmitTicketBloc>()
            ..add(
              SubmitTicketEvent.initialize(
                customerCodeInfo: eligibilityState.customerCodeInfo,
                shipToInfo: eligibilityState.shipToInfo,
                user: eligibilityState.user,
                chatUrl: chatUrl,
              ),
            ),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar.commonAppBar(
          title: Text(
            context.tr('Submit a Ticket'),
          ),
          leadingWidget: IconButton(
            onPressed: () => _showCancelBottomsheet(context),
            icon: const Icon(
              Icons.chevron_left,
              color: ZPColors.black,
              size: 30,
            ),
          ),
          customerBlockedOrSuspended:
              context.read<EligibilityBloc>().state.customerBlockOrSuspended,
        ),
        extendBody: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: padding12,
            horizontal: padding24,
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: const [
                    YourDetailSection(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: padding12),
                      child: CustomerTicketTypeSection(),
                    ),
                    TicketPrioritySection(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: padding12),
                      child: TicketContentSection(),
                    ),
                  ],
                ),
              ),
              BottomButtonWidget(
                onPressedCancel: () => _showCancelBottomsheet(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
