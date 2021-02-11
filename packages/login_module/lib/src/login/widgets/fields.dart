import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class MatriculaFormField extends StatelessWidget {
  const MatriculaFormField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      autofocus: true,
      formControlName: 'matricula',
      decoration: const InputDecoration(
        labelText: 'Matrícula',
        border: const OutlineInputBorder(),
      ),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validationMessages: (control) =>
          {ValidationMessage.required: 'Campo obrigatório'},
    );
  }
}

class SenhaFormField extends StatelessWidget {
  const SenhaFormField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      obscureText: true,
      formControlName: 'senha',
      decoration: const InputDecoration(
        labelText: 'Senha',
        border: const OutlineInputBorder(),
      ),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      validationMessages: (control) =>
          {ValidationMessage.required: 'Campo obrigatório'},
    );
  }
}
