// import 'dart:html';

// import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_corp_app/application/history/cubit/history_cubit.dart';
// import 'package:green_corp_app/model/transaction.dart/history.dart';
import 'package:get/get.dart';
// import 'package:green_corp_app/model/transaction.dart/history.dart';
// import 'package:green_corp_app/presentation/user/ro/add_customer.dart';
import 'package:green_corp_app/presentation/widget/appbar_custom.dart';
// import 'package:green_corp_app/presentation/widget/text_field.dart';
// import 'package:green_corp_app/presentation/widget/textfield_props.dart';
// import 'package:green_corp_app/presentation/widget/main_logo.dart';
import 'package:green_corp_app/theme.dart';
// import 'package:get/get.dart';
// import 'package:horizontal_data_table/horizontal_data_table.dart';

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
      appBar: AppBarCustom(context, "History"),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocConsumer<HistoryCubit, HistoryState>(
                listener: (context, state) {
                  // TODO: implement listener
                  if (state is HistoryLoading) {
                    print("Get Data History...");
                  } else if (state is HistoryError) {
                    print("Error Get History: " + state.errMessage);
                    alertDialogHistoryError(context, state);
                  } else if (state is HistorySuccess) {
                    print("Get Data History Success...");
                  }
                },
                builder: (context, state) {
                  return (state is HistoryLoading)
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
                      : SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            // height: MediaQuery.of(context).size.height,
                            // width: double.infinity,
                            child: (state is HistorySuccess)
                                ? listDataBuilder(state.history)
                                : Container(),
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  StatelessWidget listDataBuilder(List state) {
    return (state.length > 0)
        ? ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: state.length,
            itemExtent: 100,
            itemBuilder: (context, index) {
              final _data = state[index];
              return Card(
                elevation: 5,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Container(
                    //   padding: EdgeInsets.only(
                    //     left: 10,
                    //   ),
                    //   child: Text(
                    //     _data!.code_pelanggan!,
                    //     style:
                    //         secondaryTextStyle.copyWith(
                    //       fontSize: 20,
                    //       fontWeight: bold,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: double.infinity,
                        // color: Colors.blue,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              _data!.nama_usaha!,
                              style: secondaryTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: medium,
                              ),
                            ),
                            Text(
                              "Order ID : ${_data.order_code}",
                              style: secondaryTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: medium,
                              ),
                            ),
                            Text(
                              // "Status : ${(_data.status_pelanggan == "N") ? "New" : "Repeat"}",
                              "Kode Status : ${_data.status_category_code}",
                              style: secondaryTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: medium,
                              ),
                            ),
                            Text(
                              // "Status : ${(_data.status_pelanggan == "N") ? "New" : "Repeat"}",
                              "Keterangan : ${_data.keterangan}",
                              style: secondaryTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: medium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
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

  Future<dynamic> alertDialogHistoryError(
      BuildContext context, HistoryError state) {
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
