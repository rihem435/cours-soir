import 'package:app/core/storage/storage.dart';

class AppStorage {
  static const String emailKey = "email";
  static const String userNameKey = "username";
  static const String accessTokenKey = "accessToken";
  static const String codeKey = "code";

  static saveEmail(String email) {
    SecureStorage.writeSecureData(key: emailKey, value: email);
  }

  static String? readEmail() {
    return SecureStorage.readSecureData(emailKey);
  }

  static saveUserName(String userName) {
    SecureStorage.writeSecureData(key: userNameKey, value: userName);
  }

  static String? readUserName() {
    return SecureStorage.readSecureData(userNameKey);
  }

  static savevAccessToken(String accessToken) {
    SecureStorage.writeSecureData(key: accessTokenKey, value: accessToken);
  }

  static String? readAccessToken() {
    return SecureStorage.readSecureData(accessTokenKey);
  }

  static savevCode(String code) {
    SecureStorage.writeSecureData(key: codeKey, value: code);
  }

  static String? readCode() {
    return SecureStorage.readSecureData(codeKey);
  }
}
