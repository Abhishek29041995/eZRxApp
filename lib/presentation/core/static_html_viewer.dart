import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';

@RoutePage()
class StaticHtmlViewer extends StatefulWidget {
  final String title;
  final String htmlPath;
  final String styleCss;

  const StaticHtmlViewer({
    super.key,
    this.title = '',
    required this.htmlPath,
    this.styleCss = '',
  });

  @override
  State<StaticHtmlViewer> createState() => StaticHtmlViewerState();
}

class StaticHtmlViewerState extends State<StaticHtmlViewer> {
  bool isLoading = true;
  InAppWebViewController? _controller;

  @override
  void dispose() {
    _controller?.stopLoading();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.title.isNotEmpty
          ? CustomAppBar.commonAppBar(
              title: Text(context.tr(widget.title)),
              centreTitle: widget.title.isEmpty,
              customerBlockedOrSuspended: context
                  .read<EligibilityBloc>()
                  .state
                  .customerBlockOrSuspended,
            )
          : null,
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: Stack(
          children: [
            if (widget.htmlPath.isNotEmpty)
              InAppWebView(
                key: WidgetKeys.staticHtmlViewer,
                initialFile: widget.htmlPath,
                initialSettings: InAppWebViewSettings(
                  useHybridComposition: true,
                  useWideViewPort: false,
                  enableViewportScale: true,
                  preferredContentMode: UserPreferredContentMode.RECOMMENDED,
                  minimumFontSize: Theme.of(context).textTheme.bodyMedium?.fontSize?.toInt(),
                  allowUniversalAccessFromFileURLs: true,
                ),
                onLoadStop: (controller, url) async {
                  _controller = controller;
                  if (widget.styleCss.isNotEmpty) {
                    await _controller?.evaluateJavascript(
                      source: widget.styleCss,
                    );
                  }
                  if (mounted) {
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
              ),
            isLoading
                ? Align(
                    alignment: Alignment.center,
                    child: LoadingShimmer.logo(
                      key: WidgetKeys.loaderImage,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
