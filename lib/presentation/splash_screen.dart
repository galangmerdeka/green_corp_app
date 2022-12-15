import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_corp_app/config/constant.dart';
import 'package:green_corp_app/presentation/user/login_screen.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:green_corp_app/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    getInit();
    isLoading = true;
    super.initState();
  }

  getInit() async {
    Future.delayed(Duration(seconds: 2), () {
      Get.offAll(() => LoginScreen());
    });
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
