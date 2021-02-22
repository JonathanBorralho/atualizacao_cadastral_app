import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/imovel.dart';
import 'package:atualizacao_cadastral_app/app/shared/widgets/custom_input_field.dart';

import 'dropdown_input_field.dart';

class SubcategoriaEconomiasStepForm extends StatelessWidget {
  const SubcategoriaEconomiasStepForm();

  static final List<String> categorias1 = [
    '01 - RESIDENCIAL',
    '02 - COMERCIAL',
    '03 - INDUSTRIAL',
    '04 - PUBLICA',
  ];
  static final List<String> subcategorias1 = [
    '01 - RESIDENCIAL',
    '07 - RES. POPULAR',
    '09 - ENT. FILANTROPICA',
  ];
  @override
  Widget build(BuildContext context) {
    final Subcategorias subcategorias = context.read<Imovel>().subcategorias;
    //final DropdownsConfig config = Provider.of<DropdownsConfig>(context);

    return FocusScope(
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              DropdownInputField(
                labelText: 'CAT 1',
                formControlName: 'subcategorias.cat_1',
                items: categorias1.map(toDropdownMenuItem).toList(),
                oldValue: subcategorias?.cat1,
              ),
              DropdownInputField(
                labelText: 'SUBCAT 1',
                formControlName: 'subcategorias.subcat_1',
                items: subcategorias1.map(toDropdownMenuItem).toList(),
                oldValue: subcategorias?.subcat1,
              ),
              CustomInputField(
                formControlName: 'subcategorias.economias',
                labelText: 'Economias 1',
                oldValue: subcategorias?.economias,
              ),
              DropdownInputField(
                labelText: 'CAT 2',
                formControlName: 'subcategorias.cat_2',
                items: categorias1.map(toDropdownMenuItem).toList(),
                oldValue: subcategorias?.cat2,
              ),
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

  /* DropdownMenuItem<String> tipoToDropdownMenuItem(Tipo value) {
    return DropdownMenuItem<String>(
      child: Text(value.descricao),
      value: value.descricao,
    );
  } */
}
