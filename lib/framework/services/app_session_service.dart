import 'dart:convert';

import 'package:astro_mobile/api/generated/code/filmicall.swagger.dart';
import 'package:astro_mobile/constant/session_constants.dart';
import 'package:astro_mobile/framework/enum/app_enum.dart';
import 'package:astro_mobile/framework/infrastructure/log/logger_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSessionService {
  static SharedPreferences? _prefs;
  final LoggerService loggerService;
  static Future<void> init() async =>
      _prefs = await SharedPreferences.getInstance();

  const AppSessionService({required this.loggerService});

  Future<void> setUserLoggedInModel(LoggedInUserModel? model) async {
    if (model != null) {
      try {
        final userString = jsonEncode(model);
        await _prefs?.setString(loggedInUserModelLocalSessionKey, userString);
      } catch (e, stackTrace) {
        loggerService.writeLog(
            "Unable to get session data", LogMessageLevel.error, e, stackTrace);
      }
    }
  }

  Future<LoggedInUserModel?>? getUserLoggedInModel() async {
    String? userString =
        await _prefs?.getString(loggedInUserModelLocalSessionKey);

    if (userString != null && userString.isNotEmpty) {
      try {
        final Map<String, dynamic> userModel = jsonDecode(userString);
        return LoggedInUserModel.fromJson(userModel);
      } catch (e, stackTrace) {
        loggerService.writeLog("Error occurred when try to parse json",
            LogMessageLevel.error, e, stackTrace);
        return null;
      }
    } else {
      loggerService.writeLog(
          "no session user data found", LogMessageLevel.info);
      return null;
    }
  }

  Future<void> setSelectedMovieModel(MovieModel? model) async {
    if (model != null) {
      try {
        final movieModel = jsonEncode(model);
        await _prefs?.setString(selectedMovieModelLocalSessionKey, movieModel);
      } catch (e, stackTrace) {
        loggerService.writeLog(
            "Unable to get session data", LogMessageLevel.error, e, stackTrace);
      }
    }
  }

  Future<MovieModel?>? getSelectedMovieModel() async {
    String? movieString =
        await _prefs?.getString(selectedMovieModelLocalSessionKey);

    if (movieString != null && movieString.isNotEmpty) {
      try {
        final Map<String, dynamic> movieData = jsonDecode(movieString);
        return MovieModel.fromJson(movieData);
      } catch (e, stackTrace) {
        loggerService.writeLog("Error occurred when try to parse json",
            LogMessageLevel.error, e, stackTrace);
        return null;
      }
    } else {
      loggerService.writeLog(
          "no session user data found", LogMessageLevel.info);
      return null;
    }
  }

  Future<void> clearSession() async {
    try {
      await _prefs?.clear();
    } catch (e, stackTrace) {
      loggerService.writeLog("Error occurred when try to clear session",
          LogMessageLevel.error, e, stackTrace);
    }
  }

  Future<String> getCurrentToken() async {
    var userModel = await getUserLoggedInModel();
    return userModel?.token ?? "";
  }
}
