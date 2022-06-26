import 'package:url_launcher/url_launcher.dart';
class  LinkOpen {
  static Future<void> openLink(String weblink) async{
    final Uri _url = Uri.parse(weblink);
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }
}
