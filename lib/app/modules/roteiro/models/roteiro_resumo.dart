import 'package:hive/hive.dart';

part 'roteiro_resumo.g.dart';

@HiveType(typeId: 5, adapterName: 'RoteiroResumoAdapter')
class RoteiroResumo extends HiveObject {
  RoteiroResumo({
    this.id,
    this.usuario,
    this.cadastrante,
    this.status,
    this.criadoEm,
  });

  @HiveField(0)
  final int id;

  @HiveField(1)
  final Usuario usuario;

  @HiveField(2)
  final Usuario cadastrante;

  @HiveField(3)
  final String status;

  @HiveField(4)
  final DateTime criadoEm;

  factory RoteiroResumo.fromJson(Map<String, dynamic> json) => RoteiroResumo(
    id: json['id'] == null ? null : json['id'],
    usuario: json['usuario'] == null ? null : Usuario.fromJson(json['usuario']),
    cadastrante: json['cadastrante'] == null ? null : Usuario.fromJson(json['cadastrante']),
    status: json['status'] == null ? null : json['status'],
    criadoEm: json['criado_em'] == null ? null : DateTime.parse(json['criado_em']),
  );

  Map<String, dynamic> toJson() => {
    'id': id == null ? null : id,
    'usuario': usuario == null ? null : usuario.toJson(),
    'cadastrante': cadastrante == null ? null : cadastrante.toJson(),
    'status': status == null ? null : status,
    'criado_em': criadoEm == null ? null : '${criadoEm.year.toString().padLeft(4, '0')}-${criadoEm.month.toString().padLeft(2, '0')}-${criadoEm.day.toString().padLeft(2, '0')}',
  };
}

@HiveType(typeId: 6, adapterName: 'UsuarioAdapter')
class Usuario {
  Usuario({
    this.id,
    this.matricula,
    this.nome,
  });

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String matricula;

  @HiveField(2)
  final String nome;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
    id: json['id'] == null ? null : json['id'],
    matricula: json['matricula'] == null ? null : json['matricula'],
    nome: json['nome'] == null ? null : json['nome'],
  );

  Map<String, dynamic> toJson() => {
    'id': id == null ? null : id,
    'matricula': matricula == null ? null : matricula,
    'nome': nome == null ? null : nome,
  };
}
