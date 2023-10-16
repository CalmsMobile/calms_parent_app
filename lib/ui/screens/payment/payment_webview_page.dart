import 'dart:io';

import 'package:calms_parent_latest/common/app_settings.dart';
import 'package:calms_parent_latest/common/common_api.dart';
import 'package:calms_parent_latest/common/listener/settings_listener.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
// #docregion platform_imports
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
// #enddocregion platform_imports

class PaymentWebviewPage extends StatefulWidget {
  final arguments;
  final paymentFor;
  const PaymentWebviewPage(this.arguments, this.paymentFor, {Key? key})
      : super(key: key);

  @override
  _PaymentWebviewPageState createState() => _PaymentWebviewPageState();
}

class _PaymentWebviewPageState extends State<PaymentWebviewPage> {
  late WebViewController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initWebViewController(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('Flutter Simple Example')),
      body: WebViewWidget(controller: _controller),
    );
  }

  initWebViewController(BuildContext context) async {
    // #docregion platform_features
    print("==========================");
    print(widget.arguments);
    print("==========================");
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features
    var pageContent = '<html><head></head><body> ' +
        widget.arguments['PostData'] +
        '<script type="text/javascript">document.getElementById("PostForm").submit();</script></body></html>';
    if (widget.arguments['PayMode'] == "RAZER") {
      controller
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              debugPrint('WebView is loading (progress : $progress%)');
            },
            onPageStarted: (String url) {
              debugPrint('Page started loading: $url');
            },
            onPageFinished: (String url) {
              if (url.contains("/common/PaymentStatus.aspx")) {
                if (widget.paymentFor == AppSettings.paymentTypeOrder)
                  context.read<MySettingsListener>().clearFinalCartList();
                debugPrint("payment success");
                CommonUtil().getAfterTopupPaymentSummary(context,
                    widget.arguments['PaymentOrderId'], widget.paymentFor);
              }
              debugPrint('Page finished loading: $url');
            },
            onWebResourceError: (WebResourceError error) {
              /* debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          '''); */
            },
            onNavigationRequest: (NavigationRequest request) {
              /* if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            } */
              debugPrint('allowing navigation to ${request.url}');
              return NavigationDecision.navigate;
            },
            onUrlChange: (UrlChange change) {
              debugPrint('url change to ${change.url}');
            },
          ),
        )
        ..addJavaScriptChannel(
          'Toaster',
          onMessageReceived: (JavaScriptMessage message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message.message)),
            );
          },
        )
        ..loadHtmlString(pageContent);
    } else {
      controller
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              debugPrint('WebView is loading (progress : $progress%)');
            },
            onPageStarted: (String url) {
              debugPrint('Page started loading: $url');
            },
            onPageFinished: (String url) {
              if (url.contains("/common/PaymentStatus.aspx")) {
                if (widget.paymentFor == AppSettings.paymentTypeOrder)
                  context.read<MySettingsListener>().clearFinalCartList();
                debugPrint("payment success");
                CommonUtil().getAfterTopupPaymentSummary(context,
                    widget.arguments['PaymentOrderId'], widget.paymentFor);
              }
              debugPrint('Page finished loading: $url');
            },
            onWebResourceError: (WebResourceError error) {
              /* debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          '''); */
            },
            onNavigationRequest: (NavigationRequest request) {
              /* if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            } */
              debugPrint('allowing navigation to ${request.url}');
              return NavigationDecision.navigate;
            },
            onUrlChange: (UrlChange change) {
              debugPrint('url change to ${change.url}');
            },
          ),
        )
        ..addJavaScriptChannel(
          'Toaster',
          onMessageReceived: (JavaScriptMessage message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message.message)),
            );
          },
        )
        ..loadRequest(Uri.parse(widget.arguments['RedirectUrl']));
    }

    //..loadRequest(Uri.parse(widget.arguments['RedirectUrl']),method: LoadRequestMethod.post,headers: widget.arguments['PostData']);

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    _controller = controller;
  }
}
