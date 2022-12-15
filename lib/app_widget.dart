import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:green_corp_app/presentation/landing_page/landing.dart';
import 'package:green_corp_app/presentation/splash_screen.dart';
import 'package:green_corp_app/presentation/user/login_screen.dart';
import 'package:green_corp_app/presentation/user/ro/ro_history.dart';
import 'package:green_corp_app/presentation/user/ro/ro_home.dart';
import 'package:green_corp_app/presentation/user/ro/ro_new_customer.dart';
import 'package:green_corp_app/theme.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: primaryColor,
        ),
      ),
      title: 'Green Corporation',
      initialRoute: '/',
      routes: {
        '/': (ctx) => SplashScreen(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
        Landing.routeName: (ctx) => Landing(),
        ROHome.routeName: (ctx) => ROHome(),
        RONewCustomer.routeName: (ctx) => RONewCustomer(),
        ROHistoryPage.routeName: (ctx) => ROHistoryPage(),
      },
    );
  }
}
