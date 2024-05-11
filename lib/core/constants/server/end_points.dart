class EndPoints {
  static final EndPoints _endPoints = EndPoints._internal();

  factory EndPoints() {
    return _endPoints;
  }

  EndPoints._internal();

  static const String host = 'mcms.alphadevelopmentco.com/api/';

  // Authentication
  static const String login = '${host}login';
  static const String register = '${host}register';
  static const String sendCode = '${host}send-code';
  static const String checkCode = '${host}check-code';
  static const String logout = '${host}logout';
  static const String changePassword = '${host}change-password';
}
