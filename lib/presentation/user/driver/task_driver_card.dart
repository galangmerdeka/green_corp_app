import 'package:flutter/material.dart';
import 'package:green_corp_app/model/driver/pickup.dart';
import 'package:green_corp_app/presentation/user/driver/pickup_detail.dart';
import 'package:green_corp_app/theme.dart';
import 'package:get/get.dart';

Column taskDriverCard(BuildContext context, List<PickupModel?> _data) {
  return Column(
    children: [
      Container(
        // color: Colors.green,
        child: ListView.builder(
          // itemCount: _taskDriver.length,
          itemCount: _data.length,
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
                          _data[index]!.customer!.nama_usaha!,
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
                              "0${_data[index]!.customer!.phone_number!}",
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
                                  _data[index]!.customer!.alamat!,
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
                              "${_data[index]!.quantity_liter.toString()} Lt | ${_data[index]!.quantity_kg.toString()} Kg ",
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 3,
                              child: ElevatedButton.icon(
                                style: ButtonStyle(
                                  // MaterialStateProperty<Color?>?
                                  backgroundColor: MaterialStatePropertyAll(
                                      (_data[index]!.pickup_start_time != null)
                                          ? buttonColorGrey
                                          : buttonColor),
                                ),
                                label: Text(
                                  "Start Time",
                                  style: primaryTextStyle.copyWith(
                                    color: primaryColor,
                                  ),
                                ),
                                onPressed:
                                    (_data[index]!.pickup_start_time != null)
                                        ? null
                                        : () {
                                            print("clicked");
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
                                  backgroundColor: MaterialStatePropertyAll(
                                      (_data[index]!.pickup_start_time != null)
                                          ? buttonColor
                                          : buttonColorGrey),
                                ),
                                label: Text(
                                  "Pickup",
                                  style: primaryTextStyle.copyWith(
                                    color: primaryColor,
                                  ),
                                ),
                                onPressed: (_data[index]!.pickup_start_time !=
                                        null)
                                    ? () {
                                        // print("Clicked");
                                        Get.toNamed(
                                          PickupDetail.routeName,
                                          arguments: {
                                            "pelanggan_code": _data[index]!
                                                .customer!
                                                .code_pelanggan!,
                                            "order_code":
                                                _data[index]!.order_code!,
                                            "user_created_name": _data[index]!
                                                .user_created!
                                                .name!,
                                            "gudang_name": _data[index]!
                                                .gudang!
                                                .kabupaten_kota_name!,
                                            "nama_usaha": _data[index]!
                                                .customer!
                                                .nama_usaha!,
                                            "nama_pj": _data[index]!
                                                .customer!
                                                .nama_pj!,
                                            "phone_number": _data[index]!
                                                .customer!
                                                .phone_number!,
                                            "alamat":
                                                _data[index]!.customer!.alamat!,
                                            "kemasan":
                                                _data[index]!.packaging!.title!,
                                            "jenis_uco":
                                                (_data[index]!.jenis_uco! ==
                                                        "P")
                                                    ? "Padat"
                                                    : "Cair",
                                            "quantity_liter": _data[index]!
                                                .quantity_liter
                                                .toString(),
                                            "quantity_kg": _data[index]!
                                                .quantity_kg
                                                .toString(),
                                            "total_kemasan": _data[index]!
                                                .total_kemasan
                                                .toString(),
                                          },
                                        );
                                      }
                                    : null,
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
                                      MaterialStatePropertyAll(buttonColor),
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
  );
}
