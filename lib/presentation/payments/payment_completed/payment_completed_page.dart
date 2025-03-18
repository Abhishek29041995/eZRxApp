import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/presentation/core/bullet_widget.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/extension.dart';
import 'package:ezrxmobile/presentation/payments/widgets/payment_module.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

part 'package:ezrxmobile/presentation/payments/payment_completed/widgets/payment_completed_footer_buttons.dart';
part 'package:ezrxmobile/presentation/payments/payment_completed/widgets/payment_completed_message.dart';
part 'package:ezrxmobile/presentation/payments/payment_completed/widgets/payment_completed_please_note.dart';

@RoutePage()
class PaymentCompletedPage extends StatelessWidget {
  final bool isMarketPlace;

  const PaymentCompletedPage({
    super.key,
    required this.isMarketPlace,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentModule(
      isMarketPlace: isMarketPlace,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          backgroundColor: ZPColors.white,
          title: Text(context.tr('Payment request submitted')),
          leading: IconButton(
            key: WidgetKeys.paymentAdviceCreatedPageBack,
            onPressed: () => Navigator.pop(context),
            icon: const CircleAvatar(
              maxRadius: 16,
              backgroundColor: ZPColors.transparent,
              child: Icon(
                Icons.close,
                color: ZPColors.neutralsBlack,
              ),
            ),
          ),
        ),
        body: const _BodyContent(),
      ),
    );
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: const [
              _PaymentCompletedMessage(),
              SizedBox(height: 8),
              _PaymentCompletedPleaseNote(),
            ],
          ),
        ),
        SafeArea(
          top: false,
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: ZPColors.lightGray2)),
            ),
            child: context.isMPPayment
                ? const Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _AccountSummaryButton(),
                      SizedBox(height: 16.0),
                      _PaymentSummaryButton(),
                    ],
                  )
                : const Row(
                    children: [
                      Expanded(child: _AccountSummaryButton()),
                      SizedBox(width: 16.0),
                      Expanded(child: _PaymentSummaryButton()),
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
