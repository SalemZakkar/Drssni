import 'package:darssni2/navigate_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late InAppWebViewController controller;
  late PullToRefreshController pullToRefreshController;
  @override
  void initState() {
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
  }

  double progress = 0;
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
              },
              shouldOverrideUrlLoading: (controller, navigationAction) async {
                return NavigateUtil.getDecision(
                    navigationAction.request.url?.toString());
              },
              initialUrlRequest: URLRequest(
                  url: Uri.parse('https://www.drssni.com/test-salem')),
            )),
      ),
    );
  }
}

//whatsapp
//mailto
//tg
//
