import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_corp_app/application/history/cubit/history_cubit.dart';
import 'package:green_corp_app/infrastructure/master_data/category_status_service.dart';
import 'package:green_corp_app/model/master_data/category_status.dart';
import 'package:green_corp_app/presentation/widget/dropdown_decorator_props.dart';
// import 'package:green_corp_app/presentation/widget/item_dropdown_builder.dart';
import 'package:green_corp_app/presentation/widget/text_field.dart';
import 'package:green_corp_app/presentation/widget/textfield_props.dart';
import 'package:green_corp_app/theme.dart';
import 'package:intl/intl.dart';

class modalFilterHistory extends StatefulWidget {
  const modalFilterHistory({super.key});

  @override
  State<modalFilterHistory> createState() => _modalFilterHistoryState();
}

class _modalFilterHistoryState extends State<modalFilterHistory> {
  TextEditingController _searchBox = TextEditingController();
  TextEditingController _filterDate = TextEditingController();
  String? _statusFilter;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Column(
            children: [
              TextFieldWidget(
                context,
                obsText: false,
                textController: _searchBox,
                label: "Nama Usaha",
                iconField: Icons.work_history_rounded,
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                context,
                isReadOnly: true,
                iconField: Icons.date_range_rounded,
                obsText: false,
                textController: _filterDate,
                label: "Select Date",
                tap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(picked);

                    setState(() {
                      _filterDate = TextEditingController(text: formattedDate);
                    });
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              DropdownSearch<CategoryStatus>(
                // clearButtonProps: ClearButtonProps(isVisible: true),
                dropdownDecoratorProps: dropDownDecoratorPropsWidget("Status"),
                // items: [
                //   "New",
                //   "Repeat",
                // ],
                asyncItems: (String filter) async {
                  CategoryStatusService _dataCategoryStatus =
                      await CategoryStatusService();
                  return _dataCategoryStatus.getCategoryStatusData();
                },
                onChanged: (value) {
                  setState(() {
                    // _statusFilter = (value == "New") ? "N" : "R";
                    _statusFilter = value!.status_kategori_code;
                  });
                },
                popupProps: PopupPropsMultiSelection.modalBottomSheet(
                  showSearchBox: true,
                  searchFieldProps: textFieldProps(),
                  showSelectedItems: false,
                  // showSearchBox: true,
                  // itemBuilder: (context, item, isSelected) {
                  //   return itemDropdownBuilder(ite);
                  // },
                ),
                itemAsString: (item) =>
                    item.status_kategori_code! +
                    " - " +
                    item.title! +
                    " - " +
                    item.keterangan.toString(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Expanded(
              //   child: Container(
              //     padding: EdgeInsets.only(right: 5),
              //     child: ElevatedButton(
              //       child: const Text(
              //         'Reset',
              //         style: TextStyle(color: Colors.black),
              //       ),
              //       onPressed: () => Navigator.pop(context),
              //       style: ButtonStyle(
              //         backgroundColor: MaterialStateProperty.all(primaryColor),
              //         side: MaterialStateProperty.all(
              //           BorderSide(color: buttonColorGrey),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 5),
                  child: ElevatedButton(
                    child: const Text('Filter'),
                    onPressed: () {
                      // print("date : " + _filterDate.text);
                      context.read<HistoryCubit>().getHistory(
                            date: _filterDate.text,
                            // status_pelanggan: _statusFilter ?? "",
                            status_kategori_code: _statusFilter!,
                            nama_usaha: _searchBox.text,
                          );
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
