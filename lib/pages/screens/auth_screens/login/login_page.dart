import 'package:astro_mobile/bloc/auth/auth_bloc.dart';
import 'package:astro_mobile/bloc/auth/auth_state.dart';
import 'package:astro_mobile/common_widget/dialogs/error_dialog.dart';
import 'package:astro_mobile/constant/app_vectors.dart';
import 'package:astro_mobile/framework/infrastructure/exceptions/auth_exception.dart';
import 'package:astro_mobile/pages/screens/astro_screens/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:astro_mobile/pages/widgets/other_login_button_widgets/google_sign_on_button.dart';
import 'package:astro_mobile/screen_utils/extensions/extens.dart';
import 'package:astro_mobile/theme_data/custom_text_scaler.dart';
import 'package:astro_mobile/theme_data/font_sizes.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../constant/app_images.dart';
import '../../../widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state is AuthStateLoggedOut) {
            if (state.exception is UserNotFoundException) {
              await showErrorDialog(
                  context, "Unable to find login. Account Not available");
            } else if (state.exception is UnauthorizedException) {
              await showErrorDialog(context,
                  "Unauthorized ERROR: Invalid Credentials. pls check your credentials");
            } else if (state.exception is InvalidCredentialException) {
              await showErrorDialog(context,
                  "Unauthorized ERROR: Invalid Credentials. pls check your credentials");
            } else if (state.exception is GenericException) {
              await showErrorDialog(context, "Authentication ERROR occurred");
            }
          }
        },
        child: Scaffold(
            backgroundColor: const Color.fromARGB(246, 255, 255, 255),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppVectors.star),
                      3.pw,
                      Image.asset(
                        AppImages.sukran,
                        width: 62.w,
                        height: 5.h,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  5.ph,
                  Text(
                    "Login Now",
                    style: TextStyle(
                        fontSize: 30,
                        color: AppColors.blueColor,
                        fontWeight: FontWeight.w600),
                  ),
                  0.5.ph,
                  Text(
                    "Please login to continue using our app",
                    style: TextStyle(
                        color: Colors.black, fontStyle: FontStyle.italic),
                  ),
                  3.ph,
                  Text(
                    "Email Id",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  1.ph,
                  CustomTextField(
                    hinttext: "Enter your Username",
                    controller: emailController,
                    prefixIcon: SvgPicture.asset(AppVectors.email, height: 18),
                  ),
                  2.ph,
                  Text(
                    "Password",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  1.ph,
                  CustomTextField(
                    hinttext: "Enter your password",
                    controller: passwordController,
                    prefixIcon:
                        SvgPicture.asset(AppVectors.password, height: 24),
                  ),
                  5.ph,
                  Center(
                    child: SizedBox(
                      height: 7.h,
                      width: screenWidth,
                      child: ElevatedButton(
                        onPressed: () {
                          final username = emailController.text;
                          final password = passwordController.text;
                          // context.read<AuthBloc>().add(AuthEventLoggedIn(
                          //     username: username, password: password));
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CustomBottomNav(
                                      userModel: null, profileByesData: null)));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: ThemeColor.mainThemeColor),
                        child: Center(
                            child: MediumText(
                          color: ThemeColor.white,
                          text: "Login",
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                            height: 20,
                            thickness: 1,
                            color: Colors.black.withValues(alpha: 0.1)),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Or",
                          textScaler: CustomTextScaler.headerThree,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: ThemeColor.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                            height: 20,
                            thickness: 1,
                            color: Colors.black.withValues(alpha: 0.1)),
                      ),
                    ],
                  ),
                  5.ph,
                  GoogleSignOnButton()
                ],
              ),
            )));
  }
}
