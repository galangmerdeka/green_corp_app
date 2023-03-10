import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:green_corp_app/application/auth/cubit/auth_cubit.dart';
import 'package:green_corp_app/application/created_data/cubit/created_data_cubit.dart';
import 'package:green_corp_app/application/driver_pickup_start/cubit/driver_pickup_start_cubit.dart';
import 'package:green_corp_app/application/driver_task/cubit/driver_task_cubit.dart';
import 'package:green_corp_app/application/history/cubit/history_cubit.dart';
import 'package:green_corp_app/application/inbox/cubit/inbox_cubit.dart';
import 'package:green_corp_app/application/inbox_check_status/cubit/check_status_cubit.dart';
import 'package:green_corp_app/presentation/landing_page/landing.dart';
import 'package:green_corp_app/presentation/splash_screen.dart';
import 'package:green_corp_app/presentation/user/driver/pickup_detail.dart';
import 'package:green_corp_app/presentation/user/driver/task.dart';
import 'package:green_corp_app/presentation/user/login_screen.dart';
import 'package:green_corp_app/presentation/user/ro/inbox.dart';
import 'package:green_corp_app/presentation/user/ro/repeat_customer.dart';
import 'package:green_corp_app/presentation/user/ro/ro_history.dart';
import 'package:green_corp_app/presentation/user/ro/ro_home.dart';
import 'package:green_corp_app/presentation/user/ro/add_customer.dart';
// import 'package:green_corp_app/providers/session_checker.dart';
// import 'package:green_corp_app/providers/auth.dart';
import 'package:green_corp_app/theme.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => CreatedDataCubit()),
        BlocProvider(create: (context) => DriverTaskCubit()),
        BlocProvider(create: (context) => DriverPickupCubit()),
        BlocProvider(create: (context) => HistoryCubit()),
        BlocProvider(create: (context) => InboxCubit()),
        BlocProvider(create: (context) => CheckStatusCubit())
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            backgroundColor: primaryColor,
          ),
        ),
        title: 'Green Corporation',
        initialRoute: '/',
        // home: ,
        routes: {
          '/': (ctx) => SplashScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          Landing.routeName: (ctx) => Landing(),
          ROHome.routeName: (ctx) => ROHome(),
          AddCustomer.routeName: (ctx) => AddCustomer(),
          RepeatCustomer.routeName: (ctx) => RepeatCustomer(),
          ROHistoryPage.routeName: (ctx) => ROHistoryPage(),
          Task.routeName: (ctx) => Task(),
          PickupDetail.routeName: (ctx) => PickupDetail(),
          InboxPage.routeName: (ctx) => InboxPage(),
        },
      ),
    );
  }
}
