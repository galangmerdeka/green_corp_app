// import 'dart:convert';

import 'dart:convert';
// import 'dart:html';

// import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_corp_app/application/created_data/cubit/created_data_cubit.dart';
// import 'package:green_corp_app/config/constant.dart';
import 'package:green_corp_app/infrastructure/master_data/category_service.dart';
import 'package:green_corp_app/infrastructure/master_data/category_status_service.dart';
import 'package:green_corp_app/infrastructure/master_data/pack_type_service.dart';
import 'package:green_corp_app/infrastructure/transaction/get_customer_service.dart';
import 'package:green_corp_app/infrastructure/wilayah/districts_service.dart';
import 'package:green_corp_app/infrastructure/wilayah/province_service.dart';
import 'package:green_corp_app/infrastructure/wilayah/regencies_service.dart';
import 'package:green_corp_app/infrastructure/wilayah/villages_service.dart';
import 'package:green_corp_app/model/master_data/category.dart';
import 'package:green_corp_app/model/master_data/category_status.dart';
import 'package:green_corp_app/model/master_data/pack_type.dart';
import 'package:green_corp_app/model/transaction.dart/created_data_model.dart';
import 'package:green_corp_app/model/transaction.dart/get_customer_code.dart';
// import 'package:green_corp_app/model/user/user.dart';
import 'package:green_corp_app/model/wilayah/districts.dart';
import 'package:green_corp_app/model/wilayah/regencies.dart';
import 'package:green_corp_app/model/wilayah/villages.dart';
// import 'package:http/http.dart' as http;
import 'package:green_corp_app/domain/calculate/konversi_lt_kg.dart';
import 'package:green_corp_app/model/wilayah/province.dart';
import 'package:green_corp_app/presentation/landing_page/landing.dart';
import 'package:green_corp_app/presentation/widget/appbar_custom.dart';
import 'package:green_corp_app/presentation/widget/dropdown.dart';
import 'package:green_corp_app/presentation/widget/item_dropdown_builder.dart';
// import 'package:green_corp_app/presentation/widget/main_logo.dart';
import 'package:green_corp_app/presentation/widget/snackbar_custom.dart';
import 'package:green_corp_app/presentation/widget/text_field_without_icon.dart';
import 'package:green_corp_app/presentation/widget/textfield_props.dart';
import 'package:green_corp_app/theme.dart';
import 'package:get/get.dart';
// import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widget/dropdown_decorator_props.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({super.key});
  static const routeName = '/ro/home/new_customer';

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  @override
  void initState() {
    getDataUserName();
    getDataUserType();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  // List<Map<String, dynamic>> _userSales = [
  //   {"id": "0001", "name": "John Doe"}
  // ];

  // List<String> _namaUsahaRO = [
  //   "Hotel Aston",
  //   "Hotel Horison",
  //   "Hotel Ave Kalimantan",
  //   "JCC International Hotel",
  // ];
  // String? _kategori;
  String? _kategoriID;

  final _idPelangganNew = TextEditingController();
  final _orderId = TextEditingController();
  String? _codePelanggan;
  String? _selectedKategori;
  // String? _selectedLokasiGudang;
  // String? _selectedNamaUsahaRO;
  String? _provinsi;
  int? _provinsiID;
  String? _kota;
  int? _kotaID;
  String? _kecamatan;
  int? _kecamatanID;
  String? _kelurahan;
  int? _kelurahanID;
  String? _lokasiGudangName;
  int? _lokasiGudangID;
  TextEditingController _namaUsaha = TextEditingController();
  TextEditingController _alamatDetail = TextEditingController();
  TextEditingController _namaPJ = TextEditingController();
  TextEditingController _jabatanPJ = TextEditingController();
  TextEditingController _noTelpPJ = TextEditingController();
  String? _status;
  final _keterangan = TextEditingController();
  final _harga = TextEditingController();
  String? _jenisUCO;
  int _quantityLiter = 0;
  double? _quantityKg;
  String? _kemasan;
  String? _kemasanID;
  String? _kategoriStatusID;
  String? _kategoriTitleKet;
  // bool _isSubmitted = false;
  String? username;
  String? usertype;

  void _updateQuantityKg(value) {
    setState(() {
      _quantityKg = value;
    });
  }

  // void _updateQuantityLt(value) {
  //   setState(() {
  //     _quantityLiter = value;
  //   });
  // }

  // void _updateIsSubmitted(value) {
  //   setState(() {
  //     _isSubmitted = value;
  //   });
  // }

  // void _resetKota() {
  //   setState(() {
  //     if (_kota!.isNotEmpty) {
  //       _kota = null;
  //     }
  //   });
  // }

  Future<void> getDataUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString("user_name");
      print("username : " + username!);
    });
  }

  Future<void> getDataUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      usertype = prefs.getString("user_type")!;
      print("user type : " + usertype!);
    });
  }

  KonversiLtKg objKonversi = KonversiLtKg();
  // User _dataUser = User();
  @override
  Widget build(BuildContext context) {
    final _codeScreen = ModalRoute.of(context)!.settings.arguments as String;
    // print("Code Screen : ${_code_screen}");
    return BlocConsumer<CreatedDataCubit, CreatedDataState>(
      listener: (context, state) {
        if (state is CreatedDataLoading) {
          print("Submitted Loading...");
        } else if (state is CreatedDataError) {
          print("Error : " + state.errMessage.toString());
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                icon: Icon(
                  Icons.error_outline_rounded,
                  size: 34,
                  color: Colors.redAccent,
                ),
                title: Text(state.errMessage),
              );
            },
          );
        } else if (state is CreatedDataSuccess) {
          var snackbar = SnackBarCustom(title: state.successMessage);
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
          Get.offAllNamed(Landing.routeName);
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBarCustom(context, "Customer"),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // MainLogo(),
                SizedBox(
                  height: 36,
                ),
                Container(
                  // color: Colors.red,
                  // width: double.infinity,
                  padding: EdgeInsets.only(
                    left: FieldPadding,
                    right: FieldPadding,
                  ),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      (username != null)
                          ? Text(
                              "Sales Type : ${username}",
                              style: secondaryTextStyle.copyWith(
                                fontWeight: bold,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                            )
                          : Container(),
                      (usertype != null)
                          ? Text(
                              "Sales Name : ${usertype}",
                              style: secondaryTextStyle.copyWith(
                                fontWeight: bold,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                            )
                          : Container(),
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
                            ? Container()
                            : DropdownSearch<GetCustomerCode>(
                                // clearButtonProps: ClearButtonProps(isVisible: true),
                                dropdownDecoratorProps:
                                    dropDownDecoratorPropsWidget(
                                        "ID Pelanggan"),
                                asyncItems: (String filter) async {
                                  GetCustomerService _dataCustomerCode =
                                      await GetCustomerService();

                                  return _dataCustomerCode.getCustomerCodeAll();
                                },
                                onChanged: (value) async {
                                  GetCustomerService _dataCustomerByCode =
                                      await GetCustomerService();
                                  _dataCustomerByCode
                                      .getCustomerCodeByCode(
                                          value!.code_pelanggan!)
                                      .then(
                                    (value) async {
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      // var nama_usaha =
                                      //     prefs.getString("nama_usaha");
                                      // print(value.toString());
                                      setState(
                                        () {
                                          _namaUsaha = TextEditingController(
                                              text: prefs
                                                  .getString("nama_usaha"));
                                          _namaPJ = TextEditingController(
                                              text: prefs.getString("nama_pj"));
                                          _jabatanPJ = TextEditingController(
                                              text: prefs
                                                  .getString("jabatan_pj"));
                                          _noTelpPJ = TextEditingController(
                                              text:
                                                  "0${prefs.getString("phone_number")}");
                                          _alamatDetail = TextEditingController(
                                              text: prefs.getString("alamat"));
                                        },
                                      );
                                    },
                                  );

                                  setState(() {
                                    // _kategori = value!.title;
                                    _codePelanggan = value.code_pelanggan;
                                  });
                                },
                                popupProps:
                                    PopupPropsMultiSelection.modalBottomSheet(
                                  showSearchBox: true,
                                  searchFieldProps: textFieldProps(),
                                  showSelectedItems: false,
                                  // showSearchBox: true,
                                  itemBuilder: (context, item, isSelected) {
                                    return itemDropdownBuilder(
                                        item.code_pelanggan! +
                                            " - " +
                                            item.nama_usaha!);
                                  },
                                ),
                                itemAsString: (item) => item.code_pelanggan!,
                              ),

                        SizedBox(
                          height: 16,
                        ),
                        DropdownSearch<Category>(
                          // clearButtonProps: ClearButtonProps(isVisible: true),
                          dropdownDecoratorProps:
                              dropDownDecoratorPropsWidget("Kategori"),
                          asyncItems: (String filter) async {
                            CategoryService _dataCategory =
                                await CategoryService();
                            return _dataCategory.getCategoryData();
                          },
                          onChanged: (value) {
                            setState(() {
                              // _kategori = value!.title;
                              _kategoriID = value!.id;
                            });
                          },
                          popupProps: PopupPropsMultiSelection.modalBottomSheet(
                            showSearchBox: true,
                            searchFieldProps: textFieldProps(),
                            showSelectedItems: false,
                            // showSearchBox: true,
                            itemBuilder: (context, item, isSelected) {
                              return itemDropdownBuilder(item.title!);
                            },
                          ),
                          itemAsString: (item) => item.title!,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFieldWithoutIcon(
                          context,
                          // hintText: "Nama Usaha",
                          obsText: false,
                          textController: _namaUsaha,
                          // textController: TextEditingController()
                          //   ..text = "Data USAHA",
                          label: "Nama Usaha",
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
                            ProvinceService _dataProvince =
                                await ProvinceService();
                            return _dataProvince.getProvinceData();
                          },
                          onChanged: (value) {
                            setState(() {
                              _provinsi = value!.province_name;
                              _provinsiID = value.province_id;
                            });
                          },
                          popupProps: PopupPropsMultiSelection.modalBottomSheet(
                            showSearchBox: true,
                            showSelectedItems: false,
                            searchFieldProps: textFieldProps(),
                            // showSearchBox: true,
                            itemBuilder: (context, item, isSelected) {
                              return itemDropdownBuilder(item.province_name!);
                            },
                          ),
                          itemAsString: (item) => item.province_name!,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        DropdownSearch<Regencies>(
                          dropdownDecoratorProps:
                              dropDownDecoratorPropsWidget("Kota"),
                          asyncItems: (String filter) async {
                            RegenciesService _dataRegencies =
                                await RegenciesService();
                            return _dataRegencies
                                .getRegenciesData(_provinsiID.toString());
                          },
                          onChanged: (Regencies? data) {
                            setState(() {
                              _kota = data!.kota_name;
                              _kotaID = data.kota_id;
                            });
                          },
                          popupProps: PopupPropsMultiSelection.modalBottomSheet(
                            showSearchBox: true,
                            showSelectedItems: false,
                            searchFieldProps: textFieldProps(),
                            // showSearchBox: true,
                            itemBuilder: (context, item, isSelected) {
                              return itemDropdownBuilder(item.kota_name!);
                            },
                          ),
                          itemAsString: (item) => item.kota_name!,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        DropdownSearch<Districts>(
                          dropdownDecoratorProps:
                              dropDownDecoratorPropsWidget("Kecamatan"),
                          asyncItems: (String filter) async {
                            DistrictsService _dataDistricts =
                                await DistrictsService();
                            return _dataDistricts
                                .getDistrictsData(_kotaID.toString());
                          },
                          onChanged: (data) {
                            setState(() {
                              _kecamatan = data!.district_name;
                              _kecamatanID = data.district_id;
                            });
                          },
                          popupProps: PopupPropsMultiSelection.modalBottomSheet(
                            showSearchBox: true,
                            showSelectedItems: false,
                            searchFieldProps: textFieldProps(),
                            // showSearchBox: true,
                            itemBuilder: (context, item, isSelected) {
                              return itemDropdownBuilder(item.district_name!);
                            },
                          ),
                          itemAsString: (item) => item.district_name!,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        DropdownSearch<Villages>(
                          dropdownDecoratorProps:
                              dropDownDecoratorPropsWidget("Kelurahan"),
                          asyncItems: (String filter) async {
                            VillagesService _dataVillages =
                                await VillagesService();
                            return _dataVillages
                                .getVillagesData(_kecamatanID.toString());
                          },
                          onChanged: (data) {
                            setState(() {
                              _kelurahan = data!.villages_name;
                              _kelurahanID = data.villages_id;
                            });
                          },
                          popupProps: PopupPropsMultiSelection.modalBottomSheet(
                            showSearchBox: true,
                            showSelectedItems: false,
                            searchFieldProps: textFieldProps(),
                            // showSearchBox: true,
                            itemBuilder: (context, item, isSelected) {
                              return itemDropdownBuilder(item.villages_name!);
                            },
                          ),
                          itemAsString: (item) => item.villages_name!,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        DropdownSearch<Regencies>(
                          dropdownDecoratorProps:
                              dropDownDecoratorPropsWidget("Lokasi Gudang"),
                          asyncItems: (String filter) async {
                            RegenciesService _dataWarehouse =
                                await RegenciesService();
                            return _dataWarehouse
                                .getRegenciesData(_provinsiID.toString());
                          },
                          onChanged: (data) {
                            setState(() {
                              _lokasiGudangName = data!.kota_name;
                              _lokasiGudangID = data.kota_id;
                            });
                          },
                          popupProps: PopupPropsMultiSelection.modalBottomSheet(
                            showSearchBox: true,
                            showSelectedItems: false,
                            searchFieldProps: textFieldProps(),
                            // showSearchBox: true,
                            itemBuilder: (context, item, isSelected) {
                              return itemDropdownBuilder(item.kota_name!);
                            },
                          ),
                          itemAsString: (item) => item.kota_name!,
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
                              _jenisUCO = (value == "Padat") ? "P" : "C";
                            });
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        DropdownSearch<PackType>(
                          dropdownDecoratorProps:
                              dropDownDecoratorPropsWidget("Kemasan"),
                          asyncItems: (String filter) async {
                            PackTypeService _dataPackType =
                                await PackTypeService();
                            return _dataPackType.getPackType();
                          },
                          onChanged: (data) {
                            setState(() {
                              _kemasan = data!.title;
                              _kemasanID = data.id;
                            });
                            // if (data != null) {
                            //   print("Kota ID : ${_kotaID}");
                            // } else {
                            //   print("Belum memilih apapun");
                            // }
                          },
                          popupProps: PopupPropsMultiSelection.modalBottomSheet(
                            showSearchBox: true,
                            showSelectedItems: false,
                            searchFieldProps: textFieldProps(),
                            // showSearchBox: true,
                            itemBuilder: (context, item, isSelected) {
                              return itemDropdownBuilder(item.title!);
                            },
                          ),
                          itemAsString: (item) => item.title!,
                        ),

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
                                        _quantityLiter = int.tryParse(val)!;
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
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
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
                        TextFieldWithoutIcon(
                          context,
                          // hintText: "Nama Usaha",
                          obsText: false,
                          textController: _harga,
                          label: "Harga Satuan",
                          inputType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        DropdownSearch<CategoryStatus>(
                          dropdownDecoratorProps:
                              dropDownDecoratorPropsWidget("Kategori Status"),
                          asyncItems: (String filter) async {
                            CategoryStatusService _dataCategoryStatus =
                                await CategoryStatusService();
                            return _dataCategoryStatus.getCategoryStatusData();
                          },
                          onChanged: (data) {
                            setState(() {
                              _kategoriTitleKet = data!.title! +
                                  " - " +
                                  data.keterangan.toString();
                              _kategoriStatusID = data.id;
                            });
                          },
                          popupProps: PopupPropsMultiSelection.modalBottomSheet(
                            showSearchBox: true,
                            showSelectedItems: false,
                            searchFieldProps: textFieldProps(),
                            // showSearchBox: true,
                            itemBuilder: (context, item, isSelected) {
                              return itemDropdownBuilder(
                                item.status_kategori_code! +
                                    " - " +
                                    item.title! +
                                    " - " +
                                    item.keterangan.toString(),
                              );
                            },
                          ),
                          itemAsString: (item) =>
                              item.status_kategori_code! +
                              " - " +
                              item.title! +
                              " - " +
                              item.keterangan.toString(),
                        ),
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
                            onPressed: () async {
                              SharedPreferences _prefs =
                                  await SharedPreferences.getInstance();

                              // _updateIsSubmitted(true);
                              // Future.delayed(Duration(seconds: 5));
                              CreatedDataModel _data = CreatedDataModel(
                                user_id: _prefs.getString("user_id"),
                                category_business_id: _kategoriID,
                                lokasi_gudang: _lokasiGudangID,
                                nama_usaha: _namaUsaha.text,
                                nama_pj: _namaPJ.text,
                                jabatan_pj: _jabatanPJ.text,
                                no_telp: int.parse(_noTelpPJ.text),
                                province_id: _provinsiID,
                                kab_kota_id: _kotaID,
                                kecamatan_id: _kecamatanID,
                                alamat_detail: _alamatDetail.text,
                                harga: int.parse(_harga.text),
                                jenis_uco: _jenisUCO,
                                kemasan_id: _kemasanID,
                                quantity_kg: _quantityKg!,
                                quantity_liter: _quantityLiter,
                                kategori_status_id: _kategoriStatusID,
                              );
                              var compiling = _data.toJson();
                              print("to JSON : " + jsonEncode(compiling));
                              context
                                  .read<CreatedDataCubit>()
                                  .submittedData(compiling);
                            },
                            style: buttonStyleForForm.copyWith(
                              backgroundColor:
                                  MaterialStateProperty.all(buttonColor),
                            ),
                            child: (state is CreatedDataLoading)
                                ? CircularProgressIndicator()
                                : Text(
                                    "Submit",
                                    style: secondaryTextStyle.copyWith(
                                      fontWeight: bold,
                                      fontSize: 16,
                                    ),
                                  ),
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
      ),
    );
  }
}
