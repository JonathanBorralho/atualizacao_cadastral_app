import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:atualizacao_cadastral_app/app/shared/widgets/custom_input_field.dart';
import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/imovel.dart';

class EnderecoStepForm extends StatelessWidget {
  const EnderecoStepForm();

  @override
  Widget build(BuildContext context) {
    final Endereco endereco = context.read<Imovel>().endereco;
    return FocusScope(
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              CustomInputField(
                formControlName: 'endereco.logradouro',
                labelText: 'Logradouro',
                oldValue: endereco?.logradouro,
                keyboardType: TextInputType.streetAddress,
                nextFocus: 'endereco.cep',
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: CustomInputField(
                      formControlName: 'endereco.cep',
                      labelText: 'CEP',
                      oldValue: endereco?.cep,
                      textInputAction: TextInputAction.done,
                      inputFormatters: [
                        TextInputMask(
                          mask: '99999-999',
                          reverse: false,
                        ),
                      ],
                    ),
                  ),
                  /* Expanded(
                    flex: 1,
                    child: EnderecoFinder(),
                  ), */
                ],
              ),
              CustomInputField(
                formControlName: 'endereco.bairro',
                labelText: 'Bairro',
                oldValue: endereco?.bairro,
                keyboardType: TextInputType.text,
                nextFocus: 'endereco.numero',
              ),
              CustomInputField(
                formControlName: 'endereco.numero',
                labelText: 'Número',
                oldValue: endereco?.numero,
                nextFocus: 'endereco.complemento',
              ),
              CustomInputField(
                formControlName: 'endereco.complemento',
                labelText: 'Complemento',
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                oldValue: endereco?.complemento,
              ),
            ],
          );
        },
      ),
    );
  }
}
