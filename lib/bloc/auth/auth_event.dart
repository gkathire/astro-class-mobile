import 'package:flutter/foundation.dart';

@immutable
class AuthEvent {
  const AuthEvent();
}

class AuthEventInitialize extends AuthEvent {
  const AuthEventInitialize();
}

class AuthEventLoggedIn extends AuthEvent {
  final String username;
  final String password;
  final bool? rememberMe;
  const AuthEventLoggedIn(
      {required this.username, required this.password, this.rememberMe});
}

class AuthEventLoggedOut extends AuthEvent {
  const AuthEventLoggedOut();
}

class AuthEventReset extends AuthEvent {
  const AuthEventReset();
}
