import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'dropdowns_config.g.dart';

@HiveType(typeId: 20, adapterName: 'DropdownsConfigAdapter')
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
    this.tipoImpedimento,
  });

  @HiveField(0)
  final List<Tipo> tipoAbastecimento;

  @HiveField(1)
  final List<Tipo> tipoSitAgua;

  @HiveField(2)
  final List<Tipo> tipoSitEsgoto;

  @HiveField(3)
  final List<Tipo> tipoCliente;

  @HiveField(4)
  final List<Tipo> tipoCobertura;

  @HiveField(5)
  final List<Tipo> tipoConstrucao;

  @HiveField(6)
  final List<Tipo> tipoHabitacao;

  @HiveField(7)
  final List<Tipo> tipoCalcada;

  @HiveField(8)
  final List<Tipo> tipoRua;

  @HiveField(9)
  final List<Tipo> tipoPropriedade;

  @HiveField(10)
  final List<Estado> estados;

  @HiveField(11)
  final List<Tipo> tipoImpedimento;

  factory DropdownsConfig.fromJson(Map<String, dynamic> json) => DropdownsConfig(
    tipoAbastecimento: json['tipo_abastecimento'] == null ? null : List<Tipo>.from(json['tipo_abastecimento'].map((x) => Tipo.fromJson(x))),
    tipoSitAgua: json['tipo_sit_agua'] == null ? null : List<Tipo>.from(json['tipo_sit_agua'].map((x) => Tipo.fromJson(x))),
    tipoSitEsgoto: json['tipo_sit_esgoto'] == null ? null : List<Tipo>.from(json['tipo_sit_esgoto'].map((x) => Tipo.fromJson(x))),
    tipoCliente: json['tipo_cliente'] == null ? null : List<Tipo>.from(json['tipo_cliente'].map((x) => Tipo.fromJson(x))),
    tipoCobertura: json['tipo_cobertura'] == null ? null : List<Tipo>.from(json['tipo_cobertura'].map((x) => Tipo.fromJson(x))),
    tipoConstrucao: json['tipo_construcao'] == null ? null : List<Tipo>.from(json['tipo_construcao'].map((x) => Tipo.fromJson(x))),
    tipoHabitacao: json['tipo_habitacao'] == null ? null : List<Tipo>.from(json['tipo_habitacao'].map((x) => Tipo.fromJson(x))),
    tipoCalcada: json['tipo_calcada'] == null ? null : List<Tipo>.from(json['tipo_calcada'].map((x) => Tipo.fromJson(x))),
    tipoRua: json['tipo_rua'] == null ? null : List<Tipo>.from(json['tipo_rua'].map((x) => Tipo.fromJson(x))),
    tipoPropriedade: json['tipo_propriedade'] == null ? null : List<Tipo>.from(json['tipo_propriedade'].map((x) => Tipo.fromJson(x))),
    estados: json['estados'] == null ? null : List<Estado>.from(json['estados'].map((x) => Estado.fromJson(x))),
    tipoImpedimento: json['tipo_impedimento'] == null ? null : List<Tipo>.from(json['tipo_impedimento'].map((x) => Tipo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'tipo_abastecimento': tipoAbastecimento == null ? null : List<dynamic>.from(tipoAbastecimento.map((x) => x.toJson())),
    'tipo_sit_agua': tipoSitAgua == null ? null : List<dynamic>.from(tipoSitAgua.map((x) => x.toJson())),
    'tipo_sit_esgoto': tipoSitEsgoto == null ? null : List<dynamic>.from(tipoSitEsgoto.map((x) => x.toJson())),
    'tipo_cliente': tipoCliente == null ? null : List<dynamic>.from(tipoCliente.map((x) => x.toJson())),
    'tipo_cobertura': tipoCobertura == null ? null : List<dynamic>.from(tipoCobertura.map((x) => x.toJson())),
    'tipo_construcao': tipoConstrucao == null ? null : List<dynamic>.from(tipoConstrucao.map((x) => x.toJson())),
    'tipo_habitacao': tipoHabitacao == null ? null : List<dynamic>.from(tipoHabitacao.map((x) => x.toJson())),
    'tipo_calcada': tipoCalcada == null ? null : List<dynamic>.from(tipoCalcada.map((x) => x.toJson())),
    'tipo_rua': tipoRua == null ? null : List<dynamic>.from(tipoRua.map((x) => x.toJson())),
    'tipo_propriedade': tipoPropriedade == null ? null : List<dynamic>.from(tipoPropriedade.map((x) => x.toJson())),
    'estados': estados == null ? null : List<dynamic>.from(estados.map((x) => x.toJson())),
    'tipo_impedimento': tipoImpedimento == null ? null : List<dynamic>.from(tipoImpedimento.map((x) => x.toJson())),
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
    tipoImpedimento,
  ];
}

@HiveType(typeId: 21, adapterName: 'EstadoAdapter')
class Estado extends Equatable {
  const Estado({
    this.id,
    this.sigla,
    this.descricao,
  });

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String sigla;

  @HiveField(2)
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

@HiveType(typeId: 22, adapterName: 'TipoAdapter')
class Tipo extends Equatable {
  const Tipo({
    this.id,
    this.descricao,
  });

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String descricao;

  factory Tipo.fromJson(dynamic json) {
    if (json is Tipo) return json;
    return Tipo(
      id: json['id'] == null ? null : json['id'],
      descricao: json['descricao'] == null ? null : json['descricao'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id == null ? null : id,
    'descricao': descricao == null ? null : descricao,
  };

  @override
  List<Object> get props => [id];
}
