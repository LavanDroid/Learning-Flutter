// spell-checker:disable

class UserStorageKeys {
  //* Singleton logic
  UserStorageKeys._privateConstructor();
  static final UserStorageKeys _instance =
      UserStorageKeys._privateConstructor();
  factory UserStorageKeys() {
    return _instance;
  }

  static const String userName = 'asdfghjk';
}
