import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/details/return_details_by_request_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_request_details/widgets/request_details_section.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_request_details/widgets/request_item_section.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ReturnRequestDetails extends StatelessWidget {
  const ReturnRequestDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.commonAppBar(
        title: Text(
          context.tr('Return request details'),
        ),
        customerBlockedOrSuspended:
            context.read<EligibilityBloc>().state.customerBlockOrSuspended,
      ),
      body:
          BlocConsumer<ReturnDetailsByRequestBloc, ReturnDetailsByRequestState>(
        listenWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
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
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading ||
            previous.downloadingAttachments != current.downloadingAttachments,
        builder: (context, state) {
          return AnnouncementBanner(
            currentPath: context.router.currentPath,
            child: state.isLoading
                ? Align(
                    alignment: Alignment.center,
                    child: LoadingShimmer.logo(
                      key: WidgetKeys.loaderImage,
                    ),
                  )
                : ListView(
                    key: WidgetKeys.scrollList,
                    children: [
                      RequestDetailsSection(
                        requestInformation: state.requestInformation,
                        requestInformationHeader:
                            state.requestInformationHeader,
                      ),
                      const Divider(
                        indent: 0,
                        height: padding24,
                        endIndent: 0,
                        color: ZPColors.lightGray2,
                      ),
                      RequestItemSection(
                        returnDetailsByRequestState: state,
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
