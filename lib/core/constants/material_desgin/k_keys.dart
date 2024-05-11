class KKeys {
  static final KKeys _kKeys = KKeys._internal();

  factory KKeys() {
    return _kKeys;
  }

  KKeys._internal();

  String token = 'token';
  String fullName = 'fullName';
  String email = 'email';
  String phone = 'phone';
  String isManager = 'is-manager';
  String dateOfBirth = 'date-of-birth';
}
