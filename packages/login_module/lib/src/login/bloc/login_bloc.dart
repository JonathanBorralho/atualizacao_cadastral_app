import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oauth_dio/oauth_dio.dart';

import 'package:login_module/src/login/models/login_credentials_model.dart';
import 'package:login_module/src/login/services/login_service.dart';
import 'package:login_module/src/login/services/login_exception.dart';
import 'package:login_module/src/authentication/bloc/authentication_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(
    this.loginService,
    this.authenticationBloc,
  ) : super(LoginInitial());

  final LoginService loginService;
  final AuthenticationBloc authenticationBloc;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginRequested) {
      yield LoginLoading();
      try {
        OAuthToken oAuthToken = await loginService.login(event.credentials);
        authenticationBloc.add(AuthenticationSucceeded(oAuthToken));
        yield LoginSuccess();
      } on LoginException catch (e) {
        yield LoginFailure(e.toString());
      }
    }
  }
}
