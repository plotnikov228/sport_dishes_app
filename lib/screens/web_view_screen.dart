import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  const WebViewScreen({Key? key, required this.url}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState(url);
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final String url;
  _WebViewScreenState(this.url);
  bool isLoading=true;


  @override
  Widget build(BuildContext context) {
    bool shouldPop = false;

    final Completer<WebViewController> _controller =
    Completer<WebViewController>();
    return WillPopScope(
      onWillPop: () async {
        return shouldPop;
      },
      child: Scaffold(
        body: Stack(
          children: [
            isLoading == true ? const Center( child: CircularProgressIndicator(color: Colors.black,),)
              : Stack(),
            WebView(

              initialUrl: url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              onProgress: (int progress) {
                print('WebView is loading (progress : $progress%)');
              },
              onPageStarted: (String url) {
                print('Page started loading: $url');
              },
              onPageFinished: (String url) {
                setState(() {
                  isLoading = false;
                });
              },
              gestureNavigationEnabled: true,
              backgroundColor: const Color(0x00000000),
            ),

          ],
        ),
      ),
    );


    }


}
