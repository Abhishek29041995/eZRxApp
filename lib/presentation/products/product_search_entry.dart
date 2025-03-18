import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/widgets/scan_camera_button.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';

class ProductSearchEntry extends StatefulWidget {
  final String initValue;
  final VoidCallback? onClear;
  const ProductSearchEntry({this.initValue = '', this.onClear, super.key});

  @override
  State<ProductSearchEntry> createState() => _ProductSearchEntryState();
}

class _ProductSearchEntryState extends State<ProductSearchEntry> {
  final controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.initValue;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ProductSearchEntry oldWidget) {
    if (oldWidget.initValue != widget.initValue) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.text = widget.initValue;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: ZPColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: ZPColors.inputBorderColor),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              key: WidgetKeys.searchProductField,
              autocorrect: false,
              controller: controller,
              readOnly: true,
              canRequestFocus: false,
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                context.router.push(
                  ProductSuggestionPageRoute(
                    parentRoute: context.routeData.path,
                  ),
                );
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(padding6),
                hintText: context.tr('Search by product name or code'),
                enabledBorder: InputBorder.none,
                fillColor: ZPColors.transparent,
                prefixIcon: const Icon(
                  Icons.search,
                  size: 20,
                ),
                suffixIcon: ValueListenableBuilder<TextEditingValue>(
                  valueListenable: controller,
                  builder: (context, value, _) {
                    return value.text.isNotEmpty
                        ? IconButton(
                            key: WidgetKeys.clearIconKey,
                            icon: const Icon(
                              Icons.cancel_rounded,
                              size: 24,
                              color: ZPColors.backgroundCloseButtonSnackBar,
                            ),
                            onPressed: widget.onClear != null
                                ? () {
                                    widget.onClear!();
                                  }
                                : null,
                          )
                        : const SizedBox.shrink();
                  },
                ),
              ),
            ),
          ),
          const ScanCameraButton(),
        ],
      ),
    );
  }
}
