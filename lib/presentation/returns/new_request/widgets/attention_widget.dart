part of 'package:ezrxmobile/presentation/returns/new_request/new_request_page.dart';

class _AttentionWidget extends StatelessWidget {
  const _AttentionWidget({
    super.key,
    this.widgetKey,
    required this.message,
    required this.visible,
  });
  final Key? widgetKey;
  final String message;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return visible
        ? Container(
            key: widgetKey,
            width: double.infinity,
            margin: const EdgeInsets.only(
              bottom: 8,
            ),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: ZPColors.lightRed,
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: Text(
              message,
            ),
          )
        : const SizedBox.shrink();
  }
}
