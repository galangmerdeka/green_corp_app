import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:green_corp_app/presentation/user/driver/pickup_detail.dart';
import 'package:green_corp_app/presentation/widget/appbar_custom.dart';
import 'package:green_corp_app/theme.dart';

class Task extends StatefulWidget {
  const Task({super.key});
  static const routeName = '/driver/task';

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  List<Map<String, dynamic>> _taskDriver = [
    {
      "order_id": "ORD-001",
      "nama_usaha": "Hotel Ave Kalimantan",
      "pic": "Agus",
      "no_telp": "098973884732",
      "address":
          "Jln. Perum Suka Sukakec.Ledo, Kel.Sabalo Bengkayang Kalimantan",
      "liter": 3750,
    },
    {
      "order_id": "ORD-001",
      "nama_usaha": "Hotel Ave Kalimantan",
      "pic": "Agus",
      "no_telp": "098973884732",
      "address":
          "Jln. Perum Suka Sukakec.Ledo, Kel.Sabalo Bengkayang Kalimantan",
      "liter": 3750,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(context, "Driver Task"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // color: Colors.green,
                child: ListView.builder(
                  itemCount: _taskDriver.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  // itemExtent: 120,
                  itemBuilder: (context, index) {
                    return Container(
                      // color: Colors.green,
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 5,
                      ),
                      child: Card(
                        elevation: 2,
                        child: Container(
                          // color: Colors.green,
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spac,
                            children: [
                              Container(
                                child: Text(
                                  _taskDriver[index]["nama_usaha"],
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.phone_iphone_rounded,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      _taskDriver[index]["no_telp"],
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: regular,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.home_rounded,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      child: Expanded(
                                        child: Text(
                                          _taskDriver[index]["address"],
                                          // overflow: TextOverflow.ellipsis,
                                          style: primaryTextStyle.copyWith(
                                            fontSize: 14,
                                            fontWeight: regular,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.oil_barrel_rounded,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "${_taskDriver[index]["liter"].toString()} Lt | ",
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: regular,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                // color: Colors.red,
                                // width: double.infinity,
                                padding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: ElevatedButton.icon(
                                        style: ButtonStyle(
                                          // MaterialStateProperty<Color?>?
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  buttonColor),
                                        ),
                                        label: Text(
                                          "Start Time",
                                          style: primaryTextStyle.copyWith(
                                            color: primaryColor,
                                          ),
                                        ),
                                        onPressed: () {
                                          // print("Clicked");
                                        },
                                        icon: Icon(
                                          Icons.access_time_filled_sharp,
                                          size: 20,
                                          // color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: ElevatedButton.icon(
                                        style: ButtonStyle(
                                          // MaterialStateProperty<Color?>?
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  buttonColor),
                                        ),
                                        label: Text(
                                          "Pickup",
                                          style: primaryTextStyle.copyWith(
                                            color: primaryColor,
                                          ),
                                        ),
                                        onPressed: () {
                                          // print("Clicked");
                                          Get.toNamed(PickupDetail.routeName);
                                        },
                                        icon: Icon(
                                          Icons.card_travel_rounded,
                                          size: 20,
                                          // color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: ElevatedButton.icon(
                                        style: ButtonStyle(
                                          // MaterialStateProperty<Color?>?
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  buttonColor),
                                        ),
                                        label: Text(
                                          "Reschedule",
                                          style: primaryTextStyle.copyWith(
                                            color: primaryColor,
                                          ),
                                        ),
                                        onPressed: () {
                                          // print("Clicked");
                                        },
                                        icon: Icon(
                                          Icons.refresh_rounded,
                                          size: 20,
                                          // color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
