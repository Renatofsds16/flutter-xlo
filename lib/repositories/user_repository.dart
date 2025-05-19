import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:xlo/models/user.dart';
import 'package:xlo/repositories/parse_erros.dart';

class UserRepository {
  Future<User?> signUp(User user) async {
    final ParseUser parseUser = ParseUser(
      user.email,
      user.password1,
      user.email,
    );
    parseUser.set('phone', user.phone);
    parseUser.set('name', user.name);
    parseUser.set('type', user.type?.index);
    final ParseResponse parseResponse = await parseUser.signUp();
    if (parseResponse.success) {
      return mapParseToUser(parseResponse.result);
    } else {
      return Future.error(
        ParseErrors.getDescription(parseResponse.error!.code) as Object,
      );
    }
  }

  Future<User?> loginWithEmail(String email, String password) async {
    final ParseUser parseUser = ParseUser(email, password, null);
    final ParseResponse parseResponse = await parseUser.login();
    if (parseResponse.success) {
      return mapParseToUser(parseResponse.result);
    } else {
      return Future.error(
        ParseErrors.getDescription(parseResponse.error!.code) as Object,
      );
    }
  }

  Future<void> loginWithFacebook(User user) async {}

  User? mapParseToUser(ParseUser? parseUser) {
    if (parseUser != null) {
      return User(
        id: parseUser.objectId,
        name: parseUser.get('name'),
        email: parseUser.get('username'),
        phone: parseUser.get('phone'),
        type: parseUser.get('type'),
        createdAt: parseUser.get('createdAt'),
        sessionToken: parseUser.get('sessionToken'),
      );
    }
    return null;
  }

  Future<User?> currentUser() async {
    final ParseUser? parseUser = await ParseUser.currentUser();
    if (parseUser != null && parseUser.sessionToken != null) {
      final ParseResponse? response = await ParseUser.getCurrentUserFromServer(
        parseUser.sessionToken!,
      );
      if (response != null && response.success) {
        return mapParseToUser(response.result);
      } else {
        await parseUser.logout();
      }
    }
    return null;
  }
}
