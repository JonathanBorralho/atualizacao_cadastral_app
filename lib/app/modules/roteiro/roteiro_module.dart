import 'package:flutter_modular/flutter_modular.dart';

import 'pages/imovel_form_page.dart';
import 'pages/roteiro_imoveis_page.dart';
import 'pages/roteiros_page.dart';
import 'repository/roteiro_repository.dart';

class RoteiroModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => RoteiroRepository(i())),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (context, args) => RoteirosPage()),
    ModularRouter('/:id/imoveis', child: (context, args) => RoteiroImoveisPage(args.params['id'])),
    ModularRouter('/imovel-form', child: (context, args) => ImovelFormPage(args.data)),
  ];
}
