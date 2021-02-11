import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/imovel.dart';
import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/roteiro_resumo.dart';
import 'package:atualizacao_cadastral_app/app/modules/roteiro/repository/roteiro_repository.dart';

class RoteirosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meus Roteiros'),
          bottom: const TabBar(
            tabs: [
              const Tab(
                  text: 'Offline', icon: Icon(Icons.signal_wifi_off_outlined)),
              const Tab(text: 'Online', icon: Icon(Icons.signal_wifi_4_bar)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            const RoteirosOffline(),
            const RoteirosOnline(),
          ],
        ),
      ),
    );
  }
}

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

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

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
              title: Text(roteiro.usuario.nome),
              onTap: () {
                Modular.link.pushNamed('/${roteiro.id}/imoveis');
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
