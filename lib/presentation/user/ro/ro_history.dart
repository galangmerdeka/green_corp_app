import 'package:flutter/material.dart';
import 'package:green_corp_app/presentation/user/ro/ro_new_customer.dart';
import 'package:green_corp_app/presentation/widget/main_logo.dart';
import 'package:green_corp_app/theme.dart';
import 'package:get/get.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class ROHistoryPage extends StatefulWidget {
  const ROHistoryPage({super.key});
  static const routeName = '/ro/home/history';

  @override
  State<ROHistoryPage> createState() => _ROHistoryPageState();
}

class _ROHistoryPageState extends State<ROHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MainLogo(),
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                // width: double.infinity,
                child: HorizontalDataTable(
                  // horizontalScrollPhysics: ScrollPhysics(),
                  leftHandSideColumnWidth: 100,
                  rightHandSideColumnWidth:
                      MediaQuery.of(context).size.width * 3.58,
                  // double.infinity,
                  // leftHandSideColBackgroundColor: Color(0xFF2A2A2A),
                  // rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
                  isFixedHeader: true,
                  rowSeparatorWidget: const Divider(
                    color: Colors.black54,
                    height: 1.0,
                    thickness: 1.0,
                  ),
                  headerWidgets: getTitleWidget(),
                  leftSideItemBuilder: generateFirstColumnRow,
                  rightSideItemBuilder: generateRightHandSideColumnRow,
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      child: Text("2022/09/09"),
      width: 50,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          child: Text("C-0001"),
          width: 200,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text("ORD-001"),
          width: 200,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text("Usaha Babe"),
          width: 200,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text("Agus"),
          width: 200,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text("10"),
          width: 200,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text("Persetujuan"),
          width: 200,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: IconButton(
            onPressed: () {
              Get.toNamed(RONewCustomer.routeName, arguments: "edit");
            },
            icon: Icon(Icons.edit_rounded),
            color: buttonColor,
          ),
          width: 200,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }

  List<Widget> getTitleWidget() {
    return [
      getTitleItemWidget("Date"),
      getTitleItemWidget("ID Pelanggan"),
      getTitleItemWidget("Order ID"),
      getTitleItemWidget("Nama Usaha"),
      getTitleItemWidget("PIC"),
      getTitleItemWidget("Qty"),
      getTitleItemWidget("Status"),
      getTitleItemWidget("Action"),
    ];
  }

  Widget getTitleItemWidget(String label) {
    return Container(
      child: Text(
        label,
        style: primaryTextStyle.copyWith(fontWeight: bold),
      ),
      width: 200,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }
}
