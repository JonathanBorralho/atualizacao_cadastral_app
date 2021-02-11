import 'package:hive/hive.dart';
import 'package:oauth_dio/oauth_dio.dart';

const String OAUTH_TOKEN_KEY = 'OAUTH_TOKEN_KEY';

class HiveOAuthStorage extends OAuthStorage {

  final Box<OAuthToken> _oauthBox = Hive.box<OAuthToken>('OAUTH_TOKEN_BOX');

  @override
  Future<void> clear() async {
    _oauthBox.delete(OAUTH_TOKEN_KEY);
  }

  @override
  Future<OAuthToken> fetch() async {
    return _oauthBox.get(OAUTH_TOKEN_KEY);
  }

  @override
  Future<OAuthToken> save(OAuthToken token) async {
    _oauthBox.put(OAUTH_TOKEN_KEY, token);
    return token;
  }
  
}
