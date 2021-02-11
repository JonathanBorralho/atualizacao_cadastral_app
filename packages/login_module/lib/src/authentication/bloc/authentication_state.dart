part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState({
    this.accessToken,
    this.refreshToken,
    this.isAuthenticated = false,
  });

  final String accessToken;
  final String refreshToken;
  final bool isAuthenticated;

  bool get isRefreshTokenExpired => JwtVerifier.isExpired(refreshToken);

  factory AuthenticationState.authenticated(String accessToken, String refreshToken) {
    return AuthenticationState(
      accessToken: accessToken,
      refreshToken: refreshToken,
      isAuthenticated: true,
    );
  }

  factory AuthenticationState.unauthenticated() {
    return const AuthenticationState();
  }

  AuthenticationState copyWith({
    String accessToken,
    String refreshToken,
    bool isAuthenticated,
  }) {
    return AuthenticationState(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'isAuthenticated': isAuthenticated,
    };
  }

  factory AuthenticationState.fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return AuthenticationState(
      accessToken: map['accessToken'],
      refreshToken: map['refreshToken'],
      isAuthenticated: map['isAuthenticated'],
    );
  }

  @override
  List<Object> get props => [accessToken, refreshToken, isAuthenticated];
}
