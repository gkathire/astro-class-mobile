import 'dart:typed_data';

import 'package:astro_mobile/common_widget/dialogs/error_dialog.dart';
import 'package:astro_mobile/common_widget/dialogs/loading_dialog.dart';
import 'package:astro_mobile/framework/common/utils/file_utils.dart';
import 'package:astro_mobile/framework/enum/app_enum.dart';
import 'package:astro_mobile/framework/infrastructure/log/logger_service.dart';
import 'package:astro_mobile/framework/services/api_service.dart';
import 'package:astro_mobile/framework/services/app_session_service.dart';
import 'package:astro_mobile/models/app-model.dart';
import 'package:astro_mobile/pages/screens/astro_screens/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AstroBaseLayoutScreen extends StatefulWidget {
  const AstroBaseLayoutScreen({super.key});

  @override
  State<AstroBaseLayoutScreen> createState() => _AstroBaseLayoutScreenState();
}

class _AstroBaseLayoutScreenState extends State<AstroBaseLayoutScreen> {
  LoggedInUserModel? userModel;
  late final AppSessionService _sessionService;
  final GetIt _getIt = GetIt.instance;
  late final LoggerService _loggerService;
  late final ApiService _apiService;
  Uint8List? profileByesData;

  @override
  void initState() {
    super.initState();
    _sessionService = _getIt<AppSessionService>();
    _apiService = _getIt<ApiService>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadSessionData();
    });
  }

  loadSessionData() async {
    final user = await _sessionService.getUserLoggedInModel();
    if (mounted && user != null) {
      setState(() {
        userModel = user;
        loadProfileImage(
          userId: user.userId ?? 0,
        );
      });
    }
  }

  Future<void> loadProfileImage({required int? userId}) async {
    if (userId == null) {
      return showErrorDialog(context, "Unable to get user profile picture");
    }
    try {
      LoadingDialog().show(context: context, text: "Loading Please wait...");

      final fileResult = await _apiService.getUserPicture(userId: userId);

      LoadingDialog().hide();

      if (fileResult == null) {
        _loggerService.writeLog(
            "getUserPicture: Unable to get user profile picture",
            LogMessageLevel.error);
        showErrorDialog(context, "Unable to get user profile picture");

        return;
      } else if (!fileResult.success) {
        _loggerService.writeLog(
            "getUserPicture: Unable to get user profile picture- ${fileResult.errorMsg}",
            LogMessageLevel.error);
        showErrorDialog(context, " ${fileResult.errorMsg}");
        return;
      }

      String stringBinary = fileResult.result;
      setState(() {
        profileByesData = FileUtils.convertStringToUint8List(stringBinary);
      });
    } catch (e, stackTrace) {
      _loggerService.writeLog(
          "getUserPicture: Unable to get user profile picture",
          LogMessageLevel.error,
          e,
          stackTrace);
      showErrorDialog(context, "Unable to get user profile picture");
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomBottomNav(
      userModel: userModel,
      profileByesData: profileByesData,
    );
  }
}
