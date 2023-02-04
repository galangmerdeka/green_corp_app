import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:green_corp_app/application/history/cubit/history_cubit.dart';
import 'package:green_corp_app/application/inbox/cubit/inbox_cubit.dart';
import 'package:green_corp_app/presentation/user/ro/inbox.dart';
import 'package:green_corp_app/presentation/user/ro/repeat_customer.dart';
import 'package:green_corp_app/presentation/user/ro/ro_history.dart';
import 'package:green_corp_app/presentation/user/ro/add_customer.dart';
import 'package:green_corp_app/presentation/widget/appbar_custom.dart';
import 'package:green_corp_app/presentation/widget/main_logo.dart';
import 'package:green_corp_app/theme.dart';

class ROHome extends StatelessWidget {
  const ROHome({super.key});
  static const routeName = '/ro/home';

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _menuList = [
      {
        "title": "New Customer",
        "code": "new",
        "icon": Icons.person_add_alt_rounded,
        "route": AddCustomer.routeName,
        "is_active": true,
      },
      {
        "title": "Repeat Customer",
        "code": "ro",
        "icon": Icons.repeat_on_rounded,
        "route": AddCustomer.routeName,
        "is_active": true,
      },
      {
        "title": "History",
        "code": "hist",
        "icon": Icons.work_history_rounded,
        "route": ROHistoryPage.routeName,
        "is_active": true,
      },
      {
        "title": "Inbox",
        "code": "inbox",
        "icon": Icons.inbox_rounded,
        "route": InboxPage.routeName,
        "is_active": true,
      },
    ];
    return Scaffold(
      appBar: AppBarCustom(context, "RO"),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                MainLogo(),
                SizedBox(
                  height: 50,
                ),
                Container(
                  // color: Colors.red,
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: Column(
                    children: [
                      menu_ro_widget(_menuList, 0, () {
                        Get.toNamed(
                          _menuList[0]["route"],
                          arguments: {
                            "code_screen": _menuList[0]["code"].toString()
                          },
                        );
                      }),
                      SizedBox(
                        height: 20,
                      ),
                      menu_ro_widget(_menuList, 1, () {
                        Get.toNamed(
                          _menuList[1]["route"],
                          arguments: {
                            "code_screen": _menuList[1]["code"].toString()
                          },
                        );
                      }),
                      SizedBox(
                        height: 20,
                      ),
                      menu_ro_widget(_menuList, 2, () {
                        context.read<HistoryCubit>().getHistory();
                        Get.toNamed(
                          _menuList[2]["route"],
                        );
                      }),
                      SizedBox(
                        height: 20,
                      ),
                      menu_ro_widget(_menuList, 3, () {
                        context.read<InboxCubit>().getInbox();
                        Get.toNamed(
                          _menuList[3]["route"],
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column menu_ro_widget(
      List<Map<String, dynamic>> _menuList, int index, Function()? routing) {
    return Column(
      children: [
        GestureDetector(
          onTap: (_menuList[index]["is_active"] == false) ? null : routing,
          child: Container(
            child: Icon(
              _menuList[index]["icon"],
              size: 80,
              color: buttonColor,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          _menuList[index]["title"],
          style: primaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      ],
    );
  }

  ElevatedButton btnROHome({
    required Function() routePage,
    required String textButton,
  }) {
    return ElevatedButton(
      onPressed: routePage,
      child: Text(
        textButton,
        style: primaryTextStyle.copyWith(
          fontSize: 16,
          fontWeight: bold,
          color: primaryTextColor,
        ),
      ),
      style: buttonStyleForNotForm.copyWith(
        backgroundColor: MaterialStateProperty.all(buttonROHome),
      ),
    );
  }
}
