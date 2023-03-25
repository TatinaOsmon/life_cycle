// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:shared_preferences/shared_preferences.dart';

class UserModel {
  UserModel({
    required this.id,
    this.name,
    this.lastName,
    this.password,
  });

  final String id;
  final String? name;
  final String? lastName;
  final String? password;
}
