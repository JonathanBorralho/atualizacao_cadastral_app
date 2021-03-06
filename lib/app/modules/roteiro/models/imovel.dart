import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import 'package:atualizacao_cadastral_app/app/shared/util/data_util.dart';
import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/dropdowns_config.dart';

part 'imovel.g.dart';

@HiveType(typeId: 10, adapterName: 'ImovelAdapter')
class Imovel extends HiveObject with EquatableMixin {
  Imovel({
    this.id,
    this.roteiroId,
    this.roteirizacao,
    this.endereco,
    this.cliente,
    this.subcategorias,
    this.caracteristicas,
    this.conclusao,
    this.hidrometro,
    this.coordenadas,
    this.observacao,
    this.impedimento,
    this.modificadoEm,
  });

  @HiveField(0)
  final int id;

  @HiveField(1)
  final int roteiroId;

  @HiveField(2)
  final Roteirizacao roteirizacao;

  @HiveField(3)
  final Endereco endereco;

  @HiveField(4)
  final Cliente cliente;

  @HiveField(5)
  final Subcategorias subcategorias;

  @HiveField(6)
  final Caracteristicas caracteristicas;

  @HiveField(7)
  final Conclusao conclusao;

  @HiveField(8)
  final Hidrometro hidrometro;

  @HiveField(9)
  final Coordenadas coordenadas;

  @HiveField(10)
  final String observacao;

  @HiveField(11)
  final Tipo impedimento;

  @HiveField(12)
  final DateTime modificadoEm;

  factory Imovel.fromJson(Map<String, dynamic> json) => Imovel(
    id: json['id'] == null ? null : json['id'],
    roteiroId: json['roteiro_id'] == null ? null : json['roteiro_id'],
    roteirizacao: json['roteirizacao'] == null ? null : Roteirizacao.fromJson(json['roteirizacao']),
    endereco: json['endereco'] == null ? null : Endereco.fromJson(json['endereco']),
    cliente: json['cliente'] == null ? null : Cliente.fromJson(json['cliente']),
    subcategorias: json['subcategorias'] == null ? null : Subcategorias.fromJson(json['subcategorias']),
    caracteristicas: json['caracteristicas'] == null ? null : Caracteristicas.fromJson(json['caracteristicas']),
    conclusao: json['conclusao'] == null ? null : Conclusao.fromJson(json['conclusao']),
    hidrometro: json['hidrometro'] == null ? null : Hidrometro.fromJson(json['hidrometro']),
    coordenadas: json['coordenadas'] == null ? null : Coordenadas.fromJson(json['coordenadas']),
    observacao: json['observacao'] == null ? null : json['observacao'],
    impedimento: json['impedimento'] == null ? null : Tipo.fromJson(json['impedimento']),
    modificadoEm: json['modificado_em'] == null ? null : DateUtil.parse(json['modificado_em']),
  );

  Map<String, dynamic> toJson() => {
    'id': id == null ? null : id,
    'roteiro_id': roteiroId == null ? null : roteiroId,
    'roteirizacao': roteirizacao == null ? null : roteirizacao.toJson(),
    'endereco': endereco == null ? null : endereco.toJson(),
    'cliente': cliente == null ? null : cliente.toJson(),
    'subcategorias': subcategorias == null ? null : subcategorias.toJson(),
    'caracteristicas': caracteristicas == null ? null : caracteristicas.toJson(),
    'conclusao': conclusao == null ? null : conclusao.toJson(),
    'hidrometro': hidrometro == null ? null : hidrometro.toJson(),
    'coordenadas': coordenadas == null ? null : coordenadas.toJson(),
    'observacao': observacao == null ? null : observacao,
    'impedimento': impedimento == null ? null : impedimento,
    'modificado_em': modificadoEm == null ? null : '${modificadoEm.year.toString().padLeft(4, '0')}-${modificadoEm.month.toString().padLeft(2, '0')}-${modificadoEm.day.toString().padLeft(2, '0')}',
  };

