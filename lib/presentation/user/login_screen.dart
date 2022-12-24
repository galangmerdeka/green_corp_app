import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_corp_app/config/constant.dart';
import 'package:green_corp_app/config/input_validation.dart';
import 'package:green_corp_app/domain/user/user.dart';
import 'package:green_corp_app/model/model_user.dart';
import 'package:green_corp_app/presentation/landing_page/landing.dart';
import 'package:green_corp_app/presentation/widget/text_field.dart';
import 'package:green_corp_app/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with InputValidation {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // List<User>? dataUser;
  List<Map<String, dynamic>> dataUser = [
    {"nik": "12344", "password": "12345678", "role": "sales_ro"},
    {"nik": "12345", "password": "12345678", "role": "driver"},
  ];

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
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Get.offAllNamed(Landing.routeName);
                              }
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
