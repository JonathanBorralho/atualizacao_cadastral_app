import 'package:dio/dio.dart';
import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/imovel.dart';
import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/roteiro_resumo.dart';

class RoteiroRepository {
  final Dio _client;

  RoteiroRepository(this._client);

  Future<List<RoteiroResumo>> findAll() async {
    final response = await _client.get<List>('/roteiros');
    return response.data.map((e) => RoteiroResumo.fromJson(e)).toList();
  }

  Future<List<Imovel>> findAllByRoteiro(int roteiroId) async {
    final response = await _client.get<List>('/roteiros/$roteiroId/imoveis');
    return response.data.map((e) => Imovel.fromJson(e)).toList();
  }
}
