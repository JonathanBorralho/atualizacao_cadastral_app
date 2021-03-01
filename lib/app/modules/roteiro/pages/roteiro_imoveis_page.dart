import 'package:atualizacao_cadastral_app/app/modules/roteiro/services/roteiro_upload_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';

import 'package:adaptive_dialog/adaptive_dialog.dart';

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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.check),
        onPressed: () async {
          /* var imoveis = Hive.box<Imovel>('imoveis').values.toList();
          print(imoveis.length); */

          final answer = await showOkCancelAlertDialog(
            context: context,
            message: 'Desejar finalizar este roteiro? \nEsta ação não poderá ser desfeita.',
            okLabel: 'SIM',
          );


          if (answer == OkCancelResult.ok) {
            var service = Modular.get<RoteiroUploadService>();
            await service.upload(int.parse(widget.roteiroId));
          }

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
