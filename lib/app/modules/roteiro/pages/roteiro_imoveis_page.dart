import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/imovel.dart';
import 'package:atualizacao_cadastral_app/app/modules/roteiro/widgets/imoveis_list.dart';
import 'package:atualizacao_cadastral_app/app/shared/widgets/loading_indicator.dart';

class RoteiroImoveisPage extends StatefulWidget {
  final String roteiroId;

  RoteiroImoveisPage(this.roteiroId);

  @override
  _RoteiroImoveisPageState createState() => _RoteiroImoveisPageState();
}

class _RoteiroImoveisPageState extends State<RoteiroImoveisPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imóveis'),
      ),
      body: FutureBuilder(
        future: Hive.openBox<Imovel>('imoveis'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ImoveisList(roteiroId: widget.roteiroId);
          }

          return const LoadingIndicator();
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    Hive.box<Imovel>('imoveis').close();
  }
}
