import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:oauth_dio/oauth_dio.dart';
import 'package:equatable/equatable.dart';
import 'package:login_module/src/authentication/oauth/jwt_verifier.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends HydratedBloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationState.unauthenticated());

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is AuthenticationAppStarted) {
      yield* _onAppStarted();
    }

    if (event is AuthenticationLogoutRequested) {
      yield AuthenticationState.unauthenticated();
    }

    if (event is AuthenticationSucceeded) {
      final OAuthToken oAuthToken = event.oAuthToken;
      yield AuthenticationState.authenticated(oAuthToken.accessToken, oAuthToken.refreshToken);
    }
  }

  Stream<AuthenticationState> _onAppStarted() async* {
    if (state.isAuthenticated && state.isRefreshTokenExpired) {
      yield AuthenticationState.unauthenticated();
    } else {
      yield state;
    }
  }

  @override
  AuthenticationState fromJson(Map<String, dynamic> json) {
    return AuthenticationState.fromJson(json['value']);
  }

  @override
  Map<String, dynamic> toJson(AuthenticationState state) {
    return { 'value': state.toJson() };
  }
}
