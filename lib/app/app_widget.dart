import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_module/login_module.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  NavigatorState get _navigator => Modular.navigatorKey.currentState;

  @override
  void initState() {
    super.initState();
    Modular.get<AuthenticationBloc>().add(AuthenticationAppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<AuthenticationBloc>(),
      child: MaterialApp(
        title: 'Atualização Cadastral',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        onGenerateRoute: Modular.generateRoute,
        navigatorKey: Modular.navigatorKey,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return BlocListener<AuthenticationBloc, AuthenticationState>(
            child: child,
            listener: (context, state) {
              if (state.isAuthenticated) {
                _navigator.pushNamedAndRemoveUntil('/roteiros', (route) => false);
              }

              if (!state.isAuthenticated) {
                _navigator.pushNamedAndRemoveUntil('/login', (route) => false);
              }
            },
          );
        },
      ),
    );
  }
}
