import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/claim_management/claim_management_bloc.dart';
import 'package:ezrxmobile/application/payments/claim_management/filter/claim_management_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/claim_item.dart';
import 'package:ezrxmobile/domain/payments/entities/claim_management_filter.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/custom_badge.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/scale_button.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';

part 'package:ezrxmobile/presentation/payments/claim_management/widgets/claim_management_search_bar_widget.dart';
part 'package:ezrxmobile/presentation/payments/claim_management/widgets/filter_tune_icon.dart';
part 'package:ezrxmobile/presentation/payments/claim_management/widgets/filter_bottom_sheet_widget.dart';
part 'package:ezrxmobile/presentation/payments/claim_management/widgets/filter_by_claim_type_widget.dart';
part 'package:ezrxmobile/presentation/payments/claim_management/widgets/claim_item_widget.dart';
part 'package:ezrxmobile/presentation/payments/claim_management/widgets/new_claim_button.dart';

@RoutePage()
class ClaimManagementPage extends StatefulWidget {
  const ClaimManagementPage({super.key});

  @override
  State<ClaimManagementPage> createState() => _ClaimManagementPageState();
}

class _ClaimManagementPageState extends State<ClaimManagementPage> {
  final _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.claimManagementPage,
      appBar: CustomAppBar.commonAppBar(
        title: Text(
          context.tr('Claim Management'),
          style: Theme.of(context).textTheme.labelLarge,
        ),
        customerBlockedOrSuspended:
            context.read<EligibilityBloc>().state.customerBlockOrSuspended,
      ),
      floatingActionButton: _NewClaimButton(
        controller: _controller,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          20.0,
          24.0,
          20.0,
          0.0,
        ),
        child: Column(
          children: [
            const Row(
              children: [
                _ClaimManagementSearchBar(),
                _FilterTuneIcon(),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: BlocConsumer<ClaimManagementBloc, ClaimManagementState>(
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
                listenWhen: (previous, current) =>
                    previous.failureOrSuccessOption !=
                    current.failureOrSuccessOption,
                buildWhen: (previous, current) =>
                    previous.failureOrSuccessOption !=
                        current.failureOrSuccessOption ||
                    previous.filterItems != current.filterItems,
                builder: (context, state) {
                  return ScrollList<ClaimItem>(
                    noRecordFoundWidget: NoRecordFound.claimManagement(
                      context,
                      hasFilter: !state.isFilterEmpty,
                    ),
                    controller: _controller,
                    onRefresh: () => context.read<ClaimManagementBloc>().add(
                          ClaimManagementEvent.fetch(
                            appliedFilter: ClaimManagementFilter.empty(),
                          ),
                        ),
                    isLoading: state.isLoading,
                    itemBuilder: (context, index, item) =>
                        _ClaimItemWidget(item: item),
                    items: state.filterItems,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
