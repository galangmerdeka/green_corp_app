import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_corp_app/config/constant.dart';
import 'package:green_corp_app/presentation/landing_page/landing.dart';
import 'package:green_corp_app/presentation/user/login_screen.dart';
import 'package:green_corp_app/providers/session_checker.dart';
// import 'package:green_corp_app/providers/session_checker.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:green_corp_app/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = false;
  // bool isSession = false;
  // String? hasToken;
  // SessionChecker _sessionChecker = SessionChecker();

  @override
  void initState() {
    // TODO: implement initState
    // getSessionInfo();

    getInit();
    // print("Token : " + hasToken.toString());
    isLoading = true;
    super.initState();
  }

  // Future getSessionInfo() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   hasToken = prefs.getString("token");
  //   if (hasToken != null) {
  //     setState(() {
  //       isSession = true;
  //     });
  //   }
  // }

  getInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var hasToken = prefs.getString("token") ?? null;
    print("Token : $hasToken");
    Timer(Duration(seconds: 1), () {
      Get.offAll(
        () => (hasToken == null) ? LoginScreen() : Landing(),
      );
    });
    // await getSessionInfo().then(
    //   (value) => Get.offAll(
    //     () =>
    //         // print("Hasil Session : $isSession");
    //         (isSession!) ? LoginScreen() : Landing(),
    //   ),
    // );
    // Future.delayed(Duration(seconds: 2), () {
    //   Get.offAll(() => LoginScreen());
    // });

    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: widthMainLogo,
              height: heightMainLogo,
              decoration: mainLogoDecoration,
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage(
              //       'assets/images/logo_green_corp.png',
              //     ),
              //   ),
              // ),
            ),
            (isLoading == false)
                ? Container()
                : CircularProgressIndicator(
                    color: primaryTextColor,
                  ),
            Container(
              // color: Colors.red,
              padding: EdgeInsets.only(
                top: 100,
              ),
              child: Text(
                COPYRIGHT,
                style: primaryTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
