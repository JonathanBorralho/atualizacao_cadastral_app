import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DatePickerField extends StatelessWidget {
  final String labelText;
  final String formControlName;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;

  const DatePickerField({
    Key key,
    @required this.formControlName,
    this.labelText,
    this.initialDate,
    this.firstDate,
    this.lastDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConsumer(
      builder: (context, formGroup, child) {
        final FormControl formControl = formGroup.control(formControlName);
        final DateTime date = formControl.value;
        return InkWell(
          onTap: () {
            formGroup.unfocus();
            showDatePicker(
              context: context,
              initialDate: initialDate ?? DateTime.now(),
              firstDate: firstDate ?? DateTime(1930, 1, 1),
              lastDate: initialDate ?? DateTime.now(),
            ).then((value) {
              formControl.value = value ?? formControl.value;
              formControl.markAllAsTouched();
            });
          },
          child: InputDecorator(
            isEmpty: date == null,
            decoration: InputDecoration(
              labelText: labelText,
            ),
            child: Row(
              mainAxisAlignment: date != null
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (date != null) ...{
                  Text(
                    DateFormat('dd/MM/yyyy').format(date),
                    style: TextStyle(fontSize: 16),
                  ),
                },
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        );
      },
    );
  }
}
