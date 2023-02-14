// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_corp_app/application/auth/cubit/auth_cubit.dart';
// import 'package:green_corp_app/model/user.dart';
// import 'package:green_corp_app/providers/auth.dart';
// import 'package:http/http.dart' as http;
import 'package:green_corp_app/config/constant.dart';
import 'package:green_corp_app/config/input_validation.dart';
// import 'package:green_corp_app/domain/user/user.dart';
// import 'package:green_corp_app/model/model_user.dart';
import 'package:green_corp_app/presentation/landing_page/landing.dart';
import 'package:green_corp_app/presentation/widget/text_field.dart';
import 'package:green_corp_app/theme.dart';
// import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with InputValidation {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  // TextEditingController _passwordController =
  //     TextEditingController(text: "GreenCorp100%!");
  TextEditingController _passwordController = TextEditingController();
  int loginFailedCounter = 0;

  loading() async {
    Future.delayed(
      Duration(seconds: 10),
    );
    isLoading = false;
  }

  updateLoginFailedCounter() {
    if (loginFailedCounter <= LIMIT_LOGIN_FAILED) {
      setState(() {
        loginFailedCounter += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) async {
        // TODO: implement listener
        if (state is AuthLoading) {
          print("Sign In Loading");
        } else if (state is AuthError) {
          print("Login Error : " + state.errMessage);
          alertErrorDialog(context, state.errMessage);
        } else if (state is AuthSuccess) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          // Get.offAllNamed(Landing.routeName, arguments: state.user.type_user);
          print("Login Sukses : ${state.user.name}");
          print("Token : ${state.user.token}");
          Get.offAll(() => Landing(), arguments: prefs.getString("role"));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: widthMainLogo,
                      height: heightMainLogo,
                      padding: EdgeInsets.only(
                        top: 105,
                        left: 30,
                        right: 30,
                      ),
                      decoration: mainLogoDecoration,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Container(
                      child: Text(
                        TITLE_LOGIN,
                        style: secondaryTextStyle.copyWith(
                          fontWeight: regular,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 34,
                    ),
                    Form(
                      key: _formKey,
                      child: Container(
                        padding: EdgeInsets.only(
                          left: FieldPadding,
                          right: FieldPadding,
                        ),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Username Field
                            TextFieldWidget(
                              context,
                              iconField: Icons.person_rounded,
                              // hintText: "NIK",
                              obsText: false,
                              textController: _usernameController,
                              label: "NIK",
                              validatorField: (value) {
                                if (isUsernameValid(value!)) {
                                  return null;
                                } else if (value.isEmpty) {
                                  return "Field NIK wajib diisi";
                                }
                                return "Nik minimal 3 karakter dan maksimal 8 karakter";
                              },
                            ),
                            SizedBox(
                              height: 34,
                            ),
                            // Password Field
                            TextFieldWidget(
                              context,
                              iconField: Icons.lock_rounded,
                              // hintText: "Password",
                              obsText: true,
                              textController: _passwordController,
                              label: "Password",
                              validatorField: (value) {
                                if (isPasswordValid(value!)) {
                                  return null;
                                } else if (value.isEmpty) {
                                  return "Password wajib diisi";
                                }
                                return "Password minimal 5 karakter";
                              },
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              width: double.infinity,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: (state is AuthLoading)
                                    ? null
                                    : () {
                                        if (_formKey.currentState!.validate()) {
                                          context.read<AuthCubit>().signInUser(
                                              _usernameController.text,
                                              _passwordController.text);
                                        }
                                      },
                                // onPressed: (loginFailedCounter < LIMIT_LOGIN_FAILED)
                                //     ? () async {
                                //         if (_formKey.currentState!.validate()) {
                                //           var getUser = await DUMMY_USER
                                //               .contains(_usernameController.text);
                                //           if (getUser) {
                                //             Get.offAllNamed(Landing.routeName,
                                //                 arguments:
                                //                     _usernameController.text);
                                //             setState(() {
                                //               loginFailedCounter = 0;
                                //             });
                                //           } else {
                                //             print("Cannot Find a User");
                                //             updateLoginFailedCounter();
                                //             print(
                                //               "failed counter = ${loginFailedCounter}",
                                //             );

                                //             showDialog(
                                //               context: context,
                                //               builder: (context) {
                                //                 return AlertDialog(
                                //                   icon: Icon(
                                //                     Icons.error_outline_rounded,
                                //                     size: 34,
                                //                     color: Colors.redAccent,
                                //                   ),
                                //                   title: Text(
                                //                     (loginFailedCounter ==
                                //                             LIMIT_LOGIN_FAILED)
                                //                         ? "NIK has been locked, please call the Administrator"
                                //                         : "Cannot Find a User with ${_usernameController.text}",
                                //                   ),
                                //                 );
                                //               },
                                //             );
                                //           }
                                //         }
                                //       }
                                //     : null,
                                style: buttonStyleForForm.copyWith(
                                  backgroundColor: MaterialStateProperty.all(
                                    (loginFailedCounter < LIMIT_LOGIN_FAILED)
                                        ? buttonColor
                                        : buttonColorGrey,
                                  ),
                                ),
                                child: (state is AuthLoading)
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : Text(
                                        "Sign In",
                                        style: secondaryTextStyle.copyWith(
                                          fontWeight: bold,
                                          fontSize: 16,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> alertErrorDialog(BuildContext context, String data) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: Icon(
            Icons.error_outline_rounded,
            size: 34,
            color: Colors.redAccent,
          ),
          title: Text(
            (loginFailedCounter == LIMIT_LOGIN_FAILED)
                ? "NIK has been locked, please call the Administrator"
                : data,
          ),
          actions: [
            Center(
              child: ElevatedButton.icon(
                onPressed: () => Get.back(),
                icon: Icon(Icons.close_outlined),
                label: Text("Close"),
              ),
            ),
          ],
        );
      },
    );
  }
}
