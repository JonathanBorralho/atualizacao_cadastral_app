import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/dropdowns_config.dart';
import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/imovel.dart';
import 'package:atualizacao_cadastral_app/app/shared/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dropdown_input_field.dart';

class CaracteristicasStepForm extends StatelessWidget {
  const CaracteristicasStepForm();

  @override
  Widget build(BuildContext context) {
    final Caracteristicas caracteristicas = context.read<Imovel>().caracteristicas;
    final DropdownsConfig config = context.read<DropdownsConfig>();
    return FocusScope(
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              CustomInputField(
                formControlName: 'caracteristicas.area',
                labelText: 'Área',
                textInputAction: TextInputAction.done,
                oldValue: caracteristicas?.area,
              ),
              DropdownInputField(
                labelText: 'Calçada',
                formControlName: 'caracteristicas.calcada',
                items: config.tipoCalcada.map(tipoToDropdownMenuItem).toList(),
                oldValue: caracteristicas?.calcada,
              ),
              DropdownInputField(
                labelText: 'Rua',
                formControlName: 'caracteristicas.tipo_rua',
                items: config.tipoRua.map(tipoToDropdownMenuItem).toList(),
                oldValue: caracteristicas?.rua,
              ),
              DropdownInputField(
                labelText: 'Abastecimento',
                formControlName: 'caracteristicas.abastecimento',
                items: config.tipoAbastecimento.map(tipoToDropdownMenuItem).toList(),
                oldValue: caracteristicas?.abastecimento,
              ),
              DropdownInputField(
                labelText: 'Água',
                formControlName: 'caracteristicas.agua',
                items: config.tipoSitAgua.map(tipoToDropdownMenuItem).toList(),
                oldValue: caracteristicas?.agua,
              ),
              DropdownInputField(
                labelText: 'Esgoto',
                formControlName: 'caracteristicas.esgoto',
                items: config.tipoSitEsgoto.map(tipoToDropdownMenuItem).toList(),
                oldValue: caracteristicas?.esgoto,
              ),
              DropdownInputField(
                labelText: 'Habitação',
                formControlName: 'caracteristicas.habitacao',
                items: config.tipoHabitacao.map(tipoToDropdownMenuItem).toList(),
                oldValue: caracteristicas?.habitacao,
              ),
              DropdownInputField(
                labelText: 'Propriedade',
                formControlName: 'caracteristicas.propriedade',
                items: config.tipoPropriedade.map(tipoToDropdownMenuItem).toList(),
                oldValue: caracteristicas?.propriedade,
              ),
              DropdownInputField(
                labelText: 'Construção',
                formControlName: 'caracteristicas.construcao',
                items: config.tipoConstrucao.map(tipoToDropdownMenuItem).toList(),
                oldValue: caracteristicas?.construcao,
              ),
              DropdownInputField(
                labelText: 'Cobertura',
                formControlName: 'caracteristicas.cobertura',
                items: config.tipoCobertura.map(tipoToDropdownMenuItem).toList(),
                oldValue: caracteristicas?.cobertura,
              ),
            ],
          );
        },
      ),
    );
  }

  /* DropdownMenuItem<String> toDropdownMenuItem(String value) {
    return DropdownMenuItem<String>(
      child: Text(value),
      value: value,
    );
  } */

  DropdownMenuItem<Tipo> tipoToDropdownMenuItem(Tipo value) {
    final String id = '${value.id}';
    final String text = '${id.padLeft(2, '0')} - ${value.descricao}';
    return DropdownMenuItem<Tipo>(
      child: Text(text),
      value: value,
    );
  }
}
