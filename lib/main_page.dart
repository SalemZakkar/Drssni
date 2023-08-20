import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  WebViewController webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://www.drssni.com/profile'))
    ..setNavigationDelegate(NavigationDelegate(onProgress: (progress) {}))
    ..setBackgroundColor(Colors.white);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 10,
        elevation: 0,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: WebViewWidget(controller: webViewController),
      ),
    );
  }
}
