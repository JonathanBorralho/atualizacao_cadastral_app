import 'package:atualizacao_cadastral_app/app/modules/roteiro/services/roteiro_upload_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/imovel_form_page.dart';
import 'pages/roteiro_imoveis_page.dart';
import 'pages/roteiros_page.dart';
import 'repository/roteiro_repository.dart';
import 'services/dropdowns_config_service.dart';

class RoteiroModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => RoteiroRepository(i())),
    Bind((i) => DropdownsConfigService(i())),
    Bind((i) => RoteiroUploadService(i())),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (context, args) => RoteirosPage()),
    ModularRouter('/:id/imoveis', child: (context, args) => RoteiroImoveisPage(args.params['id'])),
    ModularRouter('/imovel-form', child: (context, args) => ImovelFormPage(args.data)),
  ];
}
