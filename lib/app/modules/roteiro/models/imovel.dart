import 'package:hive/hive.dart';

part 'imovel.g.dart';

@HiveType(typeId: 2, adapterName: 'ImovelAdapter')
class Imovel extends HiveObject {
  Imovel({
    this.id,
    this.roteiroId,
    this.roteirizacao,
    this.endereco,
  });

  @HiveField(0)
  final int id;

  @HiveField(1)
  final int roteiroId;

  @HiveField(2)
  final Roteirizacao roteirizacao;

  @HiveField(3)
  final Endereco endereco;

  factory Imovel.fromJson(Map<String, dynamic> json) => Imovel(
    id: json['id'] == null ? null : json['id'],
    roteiroId: json['roteiro_id'] == null ? null : json['roteiro_id'],
    roteirizacao: json['roteirizacao'] == null ? null : Roteirizacao.fromJson(json['roteirizacao']),
    endereco: json['endereco'] == null ? null : Endereco.fromJson(json['endereco']),
  );

  Map<String, dynamic> toJson() => {
    'id': id == null ? null : id,
    'roteiro_id': roteiroId == null ? null : roteiroId,
    'roteirizacao': roteirizacao == null ? null : roteirizacao.toJson(),
    'endereco': endereco == null ? null : endereco.toJson(),
  };

  Imovel copyWith({
    int id,
    int roteiroId,
    Roteirizacao roteirizacao,
    Endereco endereco,
  }) {
    return Imovel(
      id: id ?? this.id,
      roteiroId: roteiroId ?? this.roteiroId,
      roteirizacao: roteirizacao ?? this.roteirizacao,
      endereco: endereco ?? this.endereco,
    );
  }
}

@HiveType(typeId: 3, adapterName: 'EnderecoAdapter')
class Endereco {
  Endereco({
    this.logradouro,
    this.cep,
    this.bairro,
    this.numero,
    this.complemento,
  });

  @HiveField(0)
  final String logradouro;

  @HiveField(1)
  final String cep;

  @HiveField(2)
  final String bairro;

  @HiveField(3)
  final String numero;

  @HiveField(4)
  final String complemento;

  factory Endereco.fromJson(Map<String, dynamic> json) => Endereco(
    logradouro: json['logradouro'] == null ? null : json['logradouro'],
    cep: json['cep'] == null ? null : json['cep'],
    bairro: json['bairro'] == null ? null : json['bairro'],
    numero: json['numero'] == null ? null : json['numero'],
    complemento: json['complemento'] == null ? null : json['complemento'],
  );

  Map<String, dynamic> toJson() => {
    'logradouro': logradouro == null ? null : logradouro,
    'cep': cep == null ? null : cep,
    'bairro': bairro == null ? null : bairro,
    'numero': numero == null ? null : numero,
    'complemento': complemento == null ? null : complemento,
  };
}

@HiveType(typeId: 4, adapterName: 'RoteirizacaoAdapter')
class Roteirizacao {
  Roteirizacao({
    this.matricula,
    this.visita,
    this.localidade,
    this.setor,
    this.quadra,
    this.rota,
    this.sequencia,
    this.sublote,
    this.testada,
  });

  @HiveField(0)
  final int matricula;

  @HiveField(1)
  final int visita;

  @HiveField(2)
  final int localidade;

  @HiveField(3)
  final int setor;

  @HiveField(4)
  final int quadra;

  @HiveField(5)
  final int rota;

  @HiveField(6)
  final int sequencia;

  @HiveField(7)
  final int sublote;

  @HiveField(8)
  final int testada;

  factory Roteirizacao.fromJson(Map<String, dynamic> json) => Roteirizacao(
    matricula: json['matricula'] == null ? null : json['matricula'],
    visita: json['visita'] == null ? null : json['visita'],
    localidade: json['localidade'] == null ? null : json['localidade'],
    setor: json['setor'] == null ? null : json['setor'],
    quadra: json['quadra'] == null ? null : json['quadra'],
    rota: json['rota'] == null ? null : json['rota'],
    sequencia: json['sequencia'] == null ? null : json['sequencia'],
    sublote: json['sublote'] == null ? null : json['sublote'],
    testada: json['testada'] == null ? null : json['testada'],
  );

  Map<String, dynamic> toJson() => {
    'matricula': matricula == null ? null : matricula,
    'visita': visita == null ? null : visita,
    'localidade': localidade == null ? null : localidade,
    'setor': setor == null ? null : setor,
    'quadra': quadra == null ? null : quadra,
    'rota': rota == null ? null : rota,
    'sequencia': sequencia == null ? null : sequencia,
    'sublote': sublote == null ? null : sublote,
    'testada': testada == null ? null : testada,
  };
}
