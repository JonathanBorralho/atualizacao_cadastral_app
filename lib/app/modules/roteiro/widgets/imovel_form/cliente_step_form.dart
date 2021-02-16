import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/dropdowns_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:easy_mask/easy_mask.dart';

import 'package:atualizacao_cadastral_app/app/shared/widgets/custom_input_field.dart';
import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/imovel.dart';

import 'cliente_search_field.dart';
import 'data_picker_field.dart';
import 'dropdown_input_field.dart';

class ClienteStepForm extends StatelessWidget {
  const ClienteStepForm();

  static final List<String> tiposPessoa = ['FISICA', 'JURIDICA'];
  static final List<String> sexos = ['M', 'F'];
  @override
  Widget build(BuildContext context) {
    final FormGroup form = ReactiveForm.of(context);
    final Cliente cliente = context.read<Imovel>().cliente;
    final DropdownsConfig config = context.read<DropdownsConfig>();
    return FocusScope(
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              /* ReactiveCheckboxListTile(
                dense: true,
                title: const Text('TROCAR TITULARIDADE'),
                formControlName: 'cliente.trocar_titularidade',
                controlAffinity: ListTileControlAffinity.leading,
              ), */
              ReactiveTextField(
                decoration: const InputDecoration(labelText: 'Código'),
                formControlName: 'cliente.codigo',
                onSubmitted: () => form.focus('cliente.nome'),
              ),
              CustomInputField(
                labelText: 'Nome',
                formControlName: 'cliente.nome',
                textInputAction: TextInputAction.done,
                oldValue: cliente?.nome,
                keyboardType: TextInputType.name,
              ),
              DropdownInputField(
                labelText: 'Tipo de Pessoa',
                formControlName: 'cliente.tipo_pessoa',
                items: tiposPessoa.map(toDropdownMenuItem).toList(),
                oldValue: cliente?.tipoPessoa,
              ),
              ClienteSearchField(),
              CustomInputField(
                formControlName: 'cliente.cpf',
                labelText: 'CPF',
                oldValue: cliente?.cpf,
                inputFormatters: [
                  TextInputMask(
                    mask: '999.999.999-99',
                    reverse: false,
                  ),
                ],
              ),
              CustomInputField(
                formControlName: 'cliente.rg',
                labelText: 'RG',
                textInputAction: TextInputAction.done,
                oldValue: cliente?.rg,
              ),
              DatePickerField(
                labelText: 'Emissão',
                formControlName: 'cliente.data_emissao',
                initialDate: cliente.dataEmissao,
              ),
              Row(
                children: [
                  Expanded(
                    child: ReactiveTextField(
                      decoration: const InputDecoration(labelText: 'Org. Exp.'),
                      formControlName: 'cliente.org_exp',
                      textInputAction: TextInputAction.next,
                      onSubmitted: () => form.focus('cliente.estado'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: DropdownInputField(
                      labelText: 'Estado',
                      formControlName: 'cliente.uf',
                      items: config.estados.map(estadosToDropdownMenuItem).toList(),
                      oldValue: cliente?.uf,
                    ),
                  ),
                ],
              ),
              DropdownInputField(
                labelText: 'Sexo',
                formControlName: 'cliente.sexo',
                items: sexos.map(toDropdownMenuItem).toList(),
                oldValue: cliente?.sexo,
              ),
              DatePickerField(
                labelText: 'Data de Nascimento',
                formControlName: 'cliente.data_nascimento',
                initialDate: cliente.dataNascimento,
              ),
              CustomInputField(
                formControlName: 'cliente.nome_mae',
                labelText: 'Nome da Mãe',
                keyboardType: TextInputType.name,
                oldValue: cliente?.nomeMae,
                nextFocus: 'cliente.tel_ddd',
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CustomInputField(
                      formControlName: 'cliente.tel_ddd',
                      labelText: 'DDD',
                      oldValue: cliente?.telDdd,
                      inputFormatters: [TextInputMask(mask: '99')],
                      nextFocus: 'cliente.tel_num',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 5,
                    child: CustomInputField(
                      formControlName: 'cliente.tel_num',
                      labelText: 'Telefone',
                      oldValue: cliente?.telNum,
                      nextFocus: 'cliente.email',
                      inputFormatters: [
                        TextInputMask(
                          mask: ['9999-9999', '99999-9999'],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              CustomInputField(
                formControlName: 'cliente.email',
                labelText: 'E-mail',
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                oldValue: cliente?.email,
              )
            ],
          );
        },
      ),
    );
  }

  DropdownMenuItem<String> toDropdownMenuItem(String value) {
    return DropdownMenuItem<String>(
      child: Text(value),
      value: value,
    );
  }

  DropdownMenuItem<String> estadosToDropdownMenuItem(Estado estado) {
    return DropdownMenuItem<String>(
      child: Text(estado.sigla),
      value: estado.sigla,
    );
  }
}
