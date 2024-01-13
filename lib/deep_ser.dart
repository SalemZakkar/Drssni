import 'package:uni_links/uni_links.dart';

class DeepLinksService {
  static Future<String?> checkForAppLink() async {
    var uri = await getInitialUri();
    if (uri == null) {
      return null;
    }
    // print(uri.host);
    // print(uri.path);
    // print('zulfa2');
    String path = uri.host + uri.path;
    path = "https://$path";
    return path;
  }
}
