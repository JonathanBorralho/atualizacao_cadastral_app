import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'package:login_module/src/authentication/bloc/authentication_bloc.dart';
import 'package:login_module/src/login/bloc/login_bloc.dart';
import 'package:login_module/src/login/services/login_service.dart';
import 'package:login_module/src/login/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        Modular.get<LoginService>(),
        context.read<AuthenticationBloc>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Builder(
          builder: (context) {
            return BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return LoadingOverlay(
                  isLoading: state is LoginLoading,
                  child: LoginForm(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
