import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/dropdowns_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:login_module/login_module.dart';
import 'package:oauth_dio/oauth_dio.dart';

import 'app/app_module.dart';
import 'app/modules/roteiro/models/imovel.dart';
import 'app/modules/roteiro/models/roteiro_resumo.dart';

void main() async {
  await initHive();
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build();
  runApp(ModularApp(module: AppModule()));
}

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ImovelAdapter());
  Hive.registerAdapter(RoteirizacaoAdapter());
  Hive.registerAdapter(EnderecoAdapter());
  Hive.registerAdapter(ClienteAdapter());
  Hive.registerAdapter(SubcategoriasAdapter());
  Hive.registerAdapter(CaracteristicasAdapter());
  Hive.registerAdapter(ConclusaoAdapter());
  Hive.registerAdapter(HidrometroAdapter());
  Hive.registerAdapter(CoordenadasAdapter());

  Hive.registerAdapter(RoteiroResumoAdapter());
  Hive.registerAdapter(UsuarioAdapter());
  Hive.registerAdapter(OAuthTokenAdapter()); 

  Hive.registerAdapter(TipoAdapter());
  Hive.registerAdapter(EstadoAdapter());
  Hive.registerAdapter(DropdownsConfigAdapter());

  await Hive.openBox<Imovel>('imoveis');
  await Hive.openBox<RoteiroResumo>('roteiros');
  await Hive.openBox<DropdownsConfig>('dropdown_config');
  await Hive.openBox<OAuthToken>('OAUTH_TOKEN_BOX');
}
