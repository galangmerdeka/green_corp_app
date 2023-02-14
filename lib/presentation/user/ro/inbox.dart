// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_corp_app/application/inbox/cubit/inbox_cubit.dart';
import 'package:green_corp_app/application/inbox_check_status/cubit/check_status_cubit.dart';
import 'package:green_corp_app/config/constant.dart';
import 'package:green_corp_app/infrastructure/transaction/get_inbox.dart';
import 'package:green_corp_app/model/transaction/inbox.dart';
import 'package:green_corp_app/presentation/user/ro/add_customer.dart';
import 'package:green_corp_app/presentation/widget/appbar_custom.dart';
import 'package:green_corp_app/presentation/widget/loading_dialog_show.dart';
// import 'package:green_corp_app/presentation/widget/info_new_feature.dart';
import 'package:green_corp_app/theme.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});
  static const routeName = '/ro/inbox';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(context, "Inbox"),
      // body: infoNewFeature(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Column(
            children: [
              Expanded(
                child: BlocConsumer<InboxCubit, InboxState>(
                  listener: (context, state) {
                    // TODO: implement listener
                    if (state is InboxLoading) {
                      print("Loading Data Inbox...");
                    } else if (state is InboxError) {
                      print("Inbox Error : " + state.errMessage);
                      alertDialogErrorInbox(context, state);
                    } else if (state is InboxSuccess) {
                      print("Get Data Inbox Success...");
                    }
                  },
                  builder: (context, state) {
                    return (state is InboxLoading)
                        ? Scaffold(
                            body: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Retrieving Data...",
                                    style: secondaryTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(
                            child: (state is InboxSuccess)
                                ? listDataBuilderInbox(state.inboxData)
                                : Container(),
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

  Widget listDataBuilderInbox(List<InboxData?> dataInbox) {
    return (dataInbox.length > 0)
        ? ListView.builder(
            itemCount: dataInbox.length,
            itemBuilder: (context, index) {
              final _data = dataInbox[index];
              return BlocConsumer<CheckStatusCubit, CheckStatusState>(
                listener: (context, state) {
                  // TODO: implement listener
                  if (state is InboxLoadingCheckStatus) {
                    print("Loading Check Status...");
                    loadingDialogShow(context);
                  } else if (state is InboxCheckStatusError) {
                    alertDialogStatusA6(context, state.errMessage);
                  } else if (state is InboxCheckStatusSuccess) {
                    Get.offAndToNamed(
                      AddCustomer.routeName,
                      arguments: {
                        "source": "inbox",
                        // "code_screen": "ro",
                        "pelanggan_code": _data!.pelanggan_code,
                        "nama_usaha": _data.nama_usaha,
                        "nama_pj": _data.nama_pj,
                        "jabatan_pj": _data.jabatan_pj,
                        "phone_number": _data.phone_number,
                        "alamat": _data.alamat,
                        "provinsi": _data.provinsi,
                        "provinsi_id": _data.provinsi_id,
                        "kota": _data.kabupaten_kota,
                        "kota_id": _data.kabupaten_kota_id,
                        "kecamatan": _data.kecamatan,
                        "kecamatan_id": _data.kecamatan_id,
                        "kelurahan": _data.kelurahan,
                        "kelurahan_id": _data.kelurahan_id,
                        "kategori": _data.kategori,
                        "kategori_bisnis": _data.kategori_bisnis,
                      },
                    );
                  }
                },
                builder: (context, state) {
                  return GestureDetector(
                    // splashColor: ,
                    onTap: (_data!.status_category_code == "A6" ||
                            _data.status_category_code == "A1")
                        ? () => alertDialogStatusA6(
                            context,
                            ((_data.status_category_code == "A6")
                                ? INBOX_ERROR_MESSAGE_KODE_STATUS_A6
                                : INBOX_ERROR_MESSAGE_KODE_STATUS_A1))
                        : () async {
                            print(index);
                            context
                                .read<CheckStatusCubit>()
                                .checkStatus(_data.id!);
                          },
                    child: Card(
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              _data.nama_usaha!,
                              style: secondaryTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: medium,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "ID Pelanggan : ${_data.pelanggan_code}",
                              style: secondaryTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: regular,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              (_data.status_category_code == "A1")
                                  ? "Order ID : ${_data.order_code}"
                                  : "Latest Order ID : ${_data.order_code}",
                              style: secondaryTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: regular,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              // "Status : ${(_data.status_pelanggan == "N") ? "New" : "Repeat"}",
                              "Kode Status : ${_data.status_category_code}",
                              style: secondaryTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: medium,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              // "Status : ${(_data.status_pelanggan == "N") ? "New" : "Repeat"}",
                              "Keterangan : ${_data.status_category_desc}",
                              style: secondaryTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: medium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          )
        : Container(
            // color: Colors.red,
            padding: EdgeInsets.all(50),
            child: Center(
              child: Column(
                children: [
                  Text(
                    "No Data Found",
                    style: secondaryTextStyle.copyWith(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  Future<dynamic> alertDialogStatusA6(BuildContext context, String message) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(
          Icons.error_outline_rounded,
          size: 34,
          color: Colors.redAccent,
        ),
        title: Text(
          message,
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
      ),
    );
  }

  Future<dynamic> alertDialogErrorInbox(
      BuildContext context, InboxError state) {
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
}
