import 'package:shared_preferences/shared_preferences.dart';

Future<void> setLoginPreference(bool value) async {
  final pref = await SharedPreferences.getInstance();
  await pref.setBool('isLoggedIn', value);
}
