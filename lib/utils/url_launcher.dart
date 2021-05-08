import 'package:url_launcher/url_launcher.dart';

class LaunchUrl {
  static void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Can\'t launch');
      throw 'Could not launch $url';
    }
  }
}
