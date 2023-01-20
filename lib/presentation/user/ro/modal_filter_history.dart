import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:green_corp_app/presentation/widget/dropdown_decorator_props.dart';
import 'package:green_corp_app/presentation/widget/item_dropdown_builder.dart';
import 'package:green_corp_app/presentation/widget/text_field.dart';
import 'package:green_corp_app/presentation/widget/textfield_props.dart';
import 'package:green_corp_app/theme.dart';
import 'package:intl/intl.dart';

Container modalFilterHistory(BuildContext context) {
  TextEditingController _filterDate = TextEditingController();
  String? _statusFilter;
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

                  _filterDate.text = formattedDate;
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            DropdownSearch<String>(
              // clearButtonProps: ClearButtonProps(isVisible: true),
              dropdownDecoratorProps: dropDownDecoratorPropsWidget("Status"),
              items: [
                "Submit",
                "Proses",
                "Persetujuan",
              ],
              onChanged: (value) {
                _statusFilter = value;
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
              itemAsString: (item) => item,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 5),
                child: ElevatedButton(
                  child: const Text(
                    'Reset',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () => Navigator.pop(context),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                    side: MaterialStateProperty.all(
                      BorderSide(color: buttonColorGrey),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 5),
                child: ElevatedButton(
                  child: const Text('Filter'),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
