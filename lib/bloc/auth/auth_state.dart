import 'package:equatable/equatable.dart';
import 'package:flutter_app/api/generated/code/filmicall.swagger.dart';
import 'package:flutter/foundation.dart';

@immutable
class AuthState {
  final bool isLoading;
  final String? loadingText;

  const AuthState({
    required this.isLoading,
    this.loadingText = "Please wait a moment.",
  });
}

class AuthStateUnInitialized extends AuthState {
  const AuthStateUnInitialized({required super.isLoading});
}

class AuthStateLoggedIn extends AuthState {
  final LoggedInUserModel? loginModel;
  const AuthStateLoggedIn({required this.loginModel, required super.isLoading});
}

class AuthStateLoggedOut extends AuthState with EquatableMixin {
  final Exception? exception;
  final bool isLoading;
  const AuthStateLoggedOut(
      {required this.exception, required this.isLoading, String? loadingText})
      : super(isLoading: isLoading, loadingText: loadingText);

  @override
  // TODO: implement props
  List<Object?> get props => [exception, isLoading];
}
