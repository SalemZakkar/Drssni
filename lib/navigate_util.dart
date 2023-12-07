import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigateUtil {
  static Future<NavigationActionPolicy?> getDecision(String? url) async {
    if (url == null) {
      return null;
    }
    if (url.startsWith('whatsapp') ||
        url.startsWith('tg') ||
        url.startsWith('mailto') ||
        url.startsWith('fb')) {
      try {
        await launchUrl(Uri.parse(url));
      } catch (e) {
        debugPrint(e.toString());
      }
      return NavigationActionPolicy.CANCEL;
    }
    return NavigationActionPolicy.ALLOW;
  }
}
