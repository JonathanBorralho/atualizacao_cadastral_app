import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';

import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/imovel.dart';
import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/roteiro_resumo.dart';
import 'package:atualizacao_cadastral_app/app/modules/roteiro/repository/roteiro_repository.dart';
import 'package:atualizacao_cadastral_app/app/shared/widgets/loading_indicator.dart';

class RoteirosOnline extends StatelessWidget {
  const RoteirosOnline();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RoteiroResumo>>(
      future: Modular.get<RoteiroRepository>().findAll(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final roteirosBox = Hive.box<RoteiroResumo>('roteiros');

          final roteiros = snapshot.data;

          return ListView.builder(
            itemCount: roteiros.length,
            itemBuilder: (context, index) {
              var roteiro = roteiros[index];
              var saved = roteirosBox.containsKey(roteiro.id);
              return ListTile(
                title: Text(roteiro.usuario.nome),
                trailing: IconButton(
                  color: saved ? Colors.grey : Colors.blue,
                  icon: Icon(saved ? Icons.file_download_done : Icons.file_download),
                  onPressed: !saved ? () async {
                    var imoveisBox = Hive.box<Imovel>('imoveis');
                    var roteirosBox = Hive.box<RoteiroResumo>('roteiros');

                    roteirosBox.put(roteiro.id, roteiro);
                    var imoveisList = await Modular.get<RoteiroRepository>()
                        .findAllByRoteiro(roteiro.id);

                    imoveisBox.addAll(imoveisList
                        .map((e) => e.copyWith(roteiroId: roteiro.id))
                        .toList());
                  } : null,
                ),
              );
            },
          );
        }

        return const LoadingIndicator();
      },
    );
  }
}
