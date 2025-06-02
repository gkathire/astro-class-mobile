import 'package:flutter/material.dart';
import 'package:astro_mobile/api/generated/code/astroclass.swagger.dart';
import 'package:astro_mobile/framework/services/app_session_service.dart';
import 'package:astro_mobile/pages/layout/base_layout/app_base_layout.dart';
import 'package:get_it/get_it.dart';

class AppInitialPage extends StatefulWidget {
  const AppInitialPage({super.key});

  @override
  State<AppInitialPage> createState() => _AppInitialPageState();
}

class _AppInitialPageState extends State<AppInitialPage> {
  late final AppSessionService _sessionService;
  final GetIt _getIt = GetIt.instance;
  UserModel? userModel;
  bool isSessionResourceLoading = false;
  @override
  void initState() {
    super.initState();
    _sessionService = _getIt<AppSessionService>();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return const AppBaseLayout();
  }
}
