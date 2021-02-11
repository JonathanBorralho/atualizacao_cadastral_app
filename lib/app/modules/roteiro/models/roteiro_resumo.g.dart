// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roteiro_resumo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoteiroResumoAdapter extends TypeAdapter<RoteiroResumo> {
  @override
  final int typeId = 5;

  @override
  RoteiroResumo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RoteiroResumo(
      id: fields[0] as int,
      usuario: fields[1] as Usuario,
      cadastrante: fields[2] as Usuario,
      status: fields[3] as String,
      criadoEm: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, RoteiroResumo obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.usuario)
      ..writeByte(2)
      ..write(obj.cadastrante)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.criadoEm);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoteiroResumoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UsuarioAdapter extends TypeAdapter<Usuario> {
  @override
  final int typeId = 6;

  @override
  Usuario read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Usuario(
      id: fields[0] as int,
      matricula: fields[1] as String,
      nome: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Usuario obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.matricula)
      ..writeByte(2)
      ..write(obj.nome);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsuarioAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
