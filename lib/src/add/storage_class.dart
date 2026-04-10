import 'package:shared_preferences/shared_preferences.dart';

class SharePre {
  // Save data
  Future<void> saveData({
    required String name,
    required String email,
    required String phone,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> oldData = prefs.getStringList("users") ?? [];

    String newUser = "$name|$email|$phone";

    oldData.add(newUser);

    await prefs.setStringList("users", oldData);
  }

  // Get data
  Future<List<String>> getData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList("users") ?? [];
  }
}