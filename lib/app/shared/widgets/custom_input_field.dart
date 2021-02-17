import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomInputField extends StatelessWidget {
  final String labelText;
  final String formControlName;
  final String nextFocus;
  final dynamic oldValue;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter> inputFormatters;

  const CustomInputField({
    Key key,
    this.labelText,
    @required this.formControlName,
    this.nextFocus,
    this.oldValue,
    this.keyboardType = TextInputType.number,
    this.textInputAction = TextInputAction.next,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FormGroup form = ReactiveForm.of(context);
    final FormControl formControl = form.control(formControlName);
    return StreamBuilder(
      stream: formControl.statusChanged,
      builder: (context, snapshot) {
        return ReactiveTextField(
          formControl: formControl,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: _labelStyle(formControl, oldValue),
          ),
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onSubmitted: nextFocus != null ? () => form.focus(nextFocus) : null,
          inputFormatters: inputFormatters,
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
