import 'dart:typed_data';

import 'package:astro_mobile/api/generated/code/filmicall.swagger.dart';
import 'package:astro_mobile/bloc/auth/auth_bloc.dart';
import 'package:astro_mobile/bloc/auth/auth_event.dart';
import 'package:astro_mobile/bloc/movie/movie_bloc.dart';
import 'package:astro_mobile/bloc/movie/movie_event.dart';
import 'package:astro_mobile/common_widget/dialogs/logout_dialog.dart';
import 'package:astro_mobile/constant/assets.dart';
import 'package:astro_mobile/framework/services/app_session_service.dart';
import 'package:astro_mobile/screen_utils/screen_size_utils.dart';
import 'package:astro_mobile/theme_data/custom_text_scaler.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class SidebarWidget extends StatefulWidget {
  final LoggedInUserModel? userModel;
  final Uint8List? profileByesData;

  const SidebarWidget(
      {super.key, required this.userModel, required this.profileByesData});

  @override
  State<SidebarWidget> createState() => _SidebarWidgetState();
}

class _SidebarWidgetState extends State<SidebarWidget> {
  final GetIt _getIt = GetIt.instance;
  late final AppSessionService _appSessionService;

  @override
  void initState() {
    super.initState();
    _appSessionService = _getIt<AppSessionService>();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white,
        width: ScreenSizeUtils.getScreenWidth(context),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 35.h,
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          if (widget.profileByesData != null) ...[
                            ClipOval(
                              child: Image.memory(
                                widget.profileByesData!,
                                fit: BoxFit.cover,
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ] else ...[
                            CircleAvatar(
                              radius: 25.r,
                              backgroundColor: ThemeColor.lightGrey,
                              backgroundImage:
                                  const AssetImage(AppImageAssets.profileImage),
                            ),
                          ],
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${widget.userModel?.firstName}",
                                textScaler: CustomTextScaler.headerThree,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              SizedBox(
                                width: 150.w,
                                child: Text(
                                  "${widget.userModel?.userName}",
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_sharp,
                      size: 30.h,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              SideBarRowInformation(
                label: "Account",
              ),
              SideBarRowInformation(
                label: "Language",
              ),
              //  SideBarDarkModeToggle(),

              SideBarRowInformation(
                label: "What's new",
              ),
              SideBarRowInformation(
                label: "FAQ",
              ),
              SideBarRowInformation(
                label: "Terms of Service",
              ),
              SideBarRowInformation(
                label: "Privacy Policy",
              ),
              SizedBox(
                height: 100.h,
              ),
              Center(
                child: InkWell(
                  onTap: () async {
                    final isShouldLogout = await showLogOutDialog(context);
                    if (isShouldLogout) {
                      context.read<AuthBloc>().add(const AuthEventLoggedOut());
                      context.read<MovieBloc>().add(const MovieResetEvent());
                    }
                  },
                  child: Container(
                    width: 180.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: ThemeColor.mainThemeColor),
                    child: Center(
                        child: Text(
                      "Logout",
                      style: TextStyle(
                          color: ThemeColor.white, fontWeight: FontWeight.bold),
                      textScaler: TextScaler.linear(1.sp),
                    )),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class SideBarRowInformation extends StatelessWidget {
  String? label;
  SideBarRowInformation({super.key, required this.label});
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: ScreenSizeUtils.getScreenWidth(context) - 100.w,
                  child: Text(
                    "${label}",
                    textScaler: TextScaler.linear(1.2.sp),
                  )),
            ],
          ),
        ));
  }
}

class SideBarDarkModeToggle extends StatefulWidget {
  @override
  State<SideBarDarkModeToggle> createState() => _SideBarDarkModeToggleState();
}

class _SideBarDarkModeToggleState extends State<SideBarDarkModeToggle> {
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            SizedBox(
                width: 300.w,
                child: Text(
                  "Dark Mode",
                  textScaler: TextScaler.linear(1.2.sp),
                )),
            Switch(
                value: isEnabled,
                onChanged: (bool) {
                  setState(() {
                    isEnabled = bool;
                    if (isEnabled) {
                      ThemeColor.setDarkMode();
                      print("Hello world");
                    } else {
                      ThemeColor.setLightMode();
                    }
                  });
                })
          ],
        ),
      ),
    );
  }
}
