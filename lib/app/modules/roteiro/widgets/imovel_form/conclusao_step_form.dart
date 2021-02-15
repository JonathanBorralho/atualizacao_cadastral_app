import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/imovel.dart';
import 'package:atualizacao_cadastral_app/app/shared/widgets/custom_input_field.dart';

class ConclusaoStepForm extends StatelessWidget {
  const ConclusaoStepForm();

  @override
  Widget build(BuildContext context) {
    final Conclusao conclusao = context.read<Imovel>().conclusao;
    return FocusScope(
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomInputField(
                      formControlName: 'conclusao.pt_agua',
                      labelText: 'PT. Água',
                      oldValue: conclusao.ptAgua,
                      nextFocus: 'conclusao.moradores',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomInputField(
                      formControlName: 'conclusao.moradores',
                      textInputAction: TextInputAction.done,
                      labelText: 'Moradores',
                      oldValue: conclusao.moradores,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
