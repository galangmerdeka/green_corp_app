import 'package:flutter/material.dart';
import 'package:green_corp_app/domain/calculate/konversi_lt_kg.dart';
import 'package:green_corp_app/presentation/landing_page/landing.dart';
import 'package:green_corp_app/presentation/widget/appbar_custom.dart';
import 'package:green_corp_app/presentation/widget/dropdown.dart';
import 'package:green_corp_app/presentation/widget/main_logo.dart';
import 'package:green_corp_app/presentation/widget/snackbar_custom.dart';
import 'package:green_corp_app/presentation/widget/text_field_without_icon.dart';
import 'package:green_corp_app/theme.dart';
import 'package:get/get.dart';

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
  String? _kota;
  String? _kecamatan;
  String? _kelurahan;
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

  KonversiLtKg objKonversi = KonversiLtKg();
  @override
  Widget build(BuildContext context) {
    final _code_screen = ModalRoute.of(context)!.settings.arguments as String;
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
                      (_code_screen == "new" || _code_screen == "edit")
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
                      (_code_screen == "new" || _code_screen == "edit")
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
                      DropDown(
                        itemList: [
                          'DKI Jakarta',
                          'Jawa Barat',
                          'Jawa Tengah',
                          'Jawa TImur',
                          'Kalimantan Utara',
                          'Kalimantan Selatan',
                          'Kalimantan Barat'
                        ],
                        labelField: "Provinsi",
                        function: (value) {
                          // print("Provinsi : ${value}");
                          setState(() {
                            _provinsi = value as String;
                          });
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      DropDown(
                        itemList: [
                          'Jakarta Selatan',
                          'Jakarta Utara',
                          'Jakarta Selatan',
                          'Jakarta Barat'
                        ],
                        labelField: "Kota/Kabupaten",
                        function: (value) {
                          // print("Kota/Kabupaten : ${value}");
                          setState(() {
                            _kota = value as String;
                          });
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      DropDown(
                        itemList: [
                          'Kemayoran',
                          'Senen',
                          'Gambir',
                          'Cempaka Putih'
                        ],
                        labelField: "Kecamatan",
                        function: (value) {
                          // print("Kecamatan : ${value}");
                          setState(() {
                            _kecamatan = value as String;
                          });
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      DropDown(
                        itemList: [
                          'Serdang',
                          'Senen',
                          'Gambir',
                          'Cempaka Putih',
                        ],
                        labelField: "Kelurahan",
                        function: (value) {
                          // print("Kelurahan : ${value}");
                          setState(() {
                            _kelurahan = value as String;
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
}
