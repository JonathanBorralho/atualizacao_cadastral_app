part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginRequested extends LoginEvent {
  const LoginRequested(this.credentials);

  final LoginCredentials credentials;

  @override
  List<Object> get props => [credentials];
}
