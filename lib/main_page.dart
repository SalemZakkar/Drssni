import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late WebViewController webViewController;
  @override
  void initState() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://www.drssni.com/profile'))
      ..setNavigationDelegate(NavigationDelegate(onProgress: (val) {
        setState(() {
          progress = val / 100;
        });
      }))
      ..setBackgroundColor(Colors.white)
      ..enableZoom(false);
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
        if (await webViewController.canGoBack()) {
          await webViewController.goBack();
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
            constraints: const BoxConstraints.expand(),
            child: WebViewWidget(controller: webViewController)),
      ),
    );
  }
}
