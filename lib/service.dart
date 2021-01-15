import 'package:http/http.dart' as http;
import 'profile.dart';

class Services {
  static const String url = 'http://zohairhemani.me/demo/contacts.php';
  static Future<List<Profile>> getProfile() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<Profile> profiles = profileFromJson(response.body);
        return profiles;
      } else {
        return List<Profile>();
      }
    } catch (e) {
      return List<Profile>();
    }
  }
}
