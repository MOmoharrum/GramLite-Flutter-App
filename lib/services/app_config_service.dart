import 'dart:convert';

import 'package:flutter_data_operation/main.dart';
import 'package:flutter_data_operation/models/user.dart';

class AppConfigService {
  static User? get appUser {
    if (prefs?.getString('appUser') == null) {
      return null;
    } else {
      return User.fromJson(
        jsonDecode(prefs?.getString('appUser') ?? ''),
      );
    }
  }

  static set appUser(User? user) =>
      prefs?.setString('appUser', jsonEncode(user?.toJson()));
}
