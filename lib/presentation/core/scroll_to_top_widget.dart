import 'package:ezrxmobile/presentation/core/extension/scroll_controller_extension.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class ScrollToTopWidget extends StatelessWidget {
  final bool isVisible;
  final ScrollController scrollController;
  const ScrollToTopWidget({
    required this.isVisible,
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return isVisible
        ? FloatingActionButton(
            key: WidgetKeys.scrollToTopFloatingButton,
            onPressed: () => scrollController.scrollToTop(),
            mini: true,
            backgroundColor: ZPColors.secondaryMustard,
            child: const Icon(
              Icons.expand_less,
              color: ZPColors.black,
            ),
          )
        : const SizedBox.shrink();
  }
}
