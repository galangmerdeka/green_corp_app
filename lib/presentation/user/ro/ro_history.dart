// import 'dart:html';

// import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:green_corp_app/model/transaction.dart/history.dart';
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
  TextEditingController _searchBox = TextEditingController();
  List<History>? _history = listHistory;

  void searchData(String query) {
    final suggest = listHistory.where((value) {
      final namaUsaha = value.nama_usaha!.toLowerCase();
      final input = query.toLowerCase();
      return namaUsaha.contains(input);
    }).toList();
    setState(() {
      _history = suggest;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(context, "History"),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: TextField(
                controller: _searchBox,
                onChanged: searchData,
                decoration: InputDecoration(
                  hintText: "Search Here...",
                  hintStyle: secondaryTextStyle.copyWith(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  // height: MediaQuery.of(context).size.height,
                  // width: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      final _data = _history![index];
                      return Card(
                        elevation: 5,
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                left: 10,
                              ),
                              child: Text(
                                _data.id_pelanggan!,
                                style: secondaryTextStyle.copyWith(
                                  fontSize: 20,
                                  fontWeight: bold,
                                ),
                              ),
                            ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      _data.nama_usaha!,
                                      style: secondaryTextStyle.copyWith(
                                        fontSize: 20,
                                        fontWeight: medium,
                                      ),
                                    ),
                                    Text(
                                      "Order ID : ${_data.order_id}",
                                      style: secondaryTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: medium,
                                      ),
                                    ),
                                    Text(
                                      "Status : ${_data.status}",
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
                    itemCount: _history!.length,
                    itemExtent: 100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
