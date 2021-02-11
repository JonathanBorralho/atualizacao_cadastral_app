import 'package:hive/hive.dart';
import 'package:oauth_dio/oauth_dio.dart';

class OAuthTokenAdapter extends TypeAdapter<OAuthToken> {
  @override
  OAuthToken read(BinaryReader reader) {
    return OAuthToken(
      accessToken: reader.readString(),
      refreshToken: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, OAuthToken token) {
    writer.writeString(token.accessToken);
    writer.writeString(token.refreshToken);
  }

  @override
  int get typeId => 7;
}
