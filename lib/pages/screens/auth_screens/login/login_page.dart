import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/auth/auth_bloc.dart';
import 'package:flutter_app/bloc/auth/auth_event.dart';
import 'package:flutter_app/bloc/auth/auth_state.dart';
import 'package:flutter_app/common_widget/dialogs/error_dialog.dart';
import 'package:flutter_app/constant/assets.dart';
import 'package:flutter_app/framework/infrastructure/exceptions/auth_exception.dart';
import 'package:flutter_app/pages/screens/auth_screens/forgot_password/forgot_password_page.dart';
import 'package:flutter_app/pages/widgets/other_login_button_widgets/google_sign_on_button.dart';
import 'package:flutter_app/pages/widgets/text_field.dart';
import 'package:flutter_app/themedata/custom_text_scaler.dart';
import 'package:flutter_app/themedata/fontSizes.dart';
import 'package:flutter_app/themedata/themecolor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _username;
  late TextEditingController _password;

  @override
  void initState() {
    _username = TextEditingController();
    _password = TextEditingController();
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
                  SizedBox(
                    height: .1.sh,
                  ),
                  Center(
                    child: SizedBox(
                        height: 25.h,
                        child: const Image(
                          image: AssetImage(AppImageAssets.filmiLogoImage),
                          alignment: Alignment.center,
                        )),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitleText(
                          text: "Login",
                          color: ThemeColor.black,
                          fontweight: FontWeight.bold)
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                      width: screenWidth,
                      child: SmallMediumText(
                          color: ThemeColor.black, text: "E-mail")),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                      child: LoginTextField(
                    "Enter your email",
                    controller: _username,
                    hint: "Enter you email",
                  )),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                      width: screenWidth,
                      child: SmallMediumText(
                        color: ThemeColor.black,
                        text: "Password",
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                      child: PasswordTextField(
                    label: "Enter your Password",
                    controller: _password,
                    hint: "Enter your password",
                  )),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPasswordPage()));
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue,
                                fontWeight: FontWeight.w500,
                                decorationStyle: TextDecorationStyle.solid),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: SizedBox(
                      height: 45.h,
                      width: screenWidth,
                      child: ElevatedButton(
                        onPressed: () {
                          final username = _username.text;
                          final password = _password.text;
                          context.read<AuthBloc>().add(AuthEventLoggedIn(
                              username: username, password: password));
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
                    height: 30.h,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                              height: 20,
                              thickness: 2,
                              color: ThemeColor.lightGrey),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "or login with",
                            textScaler: CustomTextScaler.headerThree,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: ThemeColor.darkGrey),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                              height: 20,
                              thickness: 2,
                              color: ThemeColor.lightGrey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GoogleSignOnButton(),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
