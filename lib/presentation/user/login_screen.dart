import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_corp_app/config/constant.dart';
import 'package:green_corp_app/presentation/landing_page/landing.dart';
import 'package:green_corp_app/presentation/widget/text_field.dart';
import 'package:green_corp_app/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                        TextFieldWidget(context,
                            iconField: Icons.person_rounded,
                            // hintText: "NIK",
                            obsText: false,
                            textController: _usernameController,
                            label: "NIK"),
                        SizedBox(
                          height: 34,
                        ),
                        // Password Field
                        TextFieldWidget(context,
                            iconField: Icons.lock_rounded,
                            // hintText: "Password",
                            obsText: true,
                            textController: _passwordController,
                            label: "Password"),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.offAllNamed(Landing.routeName);
                            },
                            style: buttonStyleForForm.copyWith(
                              backgroundColor:
                                  MaterialStateProperty.all(buttonColor),
                            ),
                            child: Text(
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
  }
}
