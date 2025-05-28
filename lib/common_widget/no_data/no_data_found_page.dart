import 'package:flutter/material.dart';
import 'package:astro_mobile/api/generated/code/filmicall.swagger.dart';
import 'package:astro_mobile/common_widget/no_data/no_data_found_widget.dart';
import 'package:astro_mobile/framework/services/app_session_service.dart';
import 'package:astro_mobile/pages/layout/sidebar/sidebar_widget.dart';
import 'package:astro_mobile/pages/widgets/app_header.dart';
import 'package:get_it/get_it.dart';

class NoDataFoundPage extends StatefulWidget {
  const NoDataFoundPage({super.key});

  @override
  State<StatefulWidget> createState() => _NoDataFoundPageState();
}

class _NoDataFoundPageState extends State<NoDataFoundPage> {
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
        body: Center(child: NoDataFoundWidget(canShowMessage: true)));
  }
}
