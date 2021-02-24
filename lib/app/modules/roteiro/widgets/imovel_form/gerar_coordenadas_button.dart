import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:reactive_forms/reactive_forms.dart';

class GerarCoordenadasButton extends StatelessWidget {
  const GerarCoordenadasButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.blueAccent,
      ),
      child: const Text('GERAR'),
      onPressed: () async {
        try {
          Position position = await Geolocator.getCurrentPosition();
          FormGroup formGroup = ReactiveForm.of(context);
          formGroup
              .control('coordenadas.latitude')
              .updateValue(position.latitude, emitEvent: true);
          formGroup
              .control('coordenadas.longitude')
              .updateValue(position.longitude, emitEvent: true);
        } on PermissionDeniedException {
          showPermissionDeniedExceptionError(context);
        }
      },
    );
  }

  void showPermissionDeniedExceptionError(BuildContext context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: const Text('Você deve permitir o acesso às coordenadas'),
        action: SnackBarAction(
          label: 'Permitir',
          onPressed: () async {
            await Geolocator.openAppSettings();
          },
        ),
      ),
    );
  }
}
