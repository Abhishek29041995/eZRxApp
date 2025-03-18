import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_license.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
import 'package:auto_route/auto_route.dart';

part 'package:ezrxmobile/presentation/account/profile/widgets/footer.dart';
part 'package:ezrxmobile/presentation/account/profile/widgets/header.dart';
part 'package:ezrxmobile/presentation/account/profile/widgets/language_dropdown.dart';
part 'package:ezrxmobile/presentation/account/profile/widgets/user_details.dart';
part 'package:ezrxmobile/presentation/account/profile/widgets/license_tile.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.profilePage,
      appBar: CustomAppBar.commonAppBar(
        title: Text(context.tr('Profile')),
        customerBlockedOrSuspended:
            context.read<EligibilityBloc>().state.customerBlockOrSuspended,
      ),
      body: BlocConsumer<CustomerLicenseBloc, CustomerLicenseState>(
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching,
        listenWhen: (previous, current) =>
            previous.failureOrSuccessOption != current.failureOrSuccessOption,
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) {},
            ),
          );
        },
        builder: (context, state) {
          return ScrollList<CustomerLicense>(
            header: const _Header(),
            noRecordFoundWidget: NoRecordFound(
              title: context.tr("Looks like you don't have any license here"),
              subTitle: '',
              svgImage: SvgImage.emptyBox,
            ),
            controller: ScrollController(),
            onRefresh: () => context.read<CustomerLicenseBloc>().add(
                  const CustomerLicenseEvent.fetch(),
                ),
            onLoadingMore: () => context.read<CustomerLicenseBloc>().add(
                  const CustomerLicenseEvent.loadMore(),
                ),
            isLoading: state.isFetching,
            itemBuilder: (context, index, item) => _LicenseTile(
              customerLicense: item,
            ),
            items: state.customerLicenses,
          );
        },
      ),
      bottomNavigationBar: const _Footer(),
    );
  }
}
