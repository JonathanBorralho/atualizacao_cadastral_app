part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationAppStarted extends AuthenticationEvent {
  const AuthenticationAppStarted();
}

class AuthenticationLogoutRequested extends AuthenticationEvent {
  const AuthenticationLogoutRequested();
}

class AuthenticationSucceeded extends AuthenticationEvent {
  final OAuthToken oAuthToken;

  const AuthenticationSucceeded(this.oAuthToken);

  @override
  List<Object> get props => [oAuthToken];
}
