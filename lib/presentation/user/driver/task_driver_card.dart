import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_corp_app/application/driver_pickup_start/cubit/driver_pickup_start_cubit.dart';
import 'package:green_corp_app/application/driver_task/cubit/driver_task_cubit.dart';
// import 'package:green_corp_app/config/input_validation.dart';
// import 'package:green_corp_app/infrastructure/driver/driver_service.dart';
import 'package:green_corp_app/model/driver/pickup.dart';
import 'package:green_corp_app/presentation/user/driver/pickup_detail.dart';
import 'package:green_corp_app/presentation/user/driver/task.dart';
import 'package:green_corp_app/presentation/widget/no_data_found.dart';
import 'package:green_corp_app/presentation/widget/snackbar_custom.dart';
import 'package:green_corp_app/presentation/widget/text_field.dart';
import 'package:green_corp_app/theme.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Future<String> testButton() {
//   return Future.delayed(Duration(seconds: 2), () {
//     print("Clicked");
//     return "Test Success";
//   });
// }

Column taskDriverCard(BuildContext context, List<PickupModel?> _data) {
  final _formKey = GlobalKey<FormState>();
  TextEditingController rescheduleDate = TextEditingController();
  return Column(
    children: [
      Container(
        // color: Colors.green,
        child: BlocConsumer<DriverPickupCubit, DriverPickupState>(
          listener: (context, state) async {
            // TODO: implement listener
            if (state is DriverPickupStartLoading) {
              print("Sending Data Start Time...");
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Container(
                      child: CircularProgressIndicator(),
                    ),
                    title: Text(
                      "Loading...",
                      style: secondaryTextStyle,
                    ),
                  );
                },
              );
            } else if (state is DriverPickupStartError) {
              alertDialogErrorStart(context, state);
            } else if (state is DriverPickupStartSucces) {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              var snackbar = SnackBarCustom(title: state.successMessage);
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
              context
                  .read<DriverTaskCubit>()
                  .getDataDriverTaskByDriverID(prefs.getString("user_id")!);
              Get.toNamed(Task.routeName);
            } else if (state is DriverRescheduleLoading) {
              print("Sending Reschedule Request...");
            } else if (state is DriverRescheduleError) {
              alertDialogErrorReschedule(context, state);
            } else if (state is DriverRescheduleSuccess) {
              var snackbar = SnackBarCustom(title: state.successMessage);
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
              Get.back();
            }
          },
          builder: (context, state) {
            return (_data.length > 0)
                ? ListView.builder(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: ElevatedButton.icon(
                                          style: ButtonStyle(
                                            // MaterialStateProperty<Color?>?
                                            backgroundColor:
                                                MaterialStatePropertyAll((_data[
                                                                index]!
                                                            .pickup_start_time !=
                                                        null)
                                                    ? buttonColorGrey
                                                    : buttonColor),
                                          ),
                                          label: Text(
                                            "Start Time",
                                            style: primaryTextStyle.copyWith(
                                              color: primaryColor,
                                            ),
                                          ),
                                          onPressed: (_data[index]!
                                                      .pickup_start_time !=
                                                  null)
                                              ? null
                                              : () async {
                                                  context
                                                      .read<DriverPickupCubit>()
                                                      .startPickupByTransID(
                                                          _data[index]!.id!);
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
                                                MaterialStatePropertyAll((_data[
                                                                index]!
                                                            .pickup_start_time !=
                                                        null)
                                                    ? buttonColor
                                                    : buttonColorGrey),
                                          ),
                                          label: Text(
                                            "Pickup",
                                            style: primaryTextStyle.copyWith(
                                              color: primaryColor,
                                            ),
                                          ),
                                          onPressed: (_data[index]!
                                                      .pickup_start_time !=
                                                  null)
                                              ? () {
                                                  // print("Clicked");
                                                  Get.toNamed(
                                                    PickupDetail.routeName,
                                                    arguments: {
                                                      "transaction_id":
                                                          _data[index]!.id,
                                                      "pelanggan_code":
                                                          _data[index]!
                                                              .customer!
                                                              .code_pelanggan!,
                                                      "order_code":
                                                          _data[index]!
                                                              .order_code!,
                                                      "user_created_name":
                                                          _data[index]!
                                                              .user_created!
                                                              .name!,
                                                      "gudang_name": _data[
                                                              index]!
                                                          .gudang!
                                                          .kabupaten_kota_name!,
                                                      "nama_usaha":
                                                          _data[index]!
                                                              .customer!
                                                              .nama_usaha!,
                                                      "nama_pj": _data[index]!
                                                          .customer!
                                                          .nama_pj!,
                                                      "phone_number":
                                                          _data[index]!
                                                              .customer!
                                                              .phone_number!,
                                                      "alamat": _data[index]!
                                                          .customer!
                                                          .alamat!,
                                                      "kemasan": _data[index]!
                                                          .packaging!
                                                          .title!,
                                                      "jenis_uco": (_data[
                                                                      index]!
                                                                  .jenis_uco! ==
                                                              "P")
                                                          ? "Padat"
                                                          : "Cair",
                                                      "quantity_liter":
                                                          _data[index]!
                                                              .quantity_liter
                                                              .toString(),
                                                      "quantity_kg":
                                                          _data[index]!
                                                              .quantity_kg
                                                              .toString(),
                                                      "total_kemasan":
                                                          _data[index]!
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
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  scrollable: true,
                                                  title: Text(
                                                    "Form Reschedule",
                                                    style: secondaryTextStyle,
                                                  ),
                                                  content: Padding(
                                                    padding: EdgeInsets.all(8),
                                                    child: Form(
                                                      key: _formKey,
                                                      child: Column(
                                                        children: [
                                                          TextFieldWidget(
                                                            context,
                                                            isReadOnly: true,
                                                            iconField: Icons
                                                                .date_range_rounded,
                                                            obsText: false,
                                                            textController:
                                                                rescheduleDate,
                                                            label:
                                                                "Select Date",
                                                            tap: () async {
                                                              DateTime? picked =
                                                                  await showDatePicker(
                                                                context:
                                                                    context,
                                                                initialDate:
                                                                    DateTime
                                                                        .now(),
                                                                firstDate: DateTime
                                                                        .now()
                                                                    .subtract(
                                                                  Duration(
                                                                      days: 0),
                                                                ),
                                                                lastDate:
                                                                    DateTime(
                                                                        2100),
                                                              );
                                                              if (picked !=
                                                                  null) {
                                                                String
                                                                    formattedDate =
                                                                    DateFormat(
                                                                            'yyyy-MM-dd')
                                                                        .format(
                                                                            picked);

                                                                rescheduleDate
                                                                        .text =
                                                                    formattedDate;
                                                                // print(
                                                                //   "Date : " +
                                                                //       rescheduleDate
                                                                //           .text,
                                                                // );
                                                              }
                                                            },
                                                            validatorField:
                                                                (value) {
                                                              if (value!
                                                                  .isEmpty) {
                                                                return "Tanggal wajib diisi";
                                                              }
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  actions: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        ElevatedButton(
                                                          style:
                                                              buttonStyleForForm
                                                                  .copyWith(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(
                                                              buttonColorGrey,
                                                            ),
                                                          ),
                                                          onPressed: () =>
                                                              Get.back(),
                                                          child: Text(
                                                            "Cancel",
                                                            style:
                                                                secondaryTextStyle,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            if (_formKey
                                                                .currentState!
                                                                .validate()) {
                                                              // print("Data Trans ID: " +
                                                              //     _data[index]!.id!);
                                                              // print("Date : " +
                                                              //     rescheduleDate.text);

                                                              context
                                                                  .read<
                                                                      DriverPickupCubit>()
                                                                  .rescheduleRequest(
                                                                    _data[index]!
                                                                        .id!,
                                                                    rescheduleDate
                                                                        .text,
                                                                  );
                                                            }
                                                          },
                                                          child: (state
                                                                  is DriverRescheduleLoading)
                                                              ? Center(
                                                                  child:
                                                                      CircularProgressIndicator(),
                                                                )
                                                              : Text(
                                                                  "Submit",
                                                                  style:
                                                                      secondaryTextStyle,
                                                                ),
                                                          style:
                                                              buttonStyleForForm
                                                                  .copyWith(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(
                                                              buttonColor,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
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
                  )
                : noDataFound(context, () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    context.read<DriverTaskCubit>().getDataDriverTaskByDriverID(
                        prefs.getString("user_id")!);
                    Get.toNamed(Task.routeName);
                  });
          },
        ),
      ),
    ],
  );
}

Future<dynamic> alertDialogErrorStart(
    BuildContext context, DriverPickupStartError state) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        icon: Icon(
          Icons.error_outline_rounded,
          size: 34,
          color: Colors.redAccent,
        ),
        title: Text(
          state.errMessage,
          style: secondaryTextStyle,
        ),
        actions: [
          Center(
            child: ElevatedButton.icon(
              onPressed: () => Get.back(),
              icon: Icon(Icons.close_outlined),
              label: Text("Close"),
            ),
          ),
        ],
      );
    },
  );
}

Future<dynamic> alertDialogErrorReschedule(
    BuildContext context, DriverRescheduleError state) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        icon: Icon(
          Icons.error_outline_rounded,
          size: 34,
          color: Colors.redAccent,
        ),
        title: Text(
          state.errMessage,
          style: secondaryTextStyle,
        ),
        actions: [
          Center(
            child: ElevatedButton.icon(
              onPressed: () => Get.back(),
              icon: Icon(Icons.close_outlined),
              label: Text("Close"),
            ),
          ),
        ],
      );
    },
  );
}
