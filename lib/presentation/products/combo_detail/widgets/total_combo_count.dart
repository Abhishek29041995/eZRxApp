part of 'package:ezrxmobile/presentation/products/combo_detail/combo_detail_page.dart';

class _TotalComboCount extends StatelessWidget {
  const _TotalComboCount();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Row(
        key: WidgetKeys.totalMaterialItemCount,
        children: [
          BlocBuilder<ComboDealMaterialDetailBloc,
              ComboDealMaterialDetailState>(
            buildWhen: (previous, current) =>
                previous.searchableList != current.searchableList,
            builder: (context, state) {
              return Text(
                '${state.materialCount != 0 ? state.materialCount : state.searchableList.length} ',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.darkGray,
                    ),
              );
            },
          ),
          Text(
            context.tr('products'),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.darkGray,
                ),
          ),
        ],
      ),
    );
  }
}
