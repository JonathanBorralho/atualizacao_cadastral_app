import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:login_module/login_module.dart';
import 'package:oauth_dio/oauth_dio.dart';

import 'app/app_module.dart';

void main() async {
  await initHive();
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build();
  runApp(ModularApp(module: AppModule()));
}

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(OAuthTokenAdapter()); 
  await Hive.openBox<OAuthToken>('OAUTH_TOKEN_BOX');
}
