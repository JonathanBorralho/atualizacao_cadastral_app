import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/imovel.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RoteiroImoveisPage extends StatelessWidget {
  final String roteiroId;

  RoteiroImoveisPage(this.roteiroId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imóveis'),
      ),
      body: ValueListenableBuilder<Box<Imovel>>(
        valueListenable: Hive.box<Imovel>('imoveis').listenable(),
        builder: (context, box, child) {
          var id = int.parse(roteiroId);
          var imoveis = box.values.where((e) => e.roteiroId == id).toList()
            ..sort((a, b) => a.id.compareTo(b.id));

          if (imoveis.isEmpty) {
            return child;
          }

          return ListView.builder(
            itemCount: imoveis.length,
            itemBuilder: (context, index) {
              var imovel = imoveis[index];
              return ImovelListItem(imovel);
            },
          );
        },
        child: const Center(
          child: const Text('Não há imóveis'),
        ),
      ),
    );
  }
}

class ImovelListItem extends StatelessWidget {
  final Imovel imovel;

  ImovelListItem(this.imovel);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Modular.link.pushNamed('/imovel-form', arguments: imovel);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Visita: ${imovel.roteirizacao.visita}'),
              Text('Matrícula: ${imovel.roteirizacao.matricula}'),
              Text('Testada: ${imovel.roteirizacao.testada}'),
              Text('Rota: ${imovel.roteirizacao.rota}'),
              Text('Logradouro: ${imovel.endereco.logradouro}'),
              Text('Bairro: ${imovel.endereco.bairro}'),
              Text('Nome: ${imovel.cliente.nome}'),
              Text('CPF: ${imovel.cliente.cpf}'),
            ],
          ),
        ),
      ),
    );
  }
}
