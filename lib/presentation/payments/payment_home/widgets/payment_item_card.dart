part of '../payment_page.dart';

class _KeyValuePair {
  final String key;
  final String value;
  final Key widgetKey;

  _KeyValuePair({
    required this.key,
    required this.value,
    required this.widgetKey,
  });
}

class _ItemCard extends StatefulWidget {
  const _ItemCard({
    required this.keyVal,
    required this.isFetching,
    super.key,
  });

  final List<_KeyValuePair> keyVal;
  final bool isFetching;

  @override
  State<_ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<_ItemCard> {
  bool obscured = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: ZPColors.lightSilver,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.keyVal
                .asMap()
                .entries
                .map(
                  (e) => Column(
                    key: e.value.widgetKey,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.tr(e.value.key),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 2),
                      widget.isFetching
                          ? SizedBox(
                              width: 100,
                              child: LoadingShimmer.tile(),
                            )
                          : PriceComponent(
                              salesOrgConfig: context
                                  .read<EligibilityBloc>()
                                  .state
                                  .salesOrgConfigs,
                              price: e.value.value,
                              obscured: obscured,
                            ),
                      const SizedBox(height: 5),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
        IconButton(
          key: WidgetKeys.paymentHomeObscuredAmount,
          padding: const EdgeInsets.all(0),
          color: ZPColors.shadesGray,
          icon: Icon(
            obscured
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
          onPressed: () => setState(() => obscured = !obscured),
        ),
      ],
    );
  }
}
