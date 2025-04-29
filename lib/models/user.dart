import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

enum UserType { PARTICULAR, PROFESSIONAL }

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.password1,
    this.type,
    this.sessionToken,
    this.createdAt,
  });
  String? id;
  String? sessionToken;
  String? name;
  String? email;
  String? phone;
  String? password1;
  DateTime? createdAt;
  UserType? type = UserType.PARTICULAR;

  @override
  String toString() {
    return 'User{id: $id, sessionToken: $sessionToken, name: $name, email: $email, phone: $phone, password1: $password1, createdAt: $createdAt, type: $type}';
  }
}
