import 'package:flutter/material.dart';
import 'package:astro_mobile/api/generated/code/filmicall.swagger.dart';
import 'package:astro_mobile/common_widget/loader/spinner_widget.dart';
import 'package:astro_mobile/framework/services/app_session_service.dart';
import 'package:astro_mobile/pages/layout/sidebar/sidebar_widget.dart';
import 'package:astro_mobile/pages/widgets/app_header.dart';
import 'package:get_it/get_it.dart';

class PageLoader extends StatefulWidget {
  const PageLoader({super.key});

  @override
  State<StatefulWidget> createState() => _PageLoaderState();
}

class _PageLoaderState extends State<PageLoader> {
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
        appBar: appHeaderWidget(userModel),
        drawer: SidebarWidget(
          userModel: userModel,
          profileByesData: null,
        ),
        body: spinnerWidget());
  }
}
