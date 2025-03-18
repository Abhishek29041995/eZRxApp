import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsButton extends StatelessWidget {
  const ContactUsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(30, 45),
      ),
      onPressed: () {
        context.navigateTo(
          ContactUsPageRoute(
            appMarket: context.read<EligibilityBloc>().state.salesOrg.appMarket,
          ),
        );
      },
      child: Text(
        context.tr('Contact us'),
        style: const TextStyle(color: ZPColors.primary),
      ),
    );
  }
}
