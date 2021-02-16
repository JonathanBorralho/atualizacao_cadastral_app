import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/dropdowns_config.dart';
import 'package:hive/hive.dart';

class DropdownsConfigService {
  final Dio _client;
  final Box<DropdownsConfig> _cache = Hive.box<DropdownsConfig>('dropdown_config');

  DropdownsConfigService(this._client);

  Future<DropdownsConfig> getConfig() async {
    if (hasCache()) return getCache();

    final Response response = await _client.get(
      '/dropdownsConfig',
      /* options: buildCacheOptions(
        Duration(days: 7),
        forceRefresh: true,
        options: RequestOptions(
          connectTimeout: 2000,
        ),
      ), */
    );

    var config = DropdownsConfig.fromJson(response.data);
    saveInCache(config);

    return config;
  }

  bool hasCache() {
    return _cache.isNotEmpty;
  }

  DropdownsConfig getCache() {
    return _cache.get(1);
  }

  void saveInCache(DropdownsConfig config) {
    _cache.put(1, config);
  }
}