  Imovel copyWith({
    int id,
    int roteiroId,
    Roteirizacao roteirizacao,
    Endereco endereco,
    Cliente cliente,
    Subcategorias subcategorias,
    Caracteristicas caracteristicas,
    Conclusao conclusao,
    Hidrometro hidrometro,
    Coordenadas coordenadas,
    String observacao,
    String impedimento,
    DateTime modificadoEm,
  }) {
    return Imovel(
      id: id ?? this.id,
      roteiroId: roteiroId ?? this.roteiroId,
      roteirizacao: roteirizacao ?? this.roteirizacao,
      endereco: endereco ?? this.endereco,
      cliente: cliente ?? this.cliente,
      subcategorias: subcategorias ?? this.subcategorias,
      caracteristicas: caracteristicas ?? this.caracteristicas,
      conclusao: conclusao ?? this.conclusao,
      hidrometro: hidrometro ?? this.hidrometro,
      coordenadas: coordenadas ?? this.coordenadas,
      observacao: observacao ?? this.observacao,
      impedimento: impedimento ?? this.impedimento,
      modificadoEm: modificadoEm ?? this.modificadoEm,
    );
  }

  @override
  List<Object> get props => [
    this.id,
    this.roteiroId,
    this.roteirizacao,
    this.endereco,
    this.cliente,
    this.subcategorias,
    this.caracteristicas,
    this.conclusao,
    this.hidrometro,
    this.coordenadas,
    this.observacao,
    this.impedimento,
    this.modificadoEm,
  ];
}

@HiveType(typeId: 11, adapterName: 'EnderecoAdapter')
class Endereco with EquatableMixin {
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

  @override
  List<Object> get props => [
    this.logradouro,
    this.cep,
    this.bairro,
    this.numero,
    this.complemento,
  ];
}

@HiveType(typeId: 12, adapterName: 'RoteirizacaoAdapter')
class Roteirizacao with EquatableMixin {
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

  Roteirizacao copyWith({
    int matricula,
    int visita,
    int localidade,
    int setor,
    int quadra,
    int rota,
    int sequencia,
    int sublote,
    int testada,
  }) {
    return Roteirizacao(
      matricula: matricula ?? this.matricula,
      visita: visita ?? this.visita,
      localidade: localidade ?? this.localidade,
      setor: setor ?? this.setor,
      quadra: quadra ?? this.quadra,
      rota: rota ?? this.rota,
      sequencia: sequencia ?? this.sequencia,
      sublote: sublote ?? this.sublote,
      testada: testada ?? this.testada,
    );
  }

  @override
  List<Object> get props => [
    this.matricula,
    this.visita,
    this.localidade,
    this.setor,
    this.quadra,
    this.rota,
    this.sequencia,
    this.sublote,
    this.testada,
  ];
}

@HiveType(typeId: 13, adapterName: 'ClienteAdapter')
class Cliente with EquatableMixin {
  Cliente({
    this.codigo,
    this.nome,
    this.cpf,
    this.rg,
    this.uf,
    this.email,
    this.sexo,
    this.orgExp,
    this.dataEmissao,
    this.tipoCliente,
    this.tipoPessoa,
    this.dataNascimento,
    this.nomeMae,
    this.telDdd,
    this.telNum,
  });

  @HiveField(0)
  final int codigo;

  @HiveField(1)
  final String nome;

  @HiveField(2)
  final String cpf;

  @HiveField(3)
  final String rg;

  @HiveField(4)
  final String uf;

  @HiveField(5)
  final String email;

  @HiveField(6)
  final String sexo;

  @HiveField(7)
  final String orgExp;

  @HiveField(8)
  final DateTime dataEmissao;

  @HiveField(9)
  final String tipoCliente;

  @HiveField(10)
  final String tipoPessoa;

  @HiveField(11)
  final DateTime dataNascimento;

  @HiveField(12)
  final String nomeMae;

  @HiveField(13)
  final String telDdd;

