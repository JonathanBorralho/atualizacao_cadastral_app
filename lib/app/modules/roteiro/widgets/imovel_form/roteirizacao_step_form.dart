import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:atualizacao_cadastral_app/app/shared/widgets/custom_input_field.dart';
import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/imovel.dart';

class RoteirizacaoStepForm extends StatelessWidget {
  const RoteirizacaoStepForm();

  @override
  Widget build(BuildContext context) {
    final Roteirizacao roteirizacao = context.read<Imovel>().roteirizacao;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              flex: 5,
              child: ReactiveTextField(
                readOnly: true,
                formControlName: 'roteirizacao.matricula',
                decoration: const InputDecoration(
                  labelText: 'Matrícula',
                ),
                textInputAction: TextInputAction.next,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 3,
              child: CustomInputField(
                labelText: 'Visita',
                formControlName: 'roteirizacao.visita',
                oldValue: roteirizacao?.visita,
                nextFocus: 'roteirizacao.localidade',
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CustomInputField(
                formControlName: 'roteirizacao.localidade',
                labelText: 'Localidade',
                oldValue: roteirizacao?.localidade,
                nextFocus: 'roteirizacao.setor',
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CustomInputField(
                formControlName: 'roteirizacao.setor',
                labelText: 'Setor',
                oldValue: roteirizacao?.setor,
                nextFocus: 'roteirizacao.quadra',
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CustomInputField(
                labelText: 'Quadra',
                formControlName: 'roteirizacao.quadra',
                oldValue: roteirizacao?.quadra,
                nextFocus: 'roteirizacao.rota',
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CustomInputField(
                labelText: 'Rota',
                formControlName: 'roteirizacao.rota',
                oldValue: roteirizacao?.rota,
                nextFocus: 'roteirizacao.sequencia',
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CustomInputField(
                labelText: 'Sequência',
                formControlName: 'roteirizacao.sequencia',
                oldValue: roteirizacao?.sequencia,
                nextFocus: 'roteirizacao.sublote',
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CustomInputField(
                labelText: 'Sublote',
                formControlName: 'roteirizacao.sublote',
                oldValue: roteirizacao?.sublote,
                nextFocus: 'roteirizacao.testada',
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CustomInputField(
                labelText: 'Testada',
                formControlName: 'roteirizacao.testada',
                oldValue: roteirizacao?.testada,
                textInputAction: TextInputAction.done,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
