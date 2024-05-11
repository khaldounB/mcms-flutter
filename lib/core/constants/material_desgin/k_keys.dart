class KKeys {
  static final KKeys _kKeys = KKeys._internal();

  factory KKeys() {
    return _kKeys;
  }

  KKeys._internal();

  String token = 'token';
  String language = 'language';
}