  @HiveField(14)
  final String telNum;

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
    codigo: json['codigo'] == null ? null : json['codigo'],
    nome: json['nome'] == null ? null : json['nome'],
    cpf: json['cpf'] == null ? null : json['cpf'],
    rg: json['rg'] == null ? null : json['rg'],
    uf: json['uf'] == null ? null : json['uf'],
    email: json['email'] == null ? null : json['email'],
    sexo: json['sexo'] == null ? null : json['sexo'],
    orgExp: json['org_exp'] == null ? null : json['org_exp'],
    dataEmissao: json['data_emissao'] == null ? null : DateUtil.parse(json['data_emissao']),
    tipoCliente: json['tipo_cliente'] == null ? null : json['tipo_cliente'],
    tipoPessoa: json['tipo_pessoa'] == null ? null : json['tipo_pessoa'],
    dataNascimento: json['data_nascimento'] == null ? null : DateUtil.parse(json['data_nascimento']),
    nomeMae: json['nome_mae'] == null ? null : json['nome_mae'],
    telDdd: json['tel_ddd'] == null ? null : json['tel_ddd'],
    telNum: json['tel_num'] == null ? null : json['tel_num'],
  );

  Map<String, dynamic> toJson() => {
    'codigo': codigo == null ? null : codigo,
    'nome': nome == null ? null : nome,
    'cpf': cpf == null ? null : cpf,
    'rg': rg == null ? null : rg,
    'uf': uf == null ? null : uf,
    'email': email == null ? null : email,
    'sexo': sexo == null ? null : sexo,
    'org_exp': orgExp == null ? null : orgExp,
    'data_emissao': dataEmissao == null ? null : '${dataEmissao.year.toString().padLeft(4, '0')}-${dataEmissao.month.toString().padLeft(2, '0')}-${dataEmissao.day.toString().padLeft(2, '0')}',
    'tipo_cliente': tipoCliente == null ? null : tipoCliente,
    'tipo_pessoa': tipoPessoa == null ? null : tipoPessoa,
    'data_nascimento': dataNascimento == null ? null : '${dataNascimento.year.toString().padLeft(4, '0')}-${dataNascimento.month.toString().padLeft(2, '0')}-${dataNascimento.day.toString().padLeft(2, '0')}',
    'nome_mae': nomeMae == null ? null : nomeMae,
    'tel_ddd': telDdd == null ? null : telDdd,
    'tel_num': telNum == null ? null : telNum,
  };

  @override
  List<Object> get props => [
    this.codigo,
    this.nome,
    this.cpf,
    this.rg,
    this.uf,
    this.email,
    this.sexo,
    this.orgExp,
    this.dataEmissao,
    this.tipoCliente,
    this.tipoPessoa,
    this.dataNascimento,
    this.nomeMae,
    this.telDdd,
    this.telNum,
  ];
}

@HiveType(typeId: 14, adapterName: 'CaracteristicasAdapter')
class Caracteristicas with EquatableMixin {
  Caracteristicas({
    this.area,
    this.calcada,
    this.rua,
    this.abastecimento,
    this.agua,
    this.esgoto,
    this.habitacao,
    this.propriedade,
    this.construcao,
    this.cobertura,
  });

  @HiveField(0)
  final int area;

  @HiveField(1)
  final Tipo calcada;

  @HiveField(2)
  final Tipo rua;

  @HiveField(3)
  final Tipo abastecimento;

  @HiveField(4)
  final Tipo agua;

  @HiveField(5)
  final Tipo esgoto;

  @HiveField(6)
  final Tipo habitacao;

  @HiveField(7)
  final Tipo propriedade;

  @HiveField(8)
  final Tipo construcao;

  @HiveField(9)
  final Tipo cobertura;

  factory Caracteristicas.fromJson(Map<String, dynamic> json) => Caracteristicas(
    area: json['area'] == null ? null : json['area'],
    calcada: json['calcada'] == null ? null : Tipo.fromJson(json['calcada']),
    rua: json['tipo_rua'] == null ? null : Tipo.fromJson(json['tipo_rua']),
    abastecimento: json['abastecimento'] == null ? null : Tipo.fromJson(json['abastecimento']),
    agua: json['agua'] == null ? null : Tipo.fromJson(json['agua']),
    esgoto: json['esgoto'] == null ? null : Tipo.fromJson(json['esgoto']),
    habitacao: json['habitacao'] == null ? null : Tipo.fromJson(json['habitacao']),
    propriedade: json['propriedade'] == null ? null : Tipo.fromJson(json['propriedade']),
    construcao: json['construcao'] == null ? null : Tipo.fromJson(json['construcao']),
    cobertura: json['cobertura'] == null ? null : Tipo.fromJson(json['cobertura']),
  );

  Map<String, dynamic> toJson() => {
    'area': area == null ? null : area,
    'calcada': calcada == null ? null : calcada,
    'tipo_rua': rua == null ? null : rua,
    'abastecimento': abastecimento == null ? null : abastecimento,
    'agua': agua == null ? null : agua,
    'esgoto': esgoto == null ? null : esgoto,
    'habitacao': habitacao == null ? null : habitacao,
    'propriedade': propriedade == null ? null : propriedade,
    'construcao': construcao == null ? null : construcao,
    'cobertura': cobertura == null ? null : cobertura,
  };

