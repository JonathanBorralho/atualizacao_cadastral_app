import 'package:equatable/equatable.dart';

class LoginCredentials extends Equatable {
  const LoginCredentials(this.username, this.password);

  final String username;
  final String password;

  @override
  List<Object> get props => [
    username,
    password,
  ];

}
