import 'package:flutter/foundation.dart';

class User {
  final String name;
  final String email;
  final String avatar;
  final int id;
  final String token;

  User(
      {@required this.name,
      @required this.email,
      @required this.avatar,
      @required this.id,
      @required this.token});

  User.fromMap(Map<String, dynamic> map)
      : //assert(map['id'] != null),
        id = map['id'],
        email = map['email'],
        name = map['name'],
        avatar = map['avatar'],
        token = map['token'];
}
