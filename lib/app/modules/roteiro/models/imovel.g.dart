// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imovel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImovelAdapter extends TypeAdapter<Imovel> {
  @override
  final int typeId = 2;

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
    );
  }

  @override
  void write(BinaryWriter writer, Imovel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.roteiroId)
      ..writeByte(2)
      ..write(obj.roteirizacao)
      ..writeByte(3)
      ..write(obj.endereco);
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
  final int typeId = 3;

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
  final int typeId = 4;

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
