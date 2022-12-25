// import 'dart:convert';

import 'dart:convert';
// import 'dart:html';

// import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:green_corp_app/config/constant.dart';
import 'package:green_corp_app/model/districts.dart';
import 'package:green_corp_app/model/regencies.dart';
import 'package:green_corp_app/model/villages.dart';
import 'package:http/http.dart' as http;
import 'package:green_corp_app/domain/calculate/konversi_lt_kg.dart';
import 'package:green_corp_app/model/province.dart';
import 'package:green_corp_app/presentation/landing_page/landing.dart';
import 'package:green_corp_app/presentation/widget/appbar_custom.dart';
import 'package:green_corp_app/presentation/widget/dropdown.dart';
import 'package:green_corp_app/presentation/widget/main_logo.dart';
import 'package:green_corp_app/presentation/widget/snackbar_custom.dart';
import 'package:green_corp_app/presentation/widget/text_field_without_icon.dart';
import 'package:green_corp_app/theme.dart';
import 'package:get/get.dart';
import '../../widget/dropdown_decorator_props.dart';

class RONewCustomer extends StatefulWidget {
  const RONewCustomer({super.key});
  static const routeName = '/ro/home/new_customer';

  @override
  State<RONewCustomer> createState() => _RONewCustomerState();
}

class _RONewCustomerState extends State<RONewCustomer> {
  final _formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> _userSales = [
    {"id": "0001", "name": "John Doe"}
  ];
  List<String> _pelangganRO = [
    "P001",
    "P002",
    "P003",
  ];
  List<String> _namaUsahaRO = [
    "Hotel Aston",
    "Hotel Horison",
    "Hotel Ave Kalimantan",
    "JCC International Hotel",
  ];
  List<String> _dataKategori = [
    "Hotel",
    "Restoran",
    "Warung",
    "UMKM",
    "Supplier",
    "Rumah Tangga",
    "Jengrinda",
    "Jelantah Goes To School",
    "Jelita",
  ];

  List<String> _dataLokasiGudang = [
    'Malang',
    'Samarinda',
    'Surabaya',
  ];

  final _idPelangganNew = TextEditingController();
  final _orderId = TextEditingController();
  String? _selectedIdPelangganRO;
  String? _selectedKategori;
  String? _selectedLokasiGudang;
  String? _selectedNamaUsahaRO;
  String? _provinsi;
  int? _provinsiID;
  String? _kota;
  int? _kotaID;
  String? _kecamatan;
  int? _kecamatanID;
  String? _kelurahan;
  int? _kelurahanID;
  final _namaUsaha = TextEditingController();
  final _alamatDetail = TextEditingController();
  final _namaPJ = TextEditingController();
  final _jabatanPJ = TextEditingController();
  final _noTelpPJ = TextEditingController();
  String? _status;
  final _keterangan = TextEditingController();
  final _harga = TextEditingController();
  String? _jenisUCO;
  int _quantityLiter = 0;
  double? _quantityKg;
  String? _kemasan;
  bool _isSubmitted = false;

  void _updateQuantityKg(value) {
    setState(() {
      _quantityKg = value;
    });
  }

  void _updateQuantityLt(value) {
    setState(() {
      _quantityLiter = value;
    });
  }

  void _updateIsSubmitted(value) {
    setState(() {
      _isSubmitted = value;
    });
  }

  void _resetKota() {
    setState(() {
      if (_kota!.isNotEmpty) {
        _kota = null;
      }
    });
  }

