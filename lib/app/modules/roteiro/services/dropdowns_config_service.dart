import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/dropdowns_config.dart';

class DropdownsConfigService {
  final Dio _client;

  DropdownsConfigService(this._client);

  Future<DropdownsConfig> getConfig() async {
    final Response response = await _client.get(
      '/dropdownsConfig',
      options: buildCacheOptions(
        Duration(days: 7),
        forceRefresh: true,
        options: RequestOptions(
          connectTimeout: 2000,
        ),
      ),
    );
    return DropdownsConfig.fromJson(response.data);
  }
}