  @override
  List<Object> get props => [
    this.area,
    this.calcada,
    this.rua,
    this.abastecimento,
    this.agua,
    this.esgoto,
    this.habitacao,
    this.propriedade,
    this.construcao,
    this.cobertura,
  ];
}

@HiveType(typeId: 15, adapterName: 'ConclusaoAdapter')
class Conclusao with EquatableMixin {
  Conclusao({
    this.moradores,
    this.ptAgua,
  });

  @HiveField(0)
  final int moradores;

  @HiveField(1)
  final int ptAgua;

  factory Conclusao.fromJson(Map<String, dynamic> json) => Conclusao(
    moradores: json['moradores'] == null ? null : json['moradores'],
    ptAgua: json['pt_agua'] == null ? null : json['pt_agua'],
  );

  Map<String, dynamic> toJson() => {
    'moradores': moradores == null ? null : moradores,
    'pt_agua': ptAgua == null ? null : ptAgua,
  };

  @override
  List<Object> get props => [
    this.moradores,
    this.ptAgua,
  ];
}

@HiveType(typeId: 16, adapterName: 'CoordenadasAdapter')
class Coordenadas with EquatableMixin {
  Coordenadas({
    this.longitude,
    this.latitude,
  });

  @HiveField(0)
  final double longitude;

  @HiveField(1)
  final double latitude;

  factory Coordenadas.fromJson(Map<String, dynamic> json) => Coordenadas(
    longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
    latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'longitude': longitude == null ? null : longitude,
    'latitude': latitude == null ? null : latitude,
  };

  @override
  List<Object> get props => [
    this.longitude,
    this.latitude,
  ];
}

@HiveType(typeId: 17, adapterName: 'HidrometroAdapter')
class Hidrometro with EquatableMixin {
  Hidrometro({
    this.hidrometro,
    this.leitura,
    this.dataLeitura,
    this.trocarHidrometro = false,
  });

  @HiveField(0)
  final String hidrometro;

  @HiveField(1)
  final int leitura;

  @HiveField(2)
  final DateTime dataLeitura;

  @HiveField(3)
  final bool trocarHidrometro;

  factory Hidrometro.fromJson(Map<String, dynamic> json) => Hidrometro(
    hidrometro: json['hidrometro'] == null ? null : json['hidrometro'],
    leitura: json['leitura'] == null ? null : json['leitura'],
    dataLeitura: json['data_leitura'] == null ? null : DateUtil.parse(json['data_leitura']),
    trocarHidrometro: json['trocar'] == null ? null : json['trocar'],
  );

  Map<String, dynamic> toJson() => {
    'hidrometro': hidrometro == null ? null : hidrometro,
    'leitura': leitura == null ? null : leitura,
    'data_leitura': dataLeitura == null ? null : '${dataLeitura.year.toString().padLeft(4, '0')}-${dataLeitura.month.toString().padLeft(2, '0')}-${dataLeitura.day.toString().padLeft(2, '0')}',
    'trocar': trocarHidrometro == null ? null : trocarHidrometro,
  };

  @override
  List<Object> get props => [
    this.hidrometro,
    this.leitura,
    this.dataLeitura,
    this.trocarHidrometro,
  ];
}

@HiveType(typeId: 18, adapterName: 'SubcategoriasAdapter')
class Subcategorias with EquatableMixin {
  Subcategorias({
    this.economias,
    this.cat1,
    this.subcat1,
    this.cat2,
  });

  @HiveField(0)
  final int economias;

  @HiveField(1)
  final String cat1;

  @HiveField(2)
  final String subcat1;

  @HiveField(3)
  final String cat2;

  factory Subcategorias.fromJson(Map<String, dynamic> json) => Subcategorias(
    economias: json['economias'] == null ? null : json['economias'],
    cat1: json['cat_1'] == null ? null : json['cat_1'],
    subcat1: json['subcat_1'] == null ? null : json['subcat_1'],
    cat2: json['cat_2'] == null ? null : json['cat_2'],
  );

  Map<String, dynamic> toJson() => {
    'economias': economias == null ? null : economias,
    'cat_1': cat1 == null ? null : cat1,
    'subcat_1': subcat1 == null ? null : subcat1,
    'cat_2': cat2 == null ? null : cat2,
  };

  @override
  List<Object> get props => [
    this.economias,
    this.cat1,
    this.subcat1,
    this.cat2,
  ];
}
