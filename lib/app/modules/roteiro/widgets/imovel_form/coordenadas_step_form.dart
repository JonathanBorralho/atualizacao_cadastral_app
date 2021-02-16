import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/imovel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CoordenadasStepForm extends StatelessWidget {
  const CoordenadasStepForm();

  @override
  Widget build(BuildContext context) {
    final Coordenadas coordenadas = context.read<Imovel>().coordenadas;
    return FocusScope(
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              CoordenadaInputField(
                formControlName: 'coordenadas.latitude',
                labelText: 'X:',
                oldValue: coordenadas?.latitude,
              ),
              CoordenadaInputField(
                formControlName: 'coordenadas.longitude',
                labelText: 'Y:',
                oldValue: coordenadas?.longitude,
              ),
            ],
          );
        },
      ),
    );
  }
}

class CoordenadaInputField extends StatelessWidget {
  final String formControlName;
  final String labelText;
  final dynamic oldValue;

  const CoordenadaInputField({
    Key key,
    this.formControlName,
    this.labelText,
    this.oldValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FormGroup formGroup = ReactiveForm.of(context);
    final FormControl<double> formControl = formGroup.control(formControlName);
    return StreamBuilder<double>(
      initialData: formControl.value,
      stream: formControl.valueChanges,
      builder: (context, snapshot) {
        return InputDecorator(
          isEmpty: !snapshot.hasData,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: _labelStyle(formControl, oldValue),
          ),
          child: Text(
            snapshot.data != null ? snapshot.data.toString() : '',
            style: const TextStyle(fontSize: 16),
          ),
        );
      },
    );
  }

  TextStyle _labelStyle(FormControl formControl, dynamic original) {
    if (!formControl.dirty) return null;
    return original != formControl.value
        ? const TextStyle(color: Colors.orange)
        : null;
  }
}
