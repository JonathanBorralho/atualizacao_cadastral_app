import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/imovel.dart';
import 'package:atualizacao_cadastral_app/app/shared/widgets/custom_input_field.dart';

import 'data_picker_field.dart';

class HidrometroStepForm extends StatelessWidget {
  const HidrometroStepForm();

  @override
  Widget build(BuildContext context) {
    final Hidrometro hidrometro = context.read<Imovel>().hidrometro;
    return FocusScope(
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              ReactiveCheckboxListTile(
                dense: true,
                title: const Text('TROCAR HIDRÔMETRO'),
                formControlName: 'hidrometro.trocar',
                controlAffinity: ListTileControlAffinity.leading,
              ),
              CustomInputField(
                formControlName: 'hidrometro.hidrometro',
                labelText: 'Hidrômetro',
                oldValue: hidrometro?.hidrometro,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
              ),
              CustomInputField(
                formControlName: 'hidrometro.leitura',
                labelText: 'Leitura',
                oldValue: hidrometro?.leitura,
                textInputAction: TextInputAction.done,
              ),
              DatePickerField(
                labelText: 'Data de Leitura',
                formControlName: 'hidrometro.data_leitura',
                initialDate: hidrometro.dataLeitura,
              ),
            ],
          );
        },
      ),
    );
  }
}
