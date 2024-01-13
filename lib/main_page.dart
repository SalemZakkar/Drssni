import 'dart:async';

import 'package:darssni2/navigate_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:uni_links/uni_links.dart';

import 'deep_ser.dart';

class MainPage extends StatefulWidget {
  final String? url;

  const MainPage({Key? key, this.url}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late InAppWebViewController controller;
  late StreamSubscription<String?> streamSubscription;
  late PullToRefreshController pullToRefreshController;
  bool fun = false;

  @override
  void initState() {
    streamSubscription = linkStream.listen((event) {
      String url = "";
      if (event == null) {
        return;
      }
      Uri uri = Uri.parse(event);
      url = "https://${uri.host}${uri.path}";
      debugPrint(event.toString());
      debugPrint(url.toString());
      if (url == "") {
        return;
      }
      controller.loadUrl(urlRequest: URLRequest(url: Uri.parse(url)));
    });

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        controller.reload();
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    streamSubscription.cancel();
  }

  double progress = 0;
  String url = 'https://drssni.com/';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await controller.canGoBack()) {
          await controller.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 0,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 4),
            child: LinearProgressIndicator(
              color: Theme.of(context).primaryColor,
              value: progress,
            ),
          ),
        ),
        body: Container(
            color: Colors.white,
            constraints: const BoxConstraints.expand(),
            child: InAppWebView(
              shouldInterceptFetchRequest: (controller, request) async {
                request.headers = {"redirect_home": "home123"};
                return request;
              },
              pullToRefreshController: pullToRefreshController,
              initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                useShouldOverrideUrlLoading: true,
                allowFileAccessFromFileURLs: true,
                cacheEnabled: true,
                javaScriptEnabled: true,
                supportZoom: false,
              )),
              onProgressChanged: (controller, progress) {
                this.progress = progress / 100;
                setState(() {});
              },
              onWebViewCreated: (_) {
                controller = _;
                DeepLinksService.checkForAppLink().then((value) {
                  if (value != null) {
                    controller.loadUrl(
                        urlRequest: URLRequest(url: Uri.parse(value)));
                  }
                });
              },
              shouldOverrideUrlLoading: (controller, navigationAction) async {
                return NavigateUtil.getDecision(
                    navigationAction.request.url?.toString());
              },
              initialUrlRequest: URLRequest(url: Uri.parse(widget.url ?? url)),
            )),
      ),
    );
  }
}

//whatsapp
//mailto
//tg
//
