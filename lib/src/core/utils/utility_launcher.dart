import 'package:url_launcher/url_launcher.dart';
class LauncherUtility {
  static Future<void> makeCall(String contact) async {
    await launchUrl(Uri.parse("tel:$contact"));
  }
}
