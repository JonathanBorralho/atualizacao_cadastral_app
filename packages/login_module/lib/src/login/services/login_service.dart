import 'package:login_module/src/login/models/login_credentials_model.dart';
import 'package:oauth_dio/oauth_dio.dart';

import 'login_exception.dart';

class LoginService {
  final OAuth oAuth;

  const LoginService(this.oAuth);

  Future<OAuthToken> login(LoginCredentials credentials) async {
    try {
      final OAuthToken oauthToken = await oAuth.requestToken(
        PasswordGrant(
          username: credentials.username,
          password: credentials.password,
          scope: ['read', 'write'],
        ),
      );
      return oauthToken;
    } on Exception catch (_) {
      throw LoginException('Erro ao tentar realizar login');
    }
  }
}
