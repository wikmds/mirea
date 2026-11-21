class UserData {
  static String? name;
  static String? email;
  static String? password;

  static bool get isRegistered {
    return name != null &&
        email != null &&
        password != null;
  }

  static void register({
    required String userName,
    required String userEmail,
    required String userPassword,
  }) {
    name = userName;
    email = userEmail;
    password = userPassword;
  }

  static bool login({
    required String userEmail,
    required String userPassword,
  }) {
    return email == userEmail &&
        password == userPassword;
  }
}