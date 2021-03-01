import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/imovel.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class RoteiroUploadService {
  final Dio _client;

  RoteiroUploadService(this._client);

  Future<void> upload(int roteiroId) async {
    final imoveis = Hive.box<Imovel>('imoveis').values;
    final roteiroImoveis = imoveis
        .where((e) => e.roteiroId == roteiroId)
        .map((e) => e.toJson())
        .toList();

    final data = {
      'roteiro': {
        'id': roteiroId,
      },
      'imoveis': roteiroImoveis,
    };
    final response = await _client.post(
      '/roteiros-upload',
      data: data,
      options: Options(headers: { 'content-type': 'application/json' }),
    );
    if (response.statusCode == 200) {
      print('ok');
    }
  }
}
