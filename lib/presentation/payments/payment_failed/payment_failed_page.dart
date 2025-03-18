import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/extension.dart';
import 'package:ezrxmobile/presentation/payments/widgets/payment_module.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'package:ezrxmobile/presentation/payments/payment_failed/widgets/payment_failed_page_footer.dart';
part 'package:ezrxmobile/presentation/payments/payment_failed/widgets/payment_failed_page_body.dart';

@RoutePage()
class PaymentFailedPage extends StatelessWidget {
  final bool isMarketPlace;

  const PaymentFailedPage({super.key, required this.isMarketPlace});

  @override
  Widget build(BuildContext context) {
    return PaymentModule(
      isMarketPlace: isMarketPlace,
      child: Scaffold(
        appBar: CustomAppBar.commonAppBar(
          automaticallyImplyLeading: false,
          customerBlockedOrSuspended:
              context.read<EligibilityBloc>().state.customerBlockOrSuspended,
          title: Text(context.tr('Payment request failed')),
          leadingWidget: IconButton(
            key: WidgetKeys.closeButton,
            onPressed: () => context.router.maybePop(),
            icon: const Icon(Icons.close, color: ZPColors.neutralsBlack),
          ),
        ),
        body: const _PaymentFailedPageBody(),
        bottomNavigationBar: const _PaymentFailedPageFooter(),
      ),
    );
  }
}
