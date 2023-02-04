import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_corp_app/application/driver_pickup_start/cubit/driver_pickup_start_cubit.dart';
import 'package:green_corp_app/model/driver/pickup.dart';
import 'package:green_corp_app/presentation/widget/text_field.dart';
import 'package:green_corp_app/presentation/widget/text_field_without_icon.dart';
import 'package:green_corp_app/theme.dart';
import 'package:get/get.dart';
// import 'package:intl/intl.dart';

Future<dynamic> formReschedule(
    BuildContext context,
    GlobalKey<FormState> _formKey,
    // TextEditingController rescheduleDate,
    TextEditingController rescheduleNote,
    List<PickupModel?> _data,
    int index,
    DriverPickupState state) {
  return showDialog(
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
                // TextFieldWidget(
                //   context,
                //   isReadOnly: true,
                //   iconField: Icons.date_range_rounded,
                //   obsText: false,
                //   textController: rescheduleDate,
                //   label: "Select Date",
                //   tap: () async {
                //     DateTime? picked = await showDatePicker(
                //       context: context,
                //       initialDate: DateTime.now(),
                //       firstDate: DateTime.now().subtract(
                //         Duration(days: 0),
                //       ),
                //       lastDate: DateTime(2100),
                //     );
                //     if (picked != null) {
                //       String formattedDate =
                //           DateFormat('yyyy-MM-dd').format(picked);

                //       rescheduleDate.text = formattedDate;
                //     }
                //   },
                //   validatorField: (value) {
                //     if (value!.isEmpty) {
                //       return "Tanggal wajib diisi";
                //     }
                //   },
                // ),
                // SizedBox(
                //   height: 16,
                // ),
                TextFieldWithoutIcon(
                  context,
                  obsText: false,
                  textController: rescheduleNote,
                  label: "Alasan",
                  validatorField: (value) {
                    if (value!.isEmpty) {
                      return "Alasan wajib diisi";
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: buttonStyleForForm.copyWith(
                  backgroundColor: MaterialStateProperty.all(
                    buttonColorGrey,
                  ),
                ),
                onPressed: () => Get.back(),
                child: Text(
                  "Cancel",
                  style: secondaryTextStyle,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // print("Data Trans ID: " +
                    //     _data[index]!.id!);
                    // print("Date : " +
                    //     rescheduleDate.text);

                    context.read<DriverPickupCubit>().rescheduleRequest(
                          _data[index]!.id!,
                          rescheduleNote.text,
                        );
                  }
                },
                child: (state is DriverRescheduleLoading)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Text(
                        "Submit",
                        style: secondaryTextStyle,
                      ),
                style: buttonStyleForForm.copyWith(
                  backgroundColor: MaterialStateProperty.all(
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
}
