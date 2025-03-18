import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/png_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class WebViewPage extends StatefulWidget {
  final String url;
  final String? initialFile;
  final String titleText;
  const WebViewPage({
    super.key,
    this.url = '',
    this.initialFile,
    this.titleText = '',
  });

  @override
  State<WebViewPage> createState() => WebViewPageState();
}

class WebViewPageState extends State<WebViewPage> {
  bool isLoading = true;
  bool errorLoadingUrl = false;

  late InAppWebViewController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: widget.titleText.isEmpty,
        title: widget.titleText.isNotEmpty
            ? Text(widget.titleText.tr())
            : SvgPicture.asset(
                'assets/svg/ezrx+logo.svg',
                height: 30,
                fit: BoxFit.scaleDown,
              ),
      ),
      body: SafeArea(
        child: AnnouncementBanner(
          currentPath: context.router.currentPath,
          child: errorLoadingUrl
              ? Center(
                  key: const ValueKey('errorLoadingUrl'),
                  child: Padding(
                    padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.1,
                    ),
                    child: Image.asset(
                      PngImage.error,
                    ),
                  ),
                )
              : Stack(
                  key: WidgetKeys.webview,
                  children: <Widget>[
                    InAppWebView(
                      initialFile: widget.initialFile,
                      initialUrlRequest: URLRequest(url: WebUri(widget.url)),
                      initialSettings: InAppWebViewSettings(
                        mediaPlaybackRequiresUserGesture: false,
                      ),
                      onWebViewCreated:
                          (InAppWebViewController webViewController) {
                        controller = webViewController;
                      },
                      onLoadStart: ((controller, url) {
                        setState(() {
                          isLoading = true;
                          errorLoadingUrl = false;
                        });
                        isLoading = true;
                      }),
                      onLoadStop: (controller, url) {
                        setState(() {
                          isLoading = false;
                        });
                      },
                      onReceivedHttpError: (
                        InAppWebViewController controller,
                        WebResourceRequest request,
                        WebResourceResponse respone,
                      ) {
                        setState(() {
                          errorLoadingUrl = true;
                        });
                      },
                      onPermissionRequest: (
                        InAppWebViewController controller,
                        PermissionRequest requests,
                      ) async {
                        return PermissionResponse(
                          resources: requests.resources,
                          action: PermissionResponseAction.GRANT,
                        );
                      },
                    ),
                    isLoading
                        ? Align(
                            alignment: Alignment.center,
                            child: LoadingShimmer.circular(),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
        ),
      ),
    );
  }
}
