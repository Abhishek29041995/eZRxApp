import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/payments/claim_management/claim_management_bloc.dart';
import 'package:ezrxmobile/application/payments/new_claim_submission/new_claim_submission_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/payments/entities/claim_management_filter.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/bullet_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/custom_numeric_text_field.dart';
import 'package:ezrxmobile/presentation/core/dropdown_with_label.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/uploaded_documents_section.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/widgets/open_setting_bottomsheet.dart';
import 'package:ezrxmobile/presentation/widgets/select_attachment_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchfield/searchfield.dart';

part 'package:ezrxmobile/presentation/payments/new_claim_submission/widgets/new_claim_information_section.dart';
part 'package:ezrxmobile/presentation/payments/new_claim_submission/widgets/upload_documents_section.dart';
part 'package:ezrxmobile/presentation/payments/new_claim_submission/widgets/input_field_with_label.dart';

@RoutePage()
class NewClaimSubmissionPage extends StatefulWidget {
  const NewClaimSubmissionPage({super.key});

  @override
  State<NewClaimSubmissionPage> createState() => _NewClaimSubmissionPageState();
}

class _NewClaimSubmissionPageState extends State<NewClaimSubmissionPage> {
  @override
  void initState() {
    final eligibilityState = context.read<EligibilityBloc>().state;

    context.read<NewClaimSubmissionBloc>().add(
          NewClaimSubmissionEvent.initialized(
            salesOrganisation: eligibilityState.salesOrganisation,
            customerCodeInfo: eligibilityState.customerCodeInfo,
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<PoAttachmentBloc>()
        ..add(const PoAttachmentEvent.initialized()),
      child: Scaffold(
        appBar: CustomAppBar.commonAppBar(
          title: Text(
            context.tr('New claim submission'),
            key: WidgetKeys.newClaimSubmissionPage,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          titleSpacing: 0,
          leadingWidget: IconButton(
            key: WidgetKeys.closeButton,
            icon: const Icon(
              Icons.close,
            ),
            onPressed: () => context.router.maybePop(),
          ),
          customerBlockedOrSuspended:
              context.read<EligibilityBloc>().state.customerBlockOrSuspended,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Expanded(
                child: SingleChildScrollView(
                  key: WidgetKeys.scrollList,
                  child: _NewClaimInformationSection(),
                ),
              ),
              BlocConsumer<NewClaimSubmissionBloc, NewClaimSubmissionState>(
                listenWhen: (previous, current) =>
                    previous.failureOrSuccessOption !=
                    current.failureOrSuccessOption,
                listener: (context, state) => state.failureOrSuccessOption.fold(
                  () {},
                  (either) => either.fold(
                    (failure) {
                      ErrorUtils.handleApiFailure(context, failure);
                    },
                    (success) {
                      context.read<ClaimManagementBloc>().add(
                            ClaimManagementEvent.fetch(
                              appliedFilter: ClaimManagementFilter.empty(),
                            ),
                          );
                      context.router.replace(const ClaimSubmittedPageRoute());
                    },
                  ),
                ),
                buildWhen: (previous, current) =>
                    previous.formValidated != current.formValidated ||
                    previous.isLoading != current.isLoading,
                builder: (context, state) {
                  final eligibilityState =
                      context.read<EligibilityBloc>().state;

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      key: WidgetKeys.claimSubmittedCreateNewClaimButton,
                      onPressed: (state.formValidated && !state.isLoading)
                          ? () => context.read<NewClaimSubmissionBloc>().add(
                                NewClaimSubmissionEvent.submit(
                                  user: eligibilityState.user,
                                  customerCodeInfo:
                                      eligibilityState.customerCodeInfo,
                                ),
                              )
                          : null,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: LoadingShimmer.withChild(
                        enabled: state.isLoading,
                        child: Text(
                          context.tr('Submit claim'),
                          style: const TextStyle(color: ZPColors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
