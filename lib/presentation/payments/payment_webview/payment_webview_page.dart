import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

@RoutePage<Uri?>()
class PaymentWebviewPage extends StatelessWidget {
  const PaymentWebviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isTH =
        context.read<NewPaymentBloc>().state.salesOrganisation.salesOrg.isTH;

    return Scaffold(
      body: isTH
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ListTile(
                    tileColor: ZPColors.blueAccent,
                    dense: true,
                    contentPadding: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    title: Text(
                      context.tr(
                        'Take a screen shot and scan the QR code for payment using the KBank mobile app',
                      ),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Expanded(
                    child: _WebviewBody(isTH: isTH),
                  ),
                  Container(
                    width: double.infinity,
                    key: WidgetKeys.closeButton,
                    margin: const EdgeInsets.only(top: 12),
                    child: ElevatedButton(
                      onPressed: () {
                        context.router.maybePop(Uri.parse(''));
                      },
                      child: Text(
                        context.tr('Close'),
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: ZPColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : SafeArea(
              child: _WebviewBody(isTH: isTH),
            ),
    );
  }
}

class _WebviewBody extends StatefulWidget {
  final bool isTH;
  const _WebviewBody({required this.isTH});

  @override
  State<_WebviewBody> createState() => _WebviewBodyState();
}

class _WebviewBodyState extends State<_WebviewBody> {
  NewPaymentState get _newPaymentState => context.read<NewPaymentBloc>().state;
  bool isPop = false;

  Future<void> _initMobileViewport(InAppWebViewController controller) async {
    await controller.evaluateJavascript(
      source: """
            (function() {
              var meta = document.querySelector('meta[name="viewport"]');
              if (meta) {
                meta.content = 'width=device-width, initial-scale=1';
              } else {
                meta = document.createElement('meta');
                meta.name = 'viewport';
                meta.content = 'width=device-width, initial-scale=1';
                document.getElementsByTagName('head')[0].appendChild(meta);
              }
            })();
          """,
    );
  }

  Future<void> _updateTHWebviewComponentStyles(
    InAppWebViewController controller,
  ) async {
    await controller.evaluateJavascript(
      source: """
            const payNowButton = document.querySelector('button[_kpayment].pay-button');
                if (payNowButton) {
                  payNowButton.style.fontWeight = 'bold';
                  payNowButton.style.position = 'absolute';
                  payNowButton.style.display = 'flex';
                  payNowButton.style.top = '50%';
                  payNowButton.style.left = '50%';
                  payNowButton.style.transform = 'translate(-50%, -50%)';
                }

            const paymentContainer = document.querySelector('.payment-container[_kpayment]');
                if(paymentContainer){
                  paymentContainer.style.backgroundColor = 'white'; 
                }

             // Step 1: Select the style tag
            var styleTag = document.querySelector('style');

            if(styleTag){
              var styleContent = styleTag.innerHTML;
              styleContent = styleContent.replace(/overflow-y:hidden/g, 'overflow-y:scroll');
              styleTag.innerHTML = styleContent;
            }

            const timer = setInterval(() => {
                const findButtonElement = document.getElementsByClassName('pay-button')?.[0];
                if (findButtonElement) clearInterval(timer);
                else return;
                findButtonElement.click();
            }, 50);
          """,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      key: WidgetKeys.paymentWebviewPage,
      initialSettings: InAppWebViewSettings(
        javaScriptCanOpenWindowsAutomatically: true,
        supportZoom: false,
        useShouldOverrideUrlLoading: true,
        cacheEnabled: false,
        clearCache: true,
      ),
      initialUrlRequest: URLRequest(
        url: WebUri.uri(
          Uri.dataFromString(
            _newPaymentState.paymentInfo.zzHtmcs,
            mimeType: 'text/html',
          ),
        ),
      ),
      shouldOverrideUrlLoading: (controller, navigationAction) async {
        //TODO: Will POC the issue on IOS first, can take a look to enhancement later after we find a 90% to reproduce issue

        if (Platform.isIOS) {
          await _onPaymentSuccessCallBack(controller);
        }

        return NavigationActionPolicy.ALLOW;
      },
      onLoadStop: (controller, url) async {
        if (Platform.isAndroid) {
          await _onPaymentSuccessCallBack(controller);
        }

        if (widget.isTH) {
          await _initMobileViewport(controller);
          await _updateTHWebviewComponentStyles(controller);
        }
      },
    );
  }

  Future<void> _onPaymentSuccessCallBack(
    InAppWebViewController controller,
  ) async {
    final router = context.router;
    final uri = await controller.getUrl();

    if (uri != null) {
      final isPaymentSuccess = uri.path.contains('my-account/thankyou');
      trackMixpanelEvent(
        TrackingEvents.paymentGatewayWebviewLoaded,
        props: {
          TrackingProps.paymentGatewayRedirectUrl: uri.toString(),
          TrackingProps.market:
              _newPaymentState.salesOrganisation.salesOrg.country,
          TrackingProps.paymentGatewayzzHtmcs:
              _newPaymentState.paymentInfo.zzHtmcs,
          TrackingProps.username:
              _newPaymentState.user.fullName.displayFullName,
          TrackingProps.paymentAdviceId:
              _newPaymentState.paymentInvoiceInfoPdf.zzAdvice,
          TrackingProps.paymentGatewaySuccess: isPaymentSuccess,
        },
      );
      if (isPaymentSuccess && !isPop) {
        isPop = true;
        unawaited(router.maybePop(uri));
      }
    }
  }
}
