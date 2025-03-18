import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_filter/announcement_filter_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnnouncementFilterBottomSheet extends StatelessWidget {
  const AnnouncementFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      sheetKey: WidgetKeys.announcementFilterKey,
      headerText: 'Filter',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              context.tr('Category'),
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          const _AnnouncementCategorySelector(),
          const SizedBox(
            height: 20,
          ),
          const Row(
            children: [
              _AnnouncementFilterResetButton(),
              SizedBox(
                width: 12,
              ),
              _AnnouncementFilterApplyButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class _AnnouncementCategorySelector extends StatelessWidget {
  const _AnnouncementCategorySelector();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnnouncementFilterBloc, AnnouncementFilterState>(
      buildWhen: (previous, current) =>
          previous.filterCategoryKeyList != current.filterCategoryKeyList,
      builder: (
        context,
        state,
      ) {
        return Column(
          children: state.categoryKeyList.map((String category) {
            final value = state.filterCategoryKeyList.contains(category);

            return CheckboxListTile(
              key: WidgetKeys.announcementStatusFilter(category, value),
              contentPadding: EdgeInsets.zero,
              title: Text(
                category,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              visualDensity: VisualDensity.compact,
              onChanged: (bool? value) {
                context.read<AnnouncementFilterBloc>().add(
                      AnnouncementFilterEvent.categoryChanged(
                        category,
                        value ?? false,
                      ),
                    );
              },
              value: value,
            );
          }).toList(),
        );
      },
    );
  }
}

class _AnnouncementFilterResetButton extends StatelessWidget {
  const _AnnouncementFilterResetButton();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        key: WidgetKeys.filterResetButton,
        onPressed: () {
          context.read<AnnouncementFilterBloc>().add(
                const AnnouncementFilterEvent.resetCategory(),
              );
          context.read<AnnouncementInfoBloc>().add(
                const AnnouncementInfoEvent.setCategoryKey(
                  categoryKeyList: [],
                ),
              );
          context.router.popForced();
        },
        child: Text(
          context.tr('Reset'),
          style: const TextStyle(color: ZPColors.primary),
        ),
      ),
    );
  }
}

class _AnnouncementFilterApplyButton extends StatelessWidget {
  const _AnnouncementFilterApplyButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnnouncementFilterBloc, AnnouncementFilterState>(
      builder: (context, state) {
        return Expanded(
          child: ElevatedButton(
            key: WidgetKeys.filterApplyButton,
            onPressed: state.filterCategoryKeyList.isEmpty
                ? null
                : () {
                    context.read<AnnouncementInfoBloc>().add(
                          AnnouncementInfoEvent.setCategoryKey(
                            categoryKeyList: state.filterCategoryKeyList,
                          ),
                        );
                    context.router.popForced();
                  },
            child: Text(
              context.tr('Apply'),
              style: const TextStyle(color: ZPColors.white),
            ),
          ),
        );
      },
    );
  }
}
