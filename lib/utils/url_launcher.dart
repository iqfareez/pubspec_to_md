import 'package:url_launcher/url_launcher.dart';

class LaunchUrl {
  static void launchURL(String url) async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print('Can\'t launch');
      throw 'Could not launch ${uri.toString()}';
    }
  }
}
