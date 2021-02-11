import 'package:oauth_dio/oauth_dio.dart';
import 'dart:convert';


class JwtUtil {
  final OAuth _auth;

  JwtUtil(this._auth);

  Future<String> getMatricula() async {
    return _getClaim('user_name');
  }

  Future<String> getNomeCompleto() async {
    return _getClaim('full_name');
  }

  Future<int> getUserId() async {
    final storage = _auth.storage;
    final OAuthToken authToken = await storage.fetch();
    return _decode(authToken.accessToken)['user_id'];
  }

  Future<String> _getClaim(String claim) async {
    final storage = _auth.storage;
    final OAuthToken authToken = await storage.fetch();
    return _decode(authToken.accessToken)[claim];
  }

  static Map<String, dynamic> _decode(String jwt) {
    String payloadBase64 = jwt.split('.')[1];
    String normalizedSource = base64Url.normalize(payloadBase64);
    String payload = utf8.decode(base64Url.decode(normalizedSource));
    return jsonDecode(payload);
  }
  
}
