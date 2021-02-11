import 'package:atualizacao_cadastral_app/app/modules/roteiro/roteiro_module.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:atualizacao_cadastral_app/app/shared/splash.dart';
import 'package:login_module/login_module.dart';
import 'package:oauth_dio/oauth_dio.dart';

import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
    Bind((i) => Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8090'))
      ..interceptors.add(BearerInterceptor(i()))),
    Bind(
      (i) => OAuth(
        clientId: 'atualizacao_cadastral_app',
        clientSecret: 'at_cad_app*#',
        tokenUrl: '/oauth/token',
        dio: Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8090')),
        validator: (token) async {
          if (JwtVerifier.isExpired(token.refreshToken)) {
            i.get<AuthenticationBloc>().add(AuthenticationLogoutRequested());
          }
          return !JwtVerifier.isExpired(token.accessToken);
        },
        storage: HiveOAuthStorage(),
      ),
    ),
    Bind((i) => AuthenticationBloc()),
    Bind((i) => JwtUtil(i.get())),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, child: (_, __) => SplashPage()),
    ModularRouter('/login', module: LoginModule()),
    ModularRouter('/roteiros', module: RoteiroModule()),
  ];

  @override
  Widget get bootstrap => AppWidget();
}
