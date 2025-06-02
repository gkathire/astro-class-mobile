import 'package:astro_mobile/bloc/auth/auth_event.dart';
import 'package:astro_mobile/bloc/auth/auth_state.dart';
import 'package:astro_mobile/common_widget/dialogs/global_error_dialog.dart';
import 'package:astro_mobile/framework/enum/app_enum.dart';
import 'package:astro_mobile/framework/infrastructure/exceptions/auth_exception.dart';
import 'package:astro_mobile/framework/infrastructure/log/logger_service.dart';
import 'package:astro_mobile/framework/services/api_service.dart';
import 'package:astro_mobile/framework/services/app_session_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(ApiService apiService, AppSessionService sessionService,
      LoggerService loggerService)
      : super(const AuthStateUnInitialized(isLoading: true)) {
    on<AuthEventInitialize>((event, emit) async {
      final user = await sessionService.getUserLoggedInModel();
      if (user == null) {
        emit(const AuthStateLoggedOut(exception: null, isLoading: false));
      } else {
        emit(AuthStateLoggedIn(isLoading: false, loginModel: user));
      }
    });

    on<AuthEventLoggedIn>((event, emit) async {
      emit(const AuthStateLoggedOut(
          exception: null,
          isLoading: true,
          loadingText: "Please wait a moment"));

      try {
        final userName = event.username;
        final password = event.password;

        if (userName.trim() == "" ||
            userName.isEmpty ||
            password.trim() == "" ||
            password.isEmpty) {
          loggerService.writeLog("Invalid credentials", LogMessageLevel.error);
          return emit(AuthStateLoggedOut(
              exception: InvalidCredentialException(), isLoading: false));
        }

        final isRememberMe = event.rememberMe;
        final result =
            await apiService.doLogin(email: userName, password: password);

        if (result.result == null) {
          loggerService.writeLog("Unable to login", LogMessageLevel.error);
          showGlobalErrorDialog(
              title: "ERROR",
              content:
                  "Unable to log in. Please try again later or contact support for further information.");
          return emit(AuthStateLoggedOut(
              exception: InvalidCredentialException(), isLoading: false));
        } else if (!result.success) {
          showGlobalErrorDialog(
              title: "ERROR", content: "Unable to login: ${result.errorMsg}");
          loggerService.writeLog(
              "Unable to login: ${result.errorMsg}", LogMessageLevel.error);
          return emit(AuthStateLoggedOut(
              exception: UnauthorizedException(), isLoading: false));
        }

        final user = result.result;

        if (user == null) {
          loggerService.writeLog(
            "Unable to login",
            LogMessageLevel.error,
          );
          showGlobalErrorDialog(
              title: "ERROR",
              content:
                  "Unable to log in. Please try again later or contact support for further information.");
          return emit(AuthStateLoggedOut(
              exception: UnexpectedException(), isLoading: false));
        }

        await sessionService.setUserLoggedInModel(user);

        return emit(
            AuthStateLoggedIn(loginModel: user?.data, isLoading: false));
      } catch (e, stackTrace) {
        loggerService.writeLog(
            "Unable to login", LogMessageLevel.error, e, stackTrace);
        showGlobalErrorDialog(
            title: "ERROR",
            content:
                "Unable to log in. Please try again later or contact support for further information.");
        return emit(AuthStateLoggedOut(
            exception: UnexpectedException(), isLoading: false));
      }
    });

    on<AuthEventLoggedOut>((event, emit) async {
      try {
        await sessionService.clearSession();
        return emit(
            const AuthStateLoggedOut(exception: null, isLoading: false));
      } catch (e, stackTrace) {
        loggerService.writeLog(
            "Unable to clear session", LogMessageLevel.error, e, stackTrace);
        return emit(AuthStateLoggedOut(
            exception: UnexpectedException(), isLoading: false));
      }
    });

    on<AuthEventReset>((event, state) {
      return emit(const AuthStateUnInitialized(isLoading: true));
    });
  }
}
