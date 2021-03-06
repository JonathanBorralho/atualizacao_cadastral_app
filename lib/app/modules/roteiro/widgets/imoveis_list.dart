import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/imovel.dart';

class ImoveisList extends StatelessWidget {
  const ImoveisList({
    Key key,
    @required this.roteiroId,
  }) : super(key: key);

  final String roteiroId;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<Imovel>>(
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
    );
  }
}

class ImovelListItem extends StatelessWidget {
  final Imovel imovel;

  ImovelListItem(this.imovel);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: imovel.impedimento != null ? Colors.red : null,
      margin: const EdgeInsets.all(8.0),
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
              if (imovel.modificadoEm != null) ... {
                SizedBox(height: 5),
                Text(
                  'Modificado em: ${dateToString(imovel.modificadoEm)}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              }
            ],
          ),
        ),
      ),
    );
  }

  String dateToString(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year.toString().padLeft(4, '0')} ${date.hour}:${date.minute}';
  }
}
