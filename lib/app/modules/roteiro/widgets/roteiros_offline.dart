import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/roteiro_resumo.dart';

class RoteirosOffline extends StatelessWidget {
  const RoteirosOffline();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<RoteiroResumo>>(
      valueListenable: Hive.box<RoteiroResumo>('roteiros').listenable(),
      builder: (context, box, child) {
        if (box.values.isEmpty) {
          return child;
        }

        return ListView.builder(
          itemCount: box.values.length,
          itemBuilder: (context, index) {
            var roteiro = box.getAt(index);
            return ListTile(
              title: Text('Rota 11 - Localidade 111'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${roteiro.usuario.nome}'),
                  Text('${roteiro.criadoEm.day}/${roteiro.criadoEm.month}/${roteiro.criadoEm.year}'),
                ],
              ),
              isThreeLine: true,
              trailing: Icon(Icons.mobile_screen_share),
              onTap: () {
                Modular.to.pushNamed('/roteiros/${roteiro.id}/imoveis');
              },
            );
          },
        );
      },
      child: const Center(
        child: const Text('Não há roteiros'),
      ),
    );
  }
}
