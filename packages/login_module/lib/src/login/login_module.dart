import 'package:flutter_modular/flutter_modular.dart';

import 'pages/login_page.dart';
import 'services/login_service.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => LoginService(i())),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (_, __) => LoginPage()),
  ];
}
