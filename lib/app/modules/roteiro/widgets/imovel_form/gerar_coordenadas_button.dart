import 'package:flutter/material.dart';

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
      onPressed: () {
        
      },
    );
  }
}
