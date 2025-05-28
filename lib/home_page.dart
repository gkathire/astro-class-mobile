import 'package:astro_mobile/bloc/auth/auth_bloc.dart';
import 'package:astro_mobile/bloc/auth/auth_event.dart';
import 'package:astro_mobile/bloc/auth/auth_state.dart';
import 'package:astro_mobile/common_widget/dialogs/loading_dialog.dart';
import 'package:astro_mobile/common_widget/loader/page_loader.dart';
import 'package:astro_mobile/common_widget/no_data/no_data_found_page.dart';
import 'package:astro_mobile/common_widget/offline_indicator/offline_page.dart';
import 'package:astro_mobile/framework/enum/app_enum.dart';
import 'package:astro_mobile/framework/infrastructure/log/logger_service.dart';
import 'package:astro_mobile/framework/services/real_time_communication/real_time_communication_service.dart';
import 'package:astro_mobile/pages/loading_widgets/splash_screen_widget.dart';
import 'package:astro_mobile/pages/screens/astro_screens/astro_base_layout_screen.dart';
import 'package:astro_mobile/pages/screens/auth_screens/login/login_page.dart';
import 'package:astro_mobile/theme_data/app_theme.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  final LoggerService loggerService;
  const HomePage({super.key, required this.loggerService});
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Connectivity _connectivity = Connectivity();
  late Stream<List<ConnectivityResult>> _connectivityStream;

  bool _isConnectionToNetwork = true;
  final GetIt _getIt = GetIt.instance;
  bool showInitialSplashScreen = true;

  late final RealTimeCommunicationService _realTimeCommunicationService;
  @override
  void initState() {
    super.initState();
    _realTimeCommunicationService = _getIt<RealTimeCommunicationService>();
    initializeRealtimeCommunication();

    _connectivityStream = _connectivity.onConnectivityChanged;

    _connectivityStream.listen((List<ConnectivityResult> results) {
      // Check if all connections are "none"
      bool isOffline = results.isEmpty ||
          results.every((result) => result == ConnectivityResult.none);

      if (isOffline) {
        // Navigate to OfflinePage if offline
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OfflinePage()),
        );
      } else {
        // If online, pop the offline page if it exists
        Navigator.popUntil(context, (route) => route.isFirst);
      }
    });

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        showInitialSplashScreen = false;
      });
    });
  }

  Future<void> initializeRealtimeCommunication() async {
    await _realTimeCommunicationService.initializeSignalRConnection();
    await _realTimeCommunicationService.startConnection();
  }

  @override
  Widget build(BuildContext context) {
    LoggerService().writeLog("Initialized home page", LogMessageLevel.info);
    context.read<AuthBloc>().add(const AuthEventInitialize());
    ThemeColor.setLightMode();
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isLoading) {
          LoadingDialog().show(context: context, text: "Please Wait a moment");
        } else {
          LoadingDialog().hide();
        }
      },
      builder: (context, state) {
        if (showInitialSplashScreen == true) {
          return SplashScreen();
        } else {
          if (_isConnectionToNetwork) {
            if (state.isLoading) {
              return const PageLoader();
            } else {
              if (state is AuthStateLoggedIn) {
                return ResponsiveSizer(
                  builder: (context, orientation, screenType) {
                    return GetMaterialApp(
                      theme: AppTheme.tempMailTheme,
                      debugShowCheckedModeBanner: false,
                      // home: Homepage(),
                      // home: ClassList(),
                      home: AstroBaseLayoutScreen(),
                    );
                  },
                );
                // return const AppInitialPage(); // old app page
              } else {
                return const LoginPage();
              }
            }
          } else {
            widget.loggerService.writeLog(
                "Network ERROR: Unable to Connect to the Internet",
                LogMessageLevel.error);
            return Center(child: NoDataFoundPage());
          }
        }
      },
    );
  }
}
