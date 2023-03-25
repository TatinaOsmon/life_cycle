import 'package:shared_preferences/shared_preferences.dart';

class UserStateService {
  static const String _nameKey = 'name-key';
  static const String _lastNameKey = 'name-key';
  static const String _passwordKey = 'name-key';
  static const String _registerKey = 'name-key';

  Future<bool> isRegister() async {
    final pref = await SharedPreferences.getInstance();

    return pref.getBool(_registerKey) ?? false;
  }

  Future<void> signUp({
    required String name,
    required String lastName,
    required String password,
  }) async {
    final pref = await SharedPreferences.getInstance();

    await pref.setString(_nameKey, name);
    await pref.setString(_lastNameKey, lastName);
    await pref.setString(_passwordKey, password);
    await pref.setBool(_registerKey, true);
  }

  Future<bool> signIn({
    required String name,
    required String password,
  }) async {
    final pref = await SharedPreferences.getInstance();

    final cachedName = pref.getString(_nameKey);
    final cachedPassword = pref.getString(_passwordKey);

    if (name == cachedName && password == cachedPassword) {
      return true;
    } else {
      return false;
    }
    Future<void> signOut() async {
      final pref = await SharedPreferences.getInstance();
      await pref.remove(_registerKey);
    }
  }

  getUser() {}

  signOut() {}

  delete() {}
}

final service = UserStateService();
