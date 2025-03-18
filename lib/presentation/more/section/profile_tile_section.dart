import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => previous.user != current.user,
      builder: (context, state) {
        return ListTile(
          contentPadding: const EdgeInsets.all(padding12),
          key: WidgetKeys.profileTileSection,
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: ZPColors.orange,
            child: Text(
              state.user.fullName.shortForm(),
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: ZPColors.white),
            ),
          ),
          title: state.isNotEmpty
              ? Text(
                  '${context.tr('Hello')}, ${state.user.fullName.toTitleCase}',
                  style: Theme.of(context).textTheme.labelMedium,
                )
              : LoadingShimmer.tile(line: 3),
          subtitle: BlocBuilder<EligibilityBloc, EligibilityState>(
            buildWhen: (previous, current) =>
                previous.customerCodeInfo != current.customerCodeInfo,
            builder: (context, state) {
              final customerCodeInfo = state.customerCodeInfo;
              if (customerCodeInfo == CustomerCodeInfo.empty()) {
                return const SizedBox.shrink();
              }

              return RichText(
                key: WidgetKeys.profileTileSectionCustomerInformation,
                text: TextSpan(
                  text: customerCodeInfo.customerCodeSoldTo,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ZPColors.darkTeal,
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' | ${customerCodeInfo.customerName}',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: ZPColors.darkTeal,
                          ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
