// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dropdowns_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DropdownsConfigAdapter extends TypeAdapter<DropdownsConfig> {
  @override
  final int typeId = 20;

  @override
  DropdownsConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DropdownsConfig(
      tipoAbastecimento: (fields[0] as List)?.cast<Tipo>(),
      tipoSitAgua: (fields[1] as List)?.cast<Tipo>(),
      tipoSitEsgoto: (fields[2] as List)?.cast<Tipo>(),
      tipoCliente: (fields[3] as List)?.cast<Tipo>(),
      tipoCobertura: (fields[4] as List)?.cast<Tipo>(),
      tipoConstrucao: (fields[5] as List)?.cast<Tipo>(),
      tipoHabitacao: (fields[6] as List)?.cast<Tipo>(),
      tipoCalcada: (fields[7] as List)?.cast<Tipo>(),
      tipoRua: (fields[8] as List)?.cast<Tipo>(),
      tipoPropriedade: (fields[9] as List)?.cast<Tipo>(),
      estados: (fields[10] as List)?.cast<Estado>(),
      tipoImpedimento: (fields[11] as List)?.cast<Tipo>(),
    );
  }

  @override
  void write(BinaryWriter writer, DropdownsConfig obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.tipoAbastecimento)
      ..writeByte(1)
      ..write(obj.tipoSitAgua)
      ..writeByte(2)
      ..write(obj.tipoSitEsgoto)
      ..writeByte(3)
      ..write(obj.tipoCliente)
      ..writeByte(4)
      ..write(obj.tipoCobertura)
      ..writeByte(5)
      ..write(obj.tipoConstrucao)
      ..writeByte(6)
      ..write(obj.tipoHabitacao)
      ..writeByte(7)
      ..write(obj.tipoCalcada)
      ..writeByte(8)
      ..write(obj.tipoRua)
      ..writeByte(9)
      ..write(obj.tipoPropriedade)
      ..writeByte(10)
      ..write(obj.estados)
      ..writeByte(11)
      ..write(obj.tipoImpedimento);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DropdownsConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EstadoAdapter extends TypeAdapter<Estado> {
  @override
  final int typeId = 21;

  @override
  Estado read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Estado(
      id: fields[0] as int,
      sigla: fields[1] as String,
      descricao: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Estado obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.sigla)
      ..writeByte(2)
      ..write(obj.descricao);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EstadoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TipoAdapter extends TypeAdapter<Tipo> {
  @override
  final int typeId = 22;

  @override
  Tipo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tipo(
      id: fields[0] as int,
      descricao: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Tipo obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.descricao);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TipoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