  KonversiLtKg objKonversi = KonversiLtKg();
  @override
  Widget build(BuildContext context) {
    final _codeScreen = ModalRoute.of(context)!.settings.arguments as String;
    // print("Code Screen : ${_code_screen}");
    return Scaffold(
      appBar: AppBarCustom(context, "Customer"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MainLogo(),
              SizedBox(
                height: 36,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: FieldPadding,
                  right: FieldPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sales ID : ${_userSales[0]['id']}",
                      style: primaryTextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Sales Name : ${_userSales[0]['name']}",
                      style: primaryTextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 36,
              ),
              Form(
                key: _formKey,
                child: Container(
                  // width: double.infinity,
                  padding: EdgeInsets.only(
                    left: FieldPadding,
                    right: FieldPadding,
                  ),
                  child: Column(
                    children: [
                      (_codeScreen == "new" || _codeScreen == "edit")
                          ? TextFieldWithoutIcon(
                              context,
                              // hintText: "ID Pelanggan",
                              obsText: false,
                              textController: _idPelangganNew,
                              label: "ID Pelanggan",
                            )
                          : DropDown(
                              itemList: _pelangganRO,
                              labelField: "ID Pelanggan",
                              function: (value) {
                                // print("Kategori : ${value}");
                                setState(() {
                                  _selectedIdPelangganRO = value as String;
                                });
                              },
                            ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFieldWithoutIcon(
                        context,
                        // hintText: "Order ID",
                        obsText: false,
                        textController: _orderId,
                        label: "Order ID",
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      // DropdownButtonFormField(
                      //   decoration: InputDecoration(
                      //     labelText: "Kategori",
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(
                      //         10,
                      //       ),
                      //     ),
                      //   ),
                      //   value: selectedKategori,
                      //   items: _dataKategori.map((e) {
                      //     return DropdownMenuItem(
                      //       child: Text(e),
                      //       value: e,
                      //     );
                      //   }).toList(),
                      //   onChanged: (value) {
                      //     print("Kategori ${value}");
                      //     setState(() {
                      //       selectedKategori = value as String;
                      //     });
                      //   },
                      // ),
                      DropDown(
                        itemList: _dataKategori,
                        labelField: "Kategori",
                        function: (value) {
                          // print("Kategori : ${value}");
                          setState(() {
                            _selectedKategori = value as String;
                          });
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      DropDown(
                        itemList: _dataLokasiGudang,
                        labelField: "Lokasi Gudang",
                        function: (value) {
                          // print("Lokasi Gudang : ${value}");
                          setState(() {
                            _selectedLokasiGudang = value as String;
                          });
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      (_codeScreen == "new" || _codeScreen == "edit")
                          ? TextFieldWithoutIcon(
                              context,
                              // hintText: "Nama Usaha",
                              obsText: false,
                              textController: _namaUsaha,
                              label: "Nama Usaha",
                            )
                          : DropDown(
                              itemList: _namaUsahaRO,
                              labelField: "Nama Usaha",
                              function: (value) {
                                // print("Nama Usaha : ${value}");
                                setState(() {
                                  _selectedNamaUsahaRO = value as String;
                                });
                              },
                            ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFieldWithoutIcon(
                        context,
                        // hintText: "Nama Usaha",
                        obsText: false,
                        textController: _namaPJ,
                        label: "Nama PJ",
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFieldWithoutIcon(
                        context,
                        // hintText: "Nama Usaha",
                        obsText: false,
                        textController: _jabatanPJ,
                        label: "Jabatan PJ",
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFieldWithoutIcon(
                        context,
                        // hintText: "Nama Usaha",
                        obsText: false,
                        textController: _noTelpPJ,
                        label: "No Telp PJ",
                        inputType: TextInputType.phone,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      DropdownSearch<Province>(
                        // clearButtonProps: ClearButtonProps(isVisible: true),
                        dropdownDecoratorProps:
                            dropDownDecoratorPropsWidget("Provinsi"),
                        asyncItems: (String filter) async {
                          Uri url = Uri.parse("${API_WILAYAH}provinces.json");
                          try {
                            var response = await http.get(url);

                            var data = json.decode(response.body);
                            var listAllProvince = data as List<dynamic>;
                            var modelsProvince =
                                Province.fromJsonList(listAllProvince);

                            return modelsProvince;
                          } catch (err) {
                            print(err);
                            return List<Province>.empty();
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            _provinsi = value!.name;
                            _provinsiID = int.tryParse(value.id!);
                          });
                          // print("Provinsi ID: ${value!.id}");
                          // if (value.isBlank!) {
                          //   print("Provinsi ID: ${value!.id}");
                          // } else {
                          //   print("Belum memilih apapun");
                          // }
                        },
                        popupProps: PopupPropsMultiSelection.modalBottomSheet(
                          showSelectedItems: false,
                          // showSearchBox: true,
                          itemBuilder: (context, item, isSelected) {
                            return itemDropdownBuilder(item.name!);
                          },
                        ),
                        itemAsString: (item) => item.name!,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      DropdownSearch<Regencies>(
                        dropdownDecoratorProps:
                            dropDownDecoratorPropsWidget("Kota"),
                        asyncItems: (String filter) async {
                          Uri url = Uri.parse(
                              "${API_WILAYAH}regencies/${_provinsiID}.json");
                          try {
                            var response = await http.get(url);

                            var data = json.decode(response.body);
                            var listAllRegencies = data as List<dynamic>;
                            var modelsRegencies =
                                Regencies.fromJsonList(listAllRegencies);

                            return modelsRegencies;
                          } catch (err) {
                            print(err);
                            return List<Regencies>.empty();
                          }
                        },
                        onChanged: (Regencies? data) {
                          setState(() {
                            _kota = data!.name;
                            _kotaID = int.tryParse(data.id!);
                          });
                          // if (data != null) {
                          //   print("Kota ID : ${_kotaID}");
                          // } else {
                          //   print("Belum memilih apapun");
                          // }
                        },
                        popupProps: PopupPropsMultiSelection.modalBottomSheet(
                          showSelectedItems: false,
                          // showSearchBox: true,
                          itemBuilder: (context, item, isSelected) {
                            return itemDropdownBuilder(item.name!);
                          },
                        ),
                        itemAsString: (item) => item.name!,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      DropdownSearch<Districts>(
                        dropdownDecoratorProps:
                            dropDownDecoratorPropsWidget("Kecamatan"),
                        asyncItems: (String filter) async {
                          Uri url = Uri.parse(
                              "${API_WILAYAH}districts/${_kotaID}.json");
                          try {
                            var response = await http.get(url);

                            var data = json.decode(response.body);
                            var listAllDistricts = data as List<dynamic>;
                            var modelsRegencies =
                                Districts.fromJsonList(listAllDistricts);

                            return modelsRegencies;
                          } catch (err) {
                            print(err);
                            return List<Districts>.empty();
                          }
                        },
                        onChanged: (data) {
                          setState(() {
                            _kecamatan = data!.name;
                            _kecamatanID = int.tryParse(data.id!);
                          });
                          // if (data != null) {
                          //   print("Kota ID : ${_kotaID}");
                          // } else {
                          //   print("Belum memilih apapun");
                          // }
                        },
                        popupProps: PopupPropsMultiSelection.modalBottomSheet(
                          showSelectedItems: false,
                          // showSearchBox: true,
                          itemBuilder: (context, item, isSelected) {
                            return itemDropdownBuilder(item.name!);
                          },
                        ),
                        itemAsString: (item) => item.name!,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      DropdownSearch<Villages>(
                        dropdownDecoratorProps:
                            dropDownDecoratorPropsWidget("Kelurahan"),
                        asyncItems: (String filter) async {
                          Uri url = Uri.parse(
                              "${API_WILAYAH}villages/${_kecamatanID}.json");
                          try {
                            var response = await http.get(url);

                            var data = json.decode(response.body);
                            var listAllVillages = data as List<dynamic>;
                            var modelsRegencies =
                                Villages.fromJsonList(listAllVillages);

                            return modelsRegencies;
                          } catch (err) {
                            print(err);
                            return List<Villages>.empty();
                          }
                        },
                        onChanged: (data) {
                          setState(() {
                            _kelurahan = data!.name;
                            _kelurahanID = int.tryParse(data.id!);
                          });
                          // if (data != null) {
                          //   print("Kota ID : ${_kotaID}");
                          // } else {
                          //   print("Belum memilih apapun");
                          // }
                        },
                        popupProps: PopupPropsMultiSelection.modalBottomSheet(
                          showSelectedItems: false,
                          // showSearchBox: true,
                          itemBuilder: (context, item, isSelected) {
                            return itemDropdownBuilder(item.name!);
                          },
                        ),
                        itemAsString: (item) => item.name!,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFieldWithoutIcon(
                        context,
                        // hintText: "Nama Usaha",
                        obsText: false,
                        textController: _alamatDetail,
                        label: "Alamat Detail",
                        textAlignVer: TextAlignVertical.top,
                        contentMaxLines: 3,
                      ),
                      // SizedBox(
                      //   height: 16,
                      // ),
                      // DropdownSearch<String>(
                      //   popupProps: PopupProps.menu(
                      //     showSelectedItems: true,
                      //   ),
                      //   items: ['Deal', 'Revisit', 'No UCO', 'Other'],
                      //   dropdownDecoratorProps: DropDownDecoratorProps(
                      //     dropdownSearchDecoration: InputDecoration(
                      //         labelText: "Status",
                      //         border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(10),
                      //         )),
                      //   ),
                      //   onChanged: (value) {
                      //     print("Status : ${value}");
                      //     setState(() {
                      //       _status = value as String;
                      //     });
                      //   },
                      //   selectedItem: 'Deal',
                      // ),
                      // SizedBox(
                      //   height: 16,
                      // ),
                      // (_status == 'Other')
                      //     ? TextFieldWithoutIcon(
                      //         context,
                      //         // hintText: "Nama Usaha",
                      //         obsText: false,
                      //         textController: _keterangan,
                      //         label: "Keterangan",
                      //       )
                      //     : Container(),
                      // SizedBox(
                      //   height: 16,
                      // ),
                      // TextFieldWithoutIcon(
                      //   context,
                      //   // hintText: "Nama Usaha",
                      //   obsText: false,
                      //   textController: _harga,
                      //   label: "Harga",
                      //   inputType: TextInputType.numberWithOptions(
                      //     decimal: true,
                      //   ),
                      // ),
                      SizedBox(
                        height: 16,
                      ),
                      DropDown(
                        itemList: [
                          'Padat',
                          'Cair',
                        ],
                        labelField: "Jenis UCO",
                        function: (value) {
                          // print("Jenis UCO : ${value}");
                          setState(() {
                            _jenisUCO = value as String;
                          });
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      DropDown(
                        itemList: [
                          'Jerigen 2',
                          'Jerigen 4',
                          'Jerigen 6',
                          'Jerigen 8',
                        ],
                        labelField: "Kemasan",
                        function: (value) {
                          // print("Kemasan : ${value}");
                          setState(() {
                            _kemasan = value as String;
                          });
                        },
                      ),
                      // SizedBox(
                      //   height: 16,
                      // ),
                      // DropdownSearch<String>(
                      //   popupProps: PopupProps.menu(
                      //     showSelectedItems: true,
                      //   ),
                      //   items: [
                      //     'Kg',
                      //     'Liter',
                      //   ],
                      //   dropdownDecoratorProps: DropDownDecoratorProps(
                      //     dropdownSearchDecoration: InputDecoration(
                      //         labelText: "Satuan",
                      //         border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(10),
                      //         )),
                      //   ),
                      //   onChanged: (value) {
                      //     print("Satuan : ${value}");
                      //     setState(() {
                      //       _satuan = value as String;
                      //     });
                      //   },
                      // ),

                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                right: 17.5,
                              ),
                              child: TextFieldWithoutIcon(
                                context,
                                obsText: false,
                                // textController: _quantityLiter,
                                label: "Quantity/Lt",
                                // initValue: _quantityLiter.toString(),
                                inputType: TextInputType.numberWithOptions(
                                    decimal: false),
                                // contentPrefixText: "Kg",
                                convertValueOnChanged: (val) {
                                  double res_convert = objKonversi
                                      .getKonversiLtToKg(int.parse(val!));
                                  setState(
                                    () {
                                      // _updateQuantityLt(val);
                                      _updateQuantityKg(res_convert);
                                    },
                                  );
                                  // print("Liter : ${_quantityLiter.toString()}");
                                  // print(
                                  //     "Konversi Lt ke Kg : ${_quantityKg!.toStringAsFixed(1)}");
                                  return null;
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              // color: Colors.red,
                              margin: EdgeInsets.only(
                                left: 5,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Quantity/Kg",
                                  ),
                                  Text(
                                      "${(_quantityKg != null) ? _quantityKg.toString() : 0}")
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Text("Value convert : $_quantityKg"),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        // color: Colors.red,
                        margin: EdgeInsets.only(
                          bottom: 10,
                        ),
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            _updateIsSubmitted(true);
                            // Future.delayed(Duration(seconds: 5));

                            var snackbar = SnackBarCustom(
                                title: "Data Has Been Submitted");
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                            Get.offAllNamed(Landing.routeName);
                          },
                          style: buttonStyleForForm.copyWith(
                            backgroundColor:
                                MaterialStateProperty.all(buttonColor),
                          ),
                          child: (_isSubmitted == false)
                              ? Text(
                                  "Submit",
                                  style: secondaryTextStyle.copyWith(
                                    fontWeight: bold,
                                    fontSize: 16,
                                  ),
                                )
                              : CircularProgressIndicator(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container itemDropdownBuilder(String item) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: Text("${item}"),
    );
  }
}
