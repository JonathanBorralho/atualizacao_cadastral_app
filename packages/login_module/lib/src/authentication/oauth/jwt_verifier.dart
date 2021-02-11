import 'dart:convert';

abstract class JwtVerifier {
  static bool isExpired(String jwt) {
    if (jwt == null) return true;
    int expSecs = _getSeconds(_decode(jwt));
    DateTime expDate = DateTime.fromMillisecondsSinceEpoch(expSecs * 1000);
    return expDate.isBefore(DateTime.now());
  }

  static Map<String, dynamic> _decode(String jwt) {
    String payloadBase64 = jwt.split('.')[1];
    String normalizedSource = base64Url.normalize(payloadBase64);
    String payload = utf8.decode(base64Url.decode(normalizedSource));
    return jsonDecode(payload);
  }

  static int _getSeconds(Map<String, dynamic> jwtDecoded) {
    return jwtDecoded['exp'];
  }
}