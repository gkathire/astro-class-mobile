import 'package:app_settings/app_settings.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../api/generated/code/filmicall.swagger.dart';
import '../../framework/services/app_session_service.dart';
import '../../pages/widgets/app_header.dart';

class OfflinePage extends StatefulWidget {
  @override
  State<OfflinePage> createState() => _OfflinePageState();
}

class _OfflinePageState extends State<OfflinePage> {
  LoggedInUserModel? userModel;

  AppSessionService? sessionService;

  GetIt getIt = GetIt.instance;

  @override
  void initState() {
    super.initState();
    loadSessionData();
  }

  Future<void> loadSessionData() async {
    sessionService = getIt<AppSessionService>();
    final user = await sessionService?.getUserLoggedInModel();
    if (mounted) {
      setState(() {
        userModel = user;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: userModel != null
          ? appHeaderWidget(userModel)
          : AppBar(
              leadingWidth: 0,
              leading: Container(),
              title: Container(),
            ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wifi_off, size: 80, color: ThemeColor.mainThemeColor),
            SizedBox(height: 20),
            Text(
              "You're offline!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Check your internet connection and try again.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Optional: Open device settings
                AppSettings.openAppSettingsPanel(AppSettingsPanelType
                    .internetConnectivity); // Opens Wi-Fi settings
              },
              child: Text("Settings"),
            ),
          ],
        ),
      ),
    );
  }
}
