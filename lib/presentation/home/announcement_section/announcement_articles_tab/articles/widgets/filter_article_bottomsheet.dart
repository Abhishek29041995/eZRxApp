import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_bloc.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_filter/articles_info_filter_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleFilterBottomSheet extends StatelessWidget {
  const ArticleFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      sheetKey: WidgetKeys.articleFilterKey,
      headerText: 'Filter',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
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
          const _CategorySelector(),
          const SizedBox(
            height: 20,
          ),
          const Row(
            children: [
              _ArticleFilterResetButton(),
              SizedBox(
                width: 12,
              ),
              _ArticleFilterApplyButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class _CategorySelector extends StatelessWidget {
  const _CategorySelector();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesInfoFilterBloc, ArticlesInfoFilterState>(
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
              contentPadding: EdgeInsets.zero,
              title: Text(
                category,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              visualDensity: VisualDensity.compact,
              onChanged: (bool? value) {
                context.read<ArticlesInfoFilterBloc>().add(
                      ArticlesInfoFilterEvent.categoryChanged(
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

class _ArticleFilterResetButton extends StatelessWidget {
  const _ArticleFilterResetButton();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        key: WidgetKeys.filterResetButton,
        onPressed: () {
          context.read<ArticlesInfoFilterBloc>().add(
                const ArticlesInfoFilterEvent.resetCategory(),
              );
          context.read<ArticlesInfoBloc>().add(
                const ArticlesInfoEvent.setCategoryKey(
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

class _ArticleFilterApplyButton extends StatelessWidget {
  const _ArticleFilterApplyButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesInfoFilterBloc, ArticlesInfoFilterState>(
      buildWhen: (previous, current) =>
          previous.filterCategoryKeyList != current.filterCategoryKeyList,
      builder: (context, state) {
        return Expanded(
          child: ElevatedButton(
            key: WidgetKeys.filterApplyButton,
            onPressed: state.filterCategoryKeyList.isNotEmpty
                ? () {
                    context.read<ArticlesInfoBloc>().add(
                          ArticlesInfoEvent.setCategoryKey(
                            categoryKeyList: state.filterCategoryKeyList,
                          ),
                        );
                    context.router.popForced();
                  }
                : null,
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
