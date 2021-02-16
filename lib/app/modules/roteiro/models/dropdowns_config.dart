import 'package:equatable/equatable.dart';

class DropdownsConfig extends Equatable {
  const DropdownsConfig({
    this.tipoAbastecimento,
    this.tipoSitAgua,
    this.tipoSitEsgoto,
    this.tipoCliente,
    this.tipoCobertura,
    this.tipoConstrucao,
    this.tipoHabitacao,
    this.tipoCalcada,
    this.tipoRua,
    this.tipoPropriedade,
    this.estados,
  });

  final List<Tipo> tipoAbastecimento;
  final List<Tipo> tipoSitAgua;
  final List<Tipo> tipoSitEsgoto;
  final List<Tipo> tipoCliente;
  final List<Tipo> tipoCobertura;
  final List<Tipo> tipoConstrucao;
  final List<Tipo> tipoHabitacao;
  final List<Tipo> tipoCalcada;
  final List<Tipo> tipoRua;
  final List<Tipo> tipoPropriedade;
  final List<Estado> estados;

  factory DropdownsConfig.fromJson(Map<String, dynamic> json) => DropdownsConfig(
    tipoAbastecimento: json['tipoAbastecimento'] == null ? null : List<Tipo>.from(json['tipoAbastecimento'].map((x) => Tipo.fromJson(x))),
    tipoSitAgua: json['tipoSitAgua'] == null ? null : List<Tipo>.from(json['tipoSitAgua'].map((x) => Tipo.fromJson(x))),
    tipoSitEsgoto: json['tipoSitEsgoto'] == null ? null : List<Tipo>.from(json['tipoSitEsgoto'].map((x) => Tipo.fromJson(x))),
    tipoCliente: json['tipoCliente'] == null ? null : List<Tipo>.from(json['tipoCliente'].map((x) => Tipo.fromJson(x))),
    tipoCobertura: json['tipoCobertura'] == null ? null : List<Tipo>.from(json['tipoCobertura'].map((x) => Tipo.fromJson(x))),
    tipoConstrucao: json['tipoConstrucao'] == null ? null : List<Tipo>.from(json['tipoConstrucao'].map((x) => Tipo.fromJson(x))),
    tipoHabitacao: json['tipoHabitacao'] == null ? null : List<Tipo>.from(json['tipoHabitacao'].map((x) => Tipo.fromJson(x))),
    tipoCalcada: json['tipoCalcada'] == null ? null : List<Tipo>.from(json['tipoCalcada'].map((x) => Tipo.fromJson(x))),
    tipoRua: json['tipoRua'] == null ? null : List<Tipo>.from(json['tipoRua'].map((x) => Tipo.fromJson(x))),
    tipoPropriedade: json['tipoPropriedade'] == null ? null : List<Tipo>.from(json['tipoPropriedade'].map((x) => Tipo.fromJson(x))),
    estados: json['estados'] == null ? null : List<Estado>.from(json['estados'].map((x) => Estado.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'tipoAbastecimento': tipoAbastecimento == null ? null : List<dynamic>.from(tipoAbastecimento.map((x) => x.toJson())),
    'tipoSitAgua': tipoSitAgua == null ? null : List<dynamic>.from(tipoSitAgua.map((x) => x.toJson())),
    'tipoSitEsgoto': tipoSitEsgoto == null ? null : List<dynamic>.from(tipoSitEsgoto.map((x) => x.toJson())),
    'tipoCliente': tipoCliente == null ? null : List<dynamic>.from(tipoCliente.map((x) => x.toJson())),
    'tipoCobertura': tipoCobertura == null ? null : List<dynamic>.from(tipoCobertura.map((x) => x.toJson())),
    'tipoConstrucao': tipoConstrucao == null ? null : List<dynamic>.from(tipoConstrucao.map((x) => x.toJson())),
    'tipoHabitacao': tipoHabitacao == null ? null : List<dynamic>.from(tipoHabitacao.map((x) => x.toJson())),
    'tipoCalcada': tipoCalcada == null ? null : List<dynamic>.from(tipoCalcada.map((x) => x.toJson())),
    'tipoRua': tipoRua == null ? null : List<dynamic>.from(tipoRua.map((x) => x.toJson())),
    'tipoPropriedade': tipoPropriedade == null ? null : List<dynamic>.from(tipoPropriedade.map((x) => x.toJson())),
    'estados': estados == null ? null : List<dynamic>.from(estados.map((x) => x.toJson())),
  };

  @override
  List<Object> get props => [
    tipoAbastecimento,
    tipoSitAgua,
    tipoSitEsgoto,
    tipoCliente,
    tipoCobertura,
    tipoConstrucao,
    tipoHabitacao,
    tipoCalcada,
    tipoRua,
    tipoPropriedade,
    estados,
  ];
}

class Estado extends Equatable {
  const Estado({
    this.id,
    this.sigla,
    this.descricao,
  });

  final int id;
  final String sigla;
  final String descricao;

  factory Estado.fromJson(Map<String, dynamic> json) => Estado(
    id: json['id'] == null ? null : json['id'],
    sigla: json['sigla'] == null ? null : json['sigla'],
    descricao: json['descricao'] == null ? null : json['descricao'],
  );

  Map<String, dynamic> toJson() => {
    'id': id == null ? null : id,
    'sigla': sigla == null ? null : sigla,
    'descricao': descricao == null ? null : descricao,
  };

  @override
  List<Object> get props => [
    id,
    sigla,
    descricao,
  ];
}

class Tipo extends Equatable {
  const Tipo({
    this.id,
    this.descricao,
  });

  final int id;
  final String descricao;

  factory Tipo.fromJson(Map<String, dynamic> json) => Tipo(
    id: json['id'] == null ? null : json['id'],
    descricao: json['descricao'] == null ? null : json['descricao'],
  );

  Map<String, dynamic> toJson() => {
    'id': id == null ? null : id,
    'descricao': descricao == null ? null : descricao,
  };

  @override
  List<Object> get props => [
    id,
    descricao,
  ];
}
