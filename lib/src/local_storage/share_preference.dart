import 'package:shared_preferences/shared_preferences.dart';

class SharePre {
  Future saveData({
    required String name,
    required String email,
    required String phone,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("name", name);
    prefs.setString("email", email);
    prefs.setString("phone", phone);
    print("Name: $name, Phone: $phone, email : $email");
  }

  Future getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? Nam = prefs.getString("name");
    String? Ema = prefs.getString("email");
    String? Phon = prefs.getString("phone");
    return Nam;
  }
}
