import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_corp_app/presentation/user/ro/ro_home.dart';
import 'package:green_corp_app/presentation/widget/appbar_custom.dart';
import 'package:green_corp_app/theme.dart';
// import 'package:flutter/src/widgets/framework.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});
  static const routeName = '/landing';

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _menuList = [
      {
        'title': 'ro',
        'url': "assets/icon/vector_1.png",
        'is_active': true,
      },
      {
        'title': null,
        'url': "assets/icon/vector_2.png",
        'is_active': true,
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
        'title': null,
        'url': "assets/icon/vector_5.png",
        'is_active': true,
      },
    ];
    return Scaffold(
      appBar: AppBarCustom(context),
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
                                if (_menuList[index]['title'] == 'ro') {
                                  Get.toNamed(ROHome.routeName);
                                } else {
                                  null;
                                }
                              },
                        child: ImageIcon(
                          AssetImage(
                            _menuList[index]['url'],
                          ),
                          color: (_menuList[index]['is_active'] == true)
                              ? buttonColor
                              : buttonColorGrey,
                          size: 20,
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
