import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_corp_app/model/user/role.dart';
// import 'package:green_corp_app/model/model_user.dart';
import 'package:green_corp_app/presentation/user/driver/task.dart';
import 'package:green_corp_app/presentation/user/ro/ro_home.dart';
import 'package:green_corp_app/presentation/widget/appbar_custom.dart';
import 'package:green_corp_app/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/src/widgets/framework.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});
  static const routeName = '/landing';

  @override
  Widget build(BuildContext context) {
    Role dataRole = new Role();
    // var _user = ModalRoute.of(context)!.settings.arguments as String;
    Future<String?> getRoleUser() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      var role = prefs.getString("role");
      print("Role : $role");
      return role;
    }

    // bool roleActiveSales =
    //     dataRole.slug!.contains(getRoleUser() as Pattern) ? true : false;
    // bool roleActiveDriver =
    //     dataRole.slug!.contains(getRoleUser() as Pattern) ? true : false;

    // var role = getRoleUser();
    final List<Map<String, dynamic>> _menuList = [
      {
        'title': 'RO',
        'url': "assets/icon/vector_1.png",
        'is_active': true,
      },
      {
        'title': 'PENJUALAN',
        'url': "assets/icon/vector_2.png",
        'is_active': false,
      },
      {
        'title': null,
        'url': "assets/icon/vector_3.png",
        'is_active': false,
      },
      {
        'title': null,
        'url': "assets/icon/vector_4.png",
        'is_active': false,
      },
      {
        'title': 'DRIVER',
        'url': "assets/icon/vector_5.png",
        'is_active': true,
      },
    ];
    return Scaffold(
      appBar: AppBarCustom(context, "Green Corp App"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // color: Colors.red,
                height: 317,
                width: double.infinity,
                decoration: bgHeaderDecoration,
              ),
              SizedBox(
                height: 63,
              ),
              Container(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _menuList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 50,
                    childAspectRatio: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: GestureDetector(
                        // behavior: HitTestBehavior.opaque,
                        onTap: (_menuList[index]['is_active'] == false)
                            ? null
                            : () {
                                print(_menuList[index]['url']);
                                if (_menuList[index]['title'] == 'RO') {
                                  Get.toNamed(ROHome.routeName);
                                } else if (_menuList[index]['title'] ==
                                    'DRIVER') {
                                  Get.toNamed(Task.routeName);
                                } else {
                                  null;
                                }
                              },
                        child: Column(
                          children: [
                            ImageIcon(
                              AssetImage(
                                _menuList[index]['url'],
                              ),
                              color: (_menuList[index]['is_active'] == true)
                                  ? buttonColor
                                  : buttonColorGrey,
                              size: 30,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              (_menuList[index]["title"] == null)
                                  ? "UNTITLED"
                                  : _menuList[index]["title"],
                              style: secondaryTextStyle.copyWith(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
