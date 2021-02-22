// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imovel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImovelAdapter extends TypeAdapter<Imovel> {
  @override
  final int typeId = 10;

  @override
  Imovel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Imovel(
      id: fields[0] as int,
      roteiroId: fields[1] as int,
      roteirizacao: fields[2] as Roteirizacao,
      endereco: fields[3] as Endereco,
      cliente: fields[4] as Cliente,
      subcategorias: fields[5] as Subcategorias,
      caracteristicas: fields[6] as Caracteristicas,
      conclusao: fields[7] as Conclusao,
      hidrometro: fields[8] as Hidrometro,
      coordenadas: fields[9] as Coordenadas,
      observacao: fields[10] as String,
      impedimento: fields[11] as String,
      modificadoEm: fields[12] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Imovel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.roteiroId)
      ..writeByte(2)
      ..write(obj.roteirizacao)
      ..writeByte(3)
      ..write(obj.endereco)
      ..writeByte(4)
      ..write(obj.cliente)
      ..writeByte(5)
      ..write(obj.subcategorias)
      ..writeByte(6)
      ..write(obj.caracteristicas)
      ..writeByte(7)
      ..write(obj.conclusao)
      ..writeByte(8)
      ..write(obj.hidrometro)
      ..writeByte(9)
      ..write(obj.coordenadas)
      ..writeByte(10)
      ..write(obj.observacao)
      ..writeByte(11)
      ..write(obj.impedimento)
      ..writeByte(12)
      ..write(obj.modificadoEm);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImovelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EnderecoAdapter extends TypeAdapter<Endereco> {
  @override
  final int typeId = 11;

  @override
  Endereco read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Endereco(
      logradouro: fields[0] as String,
      cep: fields[1] as String,
      bairro: fields[2] as String,
      numero: fields[3] as String,
      complemento: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Endereco obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.logradouro)
      ..writeByte(1)
      ..write(obj.cep)
      ..writeByte(2)
      ..write(obj.bairro)
      ..writeByte(3)
      ..write(obj.numero)
      ..writeByte(4)
      ..write(obj.complemento);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnderecoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RoteirizacaoAdapter extends TypeAdapter<Roteirizacao> {
  @override
  final int typeId = 12;

  @override
  Roteirizacao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Roteirizacao(
      matricula: fields[0] as int,
      visita: fields[1] as int,
      localidade: fields[2] as int,
      setor: fields[3] as int,
      quadra: fields[4] as int,
      rota: fields[5] as int,
      sequencia: fields[6] as int,
      sublote: fields[7] as int,
      testada: fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Roteirizacao obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.matricula)
      ..writeByte(1)
      ..write(obj.visita)
      ..writeByte(2)
      ..write(obj.localidade)
      ..writeByte(3)
      ..write(obj.setor)
      ..writeByte(4)
      ..write(obj.quadra)
      ..writeByte(5)
      ..write(obj.rota)
      ..writeByte(6)
      ..write(obj.sequencia)
      ..writeByte(7)
      ..write(obj.sublote)
      ..writeByte(8)
      ..write(obj.testada);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoteirizacaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ClienteAdapter extends TypeAdapter<Cliente> {
  @override
  final int typeId = 13;

  @override
  Cliente read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cliente(
      codigo: fields[0] as int,
      nome: fields[1] as String,
      cpf: fields[2] as String,
      rg: fields[3] as String,
      uf: fields[4] as String,
      email: fields[5] as String,
      sexo: fields[6] as String,
      orgExp: fields[7] as String,
      dataEmissao: fields[8] as DateTime,
      tipoCliente: fields[9] as String,
      tipoPessoa: fields[10] as String,
      dataNascimento: fields[11] as DateTime,
      nomeMae: fields[12] as String,
      telDdd: fields[13] as String,
      telNum: fields[14] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Cliente obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.codigo)
      ..writeByte(1)
      ..write(obj.nome)
      ..writeByte(2)
      ..write(obj.cpf)
      ..writeByte(3)
      ..write(obj.rg)
      ..writeByte(4)
      ..write(obj.uf)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.sexo)
      ..writeByte(7)
      ..write(obj.orgExp)
      ..writeByte(8)
      ..write(obj.dataEmissao)
      ..writeByte(9)
      ..write(obj.tipoCliente)
      ..writeByte(10)
      ..write(obj.tipoPessoa)
      ..writeByte(11)
      ..write(obj.dataNascimento)
      ..writeByte(12)
      ..write(obj.nomeMae)
      ..writeByte(13)
      ..write(obj.telDdd)
      ..writeByte(14)
      ..write(obj.telNum);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClienteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CaracteristicasAdapter extends TypeAdapter<Caracteristicas> {
  @override
  final int typeId = 14;

  @override
  Caracteristicas read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Caracteristicas(
      area: fields[0] as int,
      calcada: fields[1] as String,
      rua: fields[2] as String,
      abastecimento: fields[3] as String,
      agua: fields[4] as String,
      esgoto: fields[5] as String,
      habitacao: fields[6] as String,
      propriedade: fields[7] as String,
      construcao: fields[8] as String,
      cobertura: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Caracteristicas obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.area)
      ..writeByte(1)
      ..write(obj.calcada)
      ..writeByte(2)
      ..write(obj.rua)
      ..writeByte(3)
      ..write(obj.abastecimento)
      ..writeByte(4)
      ..write(obj.agua)
      ..writeByte(5)
      ..write(obj.esgoto)
      ..writeByte(6)
      ..write(obj.habitacao)
      ..writeByte(7)
      ..write(obj.propriedade)
      ..writeByte(8)
      ..write(obj.construcao)
      ..writeByte(9)
      ..write(obj.cobertura);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CaracteristicasAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ConclusaoAdapter extends TypeAdapter<Conclusao> {
  @override
  final int typeId = 15;

  @override
  Conclusao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Conclusao(
      moradores: fields[0] as int,
      ptAgua: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Conclusao obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.moradores)
      ..writeByte(1)
      ..write(obj.ptAgua);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConclusaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CoordenadasAdapter extends TypeAdapter<Coordenadas> {
  @override
  final int typeId = 16;

  @override
  Coordenadas read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Coordenadas(
      longitude: fields[0] as double,
      latitude: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Coordenadas obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.longitude)
      ..writeByte(1)
      ..write(obj.latitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoordenadasAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HidrometroAdapter extends TypeAdapter<Hidrometro> {
  @override
  final int typeId = 17;

  @override
  Hidrometro read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Hidrometro(
      hidrometro: fields[0] as String,
      leitura: fields[1] as int,
      dataLeitura: fields[2] as DateTime,
      trocarHidrometro: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Hidrometro obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.hidrometro)
      ..writeByte(1)
      ..write(obj.leitura)
      ..writeByte(2)
      ..write(obj.dataLeitura)
      ..writeByte(3)
      ..write(obj.trocarHidrometro);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HidrometroAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubcategoriasAdapter extends TypeAdapter<Subcategorias> {
  @override
  final int typeId = 18;

  @override
  Subcategorias read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Subcategorias(
      economias: fields[0] as int,
      cat1: fields[1] as String,
      subcat1: fields[2] as String,
      cat2: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Subcategorias obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.economias)
      ..writeByte(1)
      ..write(obj.cat1)
      ..writeByte(2)
      ..write(obj.subcat1)
      ..writeByte(3)
      ..write(obj.cat2);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubcategoriasAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
