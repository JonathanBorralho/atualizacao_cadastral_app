import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DropdownInputField<T> extends StatelessWidget {
  final String labelText;
  final String formControlName;
  final dynamic oldValue;
  final List<DropdownMenuItem<T>> items;
  final List<Widget> Function(BuildContext) selectedItemBuilder;

  const DropdownInputField({
    Key key,
    this.labelText,
    @required this.formControlName,
    this.oldValue,
    this.items,
    this.selectedItemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FormGroup form = ReactiveForm.of(context);
    final FormControl formControl = form.control(formControlName);
    return StreamBuilder<ControlStatus>(
      stream: formControl.statusChanged,
      builder: (context, snapshot) {
        return ReactiveDropdownField<T>(
          formControlName: formControlName,
          items: items,
          onTap: () => form.unfocus(),
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: _labelStyle(formControl, oldValue),
          ),
          selectedItemBuilder: selectedItemBuilder,
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
