part of 'package:ezrxmobile/presentation/products/combo_detail/combo_detail_page.dart';

class _ComboProductTile extends StatelessWidget {
  final PriceAggregate comboItem;
  final bool isMandatory;
  final bool isFixed;
  const _ComboProductTile({
    required this.comboItem,
    this.isMandatory = true,
    this.isFixed = false,
  });

  ComboDealMaterial get _comboDealMaterial => comboItem.comboDeal
      .singleDeal(materialNumber: comboItem.getMaterialNumber);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ComboDealMaterialDetailBloc>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(bottom: 24),
      child: BlocBuilder<ComboDealMaterialDetailBloc,
          ComboDealMaterialDetailState>(
        buildWhen: (previous, current) =>
            previous.selectedItems != current.selectedItems,
        builder: (_, state) {
          return EdgeCheckbox(
            key: WidgetKeys.comboItemProductTile(
              comboItem.getMaterialNumber.displayMatNo,
            ),
            onChanged: isFixed
                ? (_) {}
                : (value) => bloc.add(
                      ComboDealMaterialDetailEvent.updateItemSelection(
                        item: comboItem.getMaterialNumber,
                      ),
                    ),
            value: state.selectedItems[comboItem.getMaterialNumber] ?? false,
            body: CustomCard(
              showShadow: true,
              margin: EdgeInsets.zero,
              child: Column(
                children: [
                  _MaterialDetailsSection(
                    comboItem: comboItem,
                    comboDealMaterial: _comboDealMaterial,
                    isFixed: isFixed,
                  ),
                  const Divider(
                    indent: 0,
                    endIndent: 0,
                    color: ZPColors.accentColor,
                  ),
                  _ItemSubTotalSection(
                    comboItem: comboItem,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
