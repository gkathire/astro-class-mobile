import 'dart:typed_data';

import 'package:astro_mobile/bloc/navigation/navigation_bloc.dart';
import 'package:astro_mobile/common_widget/dialogs/error_dialog.dart';
import 'package:astro_mobile/common_widget/dialogs/loading_dialog.dart';
import 'package:astro_mobile/constant/assets.dart';
import 'package:astro_mobile/framework/common/utils/file_utils.dart';
import 'package:astro_mobile/framework/enum/app_enum.dart';
import 'package:astro_mobile/framework/infrastructure/log/logger_service.dart';
import 'package:astro_mobile/framework/services/api_service.dart';
import 'package:astro_mobile/framework/services/app_session_service.dart';
import 'package:astro_mobile/locator/locator_setup.dart';
import 'package:astro_mobile/models/app-model.dart';
import 'package:astro_mobile/pages/layout/bottom_navigation/app_bottom_navigator.dart';
import 'package:astro_mobile/pages/layout/bottom_navigation/page_navigation_container.dart';
import 'package:astro_mobile/pages/layout/sidebar/sidebar_widget.dart';
import 'package:astro_mobile/theme_data/custom_text_scaler.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

class AppBaseLayout extends StatefulWidget {
  const AppBaseLayout({super.key});

  @override
  State<AppBaseLayout> createState() => _AppBaseLayoutState();
}

class _AppBaseLayoutState extends State<AppBaseLayout> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final navigationBloc = getIt<NavigationBloc>();
  late final AppSessionService _sessionService;
  late final LoggerService _loggerService;
  final ValueNotifier<int> _selectedNavigationIndex =
      ValueNotifier<int>(AppPageNavigation.home.value);
  LoggedInUserModel? userModel;
  final GetIt _getIt = GetIt.instance;
  late final ApiService _apiService;
  int predefinedCurrencyTypeId = 0;
  bool isCompanyInfoLoading = false;
  Uint8List? profileByesData;
  final controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _apiService = _getIt<ApiService>();
    _loggerService = _getIt<LoggerService>();
    _sessionService = getIt<AppSessionService>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadSessionData();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  loadSessionData() async {
    final user = await _sessionService.getUserLoggedInModel();
    if (mounted && user != null) {
      setState(() {
        userModel = user;
        getCompanyInformation(companyId: userModel?.companyId ?? 0);
        loadProfileImage(
          userId: user.userId ?? 0,
        );
      });
    }
  }

  Future<void> getCompanyInformation({required int companyId}) async {
    try {
      canShowLoadingWidgetWithMessage(canShow: true);
      // get company
      // final companyInfo = await _apiService.getCompany(
      //   companyId: companyId,
      // );

      canShowLoadingWidgetWithMessage(canShow: false);

      // if (companyInfo == null || companyInfo.result?.model == null) {
      //   _loggerService.writeLog("getCompany: Unable to get company information",
      //       LogMessageLevel.info);
      //   await showErrorDialog(context, "Unable to get company information");
      //   return;
      // } else if (!companyInfo.success) {
      //   _loggerService.writeLog(
      //       "getCompany: Unable to get company information- ${companyInfo.errorMsg}",
      //       LogMessageLevel.error);
      //   await showErrorDialog(context,
      //       "Unable to get company information: ${companyInfo.errorMsg}");
      //
      //   return;
      // }
      // if (mounted) {
      //   setState(() {
      //     predefinedCurrencyTypeId =
      //         companyInfo.result?.model?.predefinedCurrencyTypeId ?? 0;
      //   });
      // }
    } catch (error, stackTrace) {
      _loggerService.writeLog("Unable to get company information",
          LogMessageLevel.error, error, stackTrace);
      await showErrorDialog(context, "Unable to get company information");
      if (mounted) {
        setState(() {
          canShowLoadingWidgetWithMessage(canShow: false);
        });
      }
      return;
    }
  }

  canShowLoadingWidgetWithMessage({required bool canShow}) {
    // if (canShow) {
    //   setState(() {
    //     isCompanyInfoLoading = true;
    //   });
    //   LoadingDialog().show(context: context, text: "Loading Please wait...");
    // } else {
    //   setState(() {
    //     isCompanyInfoLoading = false;
    //   });
    //   LoadingDialog().hide();
    // }
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

  updatePageNavigationIndexValue(int value) {
    _selectedNavigationIndex.value = value;
  }

  navigationToCreatePage(int? navigationPageSelection) {
    if (navigationPageSelection != null) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: ValueListenableBuilder<int>(
            valueListenable: _selectedNavigationIndex,
            builder: (context, value, child) {
              if (_selectedNavigationIndex.value ==
                  AppPageNavigation.home.value) {
                return AppBar(
                  leading: Builder(builder: (BuildContext context) {
                    return IconButton(
                        padding: EdgeInsets.only(left: 10.w),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: profileByesData != null
                            ? ClipOval(
                                child: Image.memory(
                                  profileByesData!,
                                  fit: BoxFit.cover,
                                  width: 42,
                                  height: 42,
                                ),
                              )
                            : CircleAvatar(
                                radius: 20.r,
                                backgroundColor: ThemeColor.lightGrey,
                                backgroundImage: const AssetImage(
                                    AppImageAssets.profileImage),
                              ));
                  }),
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Welcome Back!",
                                textScaler: CustomTextScaler.smallTextTwo,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                userModel?.firstName ?? "",
                                textScaler: CustomTextScaler.smallTextOne,
                                style: const TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      TextButton(
                          onPressed: () {},
                          child: SvgPicture.asset(
                            AppImageAssets.notificationSvgIcon,
                            width: 20.w,
                          ))
                    ],
                  ),
                  backgroundColor: ThemeColor.lightGreyTwo,
                );
              } else {
                String title = "";
                if (_selectedNavigationIndex.value ==
                    AppPageNavigation.home.value) {
                  title = "Home";
                } else if (_selectedNavigationIndex.value ==
                    AppPageNavigation.reports.value) {
                  title = "Reports";
                } else if (_selectedNavigationIndex.value ==
                    AppPageNavigation.chat.value) {
                  title = "Chat";
                }
                return AppBar(
                  leading: Builder(builder: (BuildContext context) {
                    return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: CircleAvatar(
                          radius: 15.r,
                          backgroundColor: ThemeColor.lightGreyTwo,
                          backgroundImage:
                              const AssetImage(AppImageAssets.burgerIcon),
                        ));
                  }),
                  title: Text(title),
                  backgroundColor: ThemeColor.lightGreyTwo,
                  actions: [
                    TextButton(
                        onPressed: () {},
                        child: const ImageIcon(
                          AssetImage(AppImageAssets.notificationImage),
                          size: 20,
                          // color: ThemeColor.mainThemeColor,
                        ))
                  ],
                );
              }
            }),
      ),
      drawer: SidebarWidget(
        profileByesData: profileByesData,
        userModel: userModel,
      ),
      backgroundColor: ThemeColor.lightGreyTwo,
      body: PageNavigationContainer(
        userModel: userModel,
        apiService: _apiService,
        loggerService: _loggerService,
        predefinedCurrencyTypeId: predefinedCurrencyTypeId,
        sessionService: _sessionService,
        onPageNavigationSelection: (selectedNavigationIndex) {
          updatePageNavigationIndexValue(
              selectedNavigationIndex ?? AppPageNavigation.home.value);
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _selectedNavigationIndex,
        builder: (context, value, child) {
          return AppBottomNavigator();
        },
      ),
    );
  }
}
