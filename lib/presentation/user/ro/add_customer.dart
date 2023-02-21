// import 'dart:convert';

// import 'dart:convert';
// import 'dart:html';

// import 'package:dio/dio.dart';
import 'dart:convert';

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
import 'package:green_corp_app/model/master_data/category_business.dart';
import 'package:green_corp_app/model/master_data/category_status.dart';
import 'package:green_corp_app/model/master_data/pack_type.dart';
import 'package:green_corp_app/model/transaction/created_data_model.dart';
import 'package:green_corp_app/model/transaction/get_customer_code.dart';
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
  String? _kategoriID;
  String? _kategoriBisnisID;

  final _idPelangganNew = TextEditingController();
  final _orderId = TextEditingController();
  TextEditingController _codePelanggan = TextEditingController();
  String? _selectedKategori;
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
  TextEditingController _keterangan = TextEditingController();
  TextEditingController _harga = TextEditingController(text: "0");
  String? _jenisUCO;
  double _quantityLiter = 0.0;
  String _defaultQtyLiter = "0";
  double? _quantityKg;
  String _defaultQtyKg = "0";
  String? _kemasan;
  String? _kemasanID;
  String? _kategoriStatusID;
  String? _kategoriTitleKet;
  String? username;
  String? usertype;
  TextEditingController? _kategori;
  TextEditingController? _kategoriBisnis;
  int _valueRadio = 0;

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

  void updateFromInbox(Map<dynamic, dynamic> value) {
    setState(() {
      _codePelanggan = TextEditingController(text: value["pelanggan_code"]);
      _namaUsaha = TextEditingController(text: value["nama_usaha"]);
      // _kategori = TextEditingController(text: value[""]);
      _namaPJ = TextEditingController(text: value["nama_pj"]);
      _jabatanPJ = TextEditingController(text: value["jabatan_pj"]);
      _noTelpPJ = TextEditingController(text: value["phone_number"]);
      _alamatDetail = TextEditingController(text: value["alamat"]);
      _provinsi = value["provinsi"];
      _provinsiID = int.parse(value["provinsi_id"]);
      _kota = value["kota"];
      _kotaID = int.parse(value["kota_id"]);
      _kecamatan = value["kecamatan"];
      _kecamatanID = int.parse(value["kecamatan_id"]);
      _kelurahan = value["kelurahan"];
      _kelurahanID = int.parse(value["kelurahan_id"]);
      _kategori = TextEditingController(text: value["kategori"]);
      _kategoriBisnis = TextEditingController(text: value["kategori_bisnis"]);
    });
  }

  KonversiLtKg objKonversi = KonversiLtKg();
  // User _dataUser = User();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _idPelangganNew.dispose();
    _orderId.dispose();
    _namaUsaha.dispose();
    _alamatDetail.dispose();
    _namaPJ.dispose();
    _jabatanPJ.dispose();
    _noTelpPJ.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _code = ModalRoute.of(context)!.settings.arguments as Map;
    if (_code["source"] == "inbox") {
      updateFromInbox(_code);
    }

    // print("Code Screen : ${_code_screen}");
    return BlocConsumer<CreatedDataCubit, CreatedDataState>(
      listener: (context, state) async {
        if (state is CreatedDataLoading) {
          print("Submitted Loading...");
        } else if (state is CreatedDataError) {
          // print("Error : " + state.errMessage.toString());
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
          SharedPreferences prefs = await SharedPreferences.getInstance();
          var snackbar = SnackBarCustom(title: state.successMessage);
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
          Get.offAllNamed(Landing.routeName,
              arguments: prefs.getString("role"));
        } else if (state is CreatedDataRepeatError) {
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
        } else if (state is CreatedDataRepeatSuccess) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          var snackbar = SnackBarCustom(title: state.succesMessage);
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
          Get.offAllNamed(Landing.routeName,
              arguments: prefs.getString("role"));
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
                              "Sales Type : ${usertype}",
                              style: secondaryTextStyle.copyWith(
                                fontWeight: bold,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                            )
                          : Container(),
                      (usertype != null)
                          ? Text(
                              "Sales Name : ${username}",
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
                        (_code["code_screen"] == "ro" ||
                                _code["source"] == "inbox")
                            ? TextFieldWithoutIcon(
                                context,
                                validatorField: (value) {
                                  if (value == null) {
                                    return "Field Wajib Diisi";
                                  }
                                  return null;
                                },
                                // hintText: "Nama Usaha",
                                readOnlyText: true,
                                obsText: false,
                                textController: _codePelanggan,
                                // textController: TextEditingController()
                                //   ..text = "Data USAHA",
                                label: "ID Pelanggan",
                              )
                            : Container(),
                        SizedBox(
                          height: 16,
                        ),
                        (_code["code_screen"] == "new")
                            ? Container()
                            : (_code["source"] == "inbox")
                                ? TextFieldWithoutIcon(
                                    context,
                                    validatorField: (value) {
                                      if (value == null) {
                                        return "Field Wajib Diisi";
                                      }
                                      return null;
                                    },
                                    // hintText: "Nama Usaha",
                                    readOnlyText: true,
                                    obsText: false,
                                    textController: _namaUsaha,
                                    // textController: TextEditingController()
                                    //   ..text = "Data USAHA",
                                    label: "Nama Usaha",
                                  )
                                : (_code["code_screen"] == "ro")
                                    ? DropdownSearch<GetCustomerCode>(
                                        validator: (value) {
                                          if (value == null) {
                                            return "Field Wajib Diisi";
                                          }
                                          return null;
                                        },
                                        // clearButtonProps: ClearButtonProps(isVisible: true),
                                        dropdownDecoratorProps:
                                            dropDownDecoratorPropsWidget(
                                                "Nama Usaha"),
                                        asyncItems: (String filter) async {
                                          GetCustomerService _dataCustomerCode =
                                              await GetCustomerService();

                                          return _dataCustomerCode
                                              .getCustomerCodeAll();
                                        },
                                        onChanged: (value) async {
                                          GetCustomerService
                                              _dataCustomerByCode =
                                              await GetCustomerService();
                                          _dataCustomerByCode
                                              .getCustomerCodeByCode(
                                                  value!.code_pelanggan!);
                                          setState(() {
                                            _codePelanggan =
                                                TextEditingController(
                                                    text: value.code_pelanggan);
                                            _namaUsaha = TextEditingController(
                                                text: value.nama_usaha);
                                            _kategori = TextEditingController(
                                                text: value.kategori);
                                            _namaPJ = TextEditingController(
                                                text: value.nama_pj);
                                            _jabatanPJ = TextEditingController(
                                                text: value.jabatan_pj);
                                            _noTelpPJ = TextEditingController(
                                                text: value.phone_number);
                                            _alamatDetail =
                                                TextEditingController(
                                                    text: value.alamat);
                                            _provinsi = value.provinsi;
                                            _provinsiID =
                                                int.parse(value.provinsi_id!);
                                            _kota = value.kabupaten_kota;
                                            _kotaID = int.parse(
                                                value.kabupaten_kota_id!);
                                            _kecamatan = value.kecamatan;
                                            _kecamatanID =
                                                int.parse(value.kecamatan_id!);
                                            _kategoriBisnis =
                                                TextEditingController(
                                                    text: value.kategoriBisnis);
                                            // _kelurahan = "Kemayoran";
                                          });
                                        },
                                        popupProps: PopupPropsMultiSelection
                                            .modalBottomSheet(
                                          showSearchBox: true,
                                          searchFieldProps: textFieldProps(),
                                          showSelectedItems: false,
                                          // showSearchBox: true,
                                          itemBuilder:
                                              (context, item, isSelected) {
                                            return itemDropdownBuilder(
                                                item.nama_usaha!);
                                          },
                                        ),
                                        itemAsString: (item) =>
                                            item.nama_usaha!,
                                      )
                                    : Container(),
                        SizedBox(
                          height: 16,
                        ),
                        (_code["code_screen"] == "new")
                            ? DropdownSearch<Category>(
                                validator: (value) {
                                  if (value == null) {
                                    return "Field Wajib Diisi";
                                  }
                                  return null;
                                },
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
                                popupProps:
                                    PopupPropsMultiSelection.modalBottomSheet(
                                  showSearchBox: true,
                                  searchFieldProps: textFieldProps(),
                                  showSelectedItems: false,
                                  // showSearchBox: true,
                                  itemBuilder: (context, item, isSelected) {
                                    return itemDropdownBuilder(item.title!);
                                  },
                                ),
                                itemAsString: (item) => item.title!,
                              )
                            : TextFieldWithoutIcon(
                                context,
                                validatorField: (value) {
                                  if (value == null) {
                                    return "Field Wajib Diisi";
                                  }
                                  return null;
                                },
                                // hintText: "Nama Usaha",
                                readOnlyText: true,
                                obsText: false,
                                // textController: _codePelanggan,
                                textController: _kategori,
                                //   ..text = "Data USAHA",
                                label: "Kategori",
                              ),
                        // (_code["code_screen"] == "new")
                        //     ? SizedBox(
                        //         height: 16,
                        //       )
                        //     : Container(),
                        // SizedBox(
                        //   height: 16,
                        // ),
                        SizedBox(
                          height: 16,
                        ),
                        (_code["code_screen"] == "new")
                            ? DropdownSearch<CategoryBusiness>(
                                validator: (value) {
                                  if (value == null) {
                                    return "Field Wajib Diisi";
                                  }
                                  return null;
                                },
                                // clearButtonProps: ClearButtonProps(isVisible: true),
                                dropdownDecoratorProps:
                                    dropDownDecoratorPropsWidget("Jenis Usaha"),
                                asyncItems: (String filter) async {
                                  CategoryService _dataCategoryBusiness =
                                      await CategoryService();
                                  return _dataCategoryBusiness
                                      .getCategoryBusinessData(
                                          category_id: _kategoriID!);
                                },
                                onChanged: (value) {
                                  setState(() {
                                    // _kategori = value!.title;
                                    print(value!.id);
                                    _kategoriBisnisID = value.id;
                                  });
                                },
                                popupProps:
                                    PopupPropsMultiSelection.modalBottomSheet(
                                  showSearchBox: true,
                                  searchFieldProps: textFieldProps(),
                                  showSelectedItems: false,
                                  // showSearchBox: true,
                                  itemBuilder: (context, item, isSelected) {
                                    return itemDropdownBuilder(item.title!);
                                  },
                                ),
                                itemAsString: (item) => item.title!,
                              )
                            : (_code["code_screen"] == "ro" ||
                                    _code["source"] == "inbox")
                                ? TextFieldWithoutIcon(
                                    context,
                                    validatorField: (value) {
                                      if (value == null) {
                                        return "Field Wajib Diisi";
                                      }
                                      return null;
                                    },
                                    // hintText: "Nama Usaha",
                                    readOnlyText: true,
                                    obsText: false,
                                    // textController: _codePelanggan,
                                    textController: _kategoriBisnis,
                                    //   ..text = "Data USAHA",
                                    label: "Jenis usaha",
                                  )
                                : Container(),
                        (_code["source"] == "inbox" ||
                                _code["code_screen"] == "ro")
                            ? Container()
                            : SizedBox(
                                height: 16,
                              ),

                        // (_code["code_screen"] == "ro")
                        //     ? TextFieldWithoutIcon(
                        //         context,
                        //         validatorField: (value) {
                        //           if (value == null) {
                        //             return "Field Wajib Diisi";
                        //           }
                        //         },
                        //         // hintText: "Nama Usaha",
                        //         readOnlyText: true,
                        //         obsText: false,
                        //         textController: _namaUsaha,
                        //         // textController: TextEditingController()
                        //         //   ..text = "Data USAHA",
                        //         label: "Nama Usaha",
                        //       )
                        //     : Container(),
                        (_code["code_screen"] == "new")
                            ? TextFieldWithoutIcon(
                                context,
                                validatorField: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Field Wajib Diisi";
                                  }
                                  return null;
                                },
                                // hintText: "Nama Usaha",
                                readOnlyText: (_code["code_screen"] == "ro" ||
                                        _code["source"] == "inbox")
                                    ? true
                                    : false,
                                obsText: false,
                                textController: _namaUsaha,
                                label: "Nama Usaha",
                              )
                            : SizedBox(
                                height: 16,
                              ),

                        (_code["code_screen"] == "new")
                            ? SizedBox(
                                height: 16,
                              )
                            : Container(),
                        TextFieldWithoutIcon(
                          context,
                          validatorField: (value) {
                            if (value == null || value.isEmpty) {
                              return "Field Wajib Diisi";
                            }
                            return null;
                          },
                          // hintText: "Nama Usaha",
                          readOnlyText: (_code["code_screen"] == "ro" ||
                                  _code["source"] == "inbox")
                              ? true
                              : false,
                          obsText: false,
                          textController: _namaPJ,
                          label: "Nama PJ",
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFieldWithoutIcon(
                          context,
                          validatorField: (value) {
                            if (value == null || value.isEmpty) {
                              return "Field Wajib Diisi";
                            }
                            return null;
                          },
                          // hintText: "Nama Usaha",
                          readOnlyText:
                              (_code["code_screen"] != "new") ? true : false,
                          obsText: false,
                          textController: _jabatanPJ,
                          label: "Jabatan PJ",
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFieldWithoutIcon(
                          context,
                          validatorField: (value) {
                            if (value == null || value.isEmpty) {
                              return "Field Wajib Diisi";
                            }
                            return null;
                          },
                          // hintText: "Nama Usaha",
                          readOnlyText:
                              (_code["code_screen"] != "new") ? true : false,
                          obsText: false,
                          textController: _noTelpPJ,
                          label: "No Telp PJ",
                          inputType: TextInputType.phone,
                          maximumLength: 13,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        (_code["code_screen"] == "new")
                            ? DropdownSearch<Province>(
                                validator: (value) {
                                  if (value == null) {
                                    return "Field Wajib Diisi";
                                  }
                                  return null;
                                },
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
                                popupProps:
                                    PopupPropsMultiSelection.modalBottomSheet(
                                  showSearchBox: true,
                                  showSelectedItems: false,
                                  searchFieldProps: textFieldProps(),
                                  // showSearchBox: true,
                                  itemBuilder: (context, item, isSelected) {
                                    return itemDropdownBuilder(
                                        item.province_name!);
                                  },
                                ),
                                itemAsString: (item) => item.province_name!,
                              )
                            : TextFieldWithoutIcon(
                                context,
                                // hintText: "Nama Usaha",
                                readOnlyText: (_code["code_screen"] != "new")
                                    ? true
                                    : false,
                                obsText: false,
                                textController:
                                    TextEditingController(text: _provinsi),
                                label: "Provinsi",
                              ),
                        SizedBox(
                          height: 16,
                        ),
                        (_code["code_screen"] == "new")
                            ? DropdownSearch<Regencies>(
                                validator: (value) {
                                  if (value == null) {
                                    return "Field Wajib Diisi";
                                  }
                                  return null;
                                },
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
                                popupProps:
                                    PopupPropsMultiSelection.modalBottomSheet(
                                  showSearchBox: true,
                                  showSelectedItems: false,
                                  searchFieldProps: textFieldProps(),
                                  // showSearchBox: true,
                                  itemBuilder: (context, item, isSelected) {
                                    return itemDropdownBuilder(item.kota_name!);
                                  },
                                ),
                                itemAsString: (item) => item.kota_name!,
                              )
                            : TextFieldWithoutIcon(
                                context,
                                // hintText: "Nama Usaha",
                                readOnlyText: (_code["code_screen"] != "new")
                                    ? true
                                    : false,
                                obsText: false,
                                textController:
                                    TextEditingController(text: _kota),
                                label: "Kota",
                              ),
                        SizedBox(
                          height: 16,
                        ),
                        (_code["code_screen"] == "new")
                            ? DropdownSearch<Districts>(
                                validator: (value) {
                                  if (value == null) {
                                    return "Field Wajib Diisi";
                                  }
                                  return null;
                                },
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
                                popupProps:
                                    PopupPropsMultiSelection.modalBottomSheet(
                                  showSearchBox: true,
                                  showSelectedItems: false,
                                  searchFieldProps: textFieldProps(),
                                  // showSearchBox: true,
                                  itemBuilder: (context, item, isSelected) {
                                    return itemDropdownBuilder(
                                        item.district_name!);
                                  },
                                ),
                                itemAsString: (item) => item.district_name!,
                              )
                            : TextFieldWithoutIcon(
                                context,
                                // hintText: "Nama Usaha",
                                readOnlyText: (_code["code_screen"] != "new")
                                    ? true
                                    : false,
                                obsText: false,
                                textController:
                                    TextEditingController(text: _kecamatan),
                                label: "Kecamatan",
                              ),
                        SizedBox(
                          height: 16,
                        ),
                        (_code["code_screen"] == "new")
                            ? DropdownSearch<Villages>(
                                validator: (value) {
                                  if (value == null) {
                                    return "Field Wajib Diisi";
                                  }
                                  return null;
                                },
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
                                popupProps:
                                    PopupPropsMultiSelection.modalBottomSheet(
                                  showSearchBox: true,
                                  showSelectedItems: false,
                                  searchFieldProps: textFieldProps(),
                                  // showSearchBox: true,
                                  itemBuilder: (context, item, isSelected) {
                                    return itemDropdownBuilder(
                                        item.villages_name!);
                                  },
                                ),
                                itemAsString: (item) => item.villages_name!,
                              )
                            : TextFieldWithoutIcon(
                                context,
                                // hintText: "Nama Usaha",
                                readOnlyText: (_code["code_screen"] != "new")
                                    ? true
                                    : false,
                                obsText: false,
                                textController:
                                    TextEditingController(text: _kelurahan),
                                label: "Kelurahan",
                              ),
                        SizedBox(
                          height: 16,
                        ),
                        (_code["code_screen"] == "new")
                            ? DropdownSearch<Regencies>(
                                validator: (value) {
                                  if (value == null) {
                                    return "Field Wajib Diisi";
                                  }
                                  return null;
                                },
                                dropdownDecoratorProps:
                                    dropDownDecoratorPropsWidget(
                                        "Lokasi Gudang"),
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
                                popupProps:
                                    PopupPropsMultiSelection.modalBottomSheet(
                                  showSearchBox: true,
                                  showSelectedItems: false,
                                  searchFieldProps: textFieldProps(),
                                  // showSearchBox: true,
                                  itemBuilder: (context, item, isSelected) {
                                    return itemDropdownBuilder(item.kota_name!);
                                  },
                                ),
                                itemAsString: (item) => item.kota_name!,
                              )
                            : TextFieldWithoutIcon(
                                context,
                                // hintText: "Nama Usaha",
                                readOnlyText: (_code["code_screen"] != "new")
                                    ? true
                                    : false,
                                obsText: false,
                                textController:
                                    TextEditingController(text: _kota),
                                label: "Lokasi Gudang",
                              ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFieldWithoutIcon(
                          context,
                          validatorField: (value) {
                            if (value == null || value.isEmpty) {
                              return "Field Wajib Diisi";
                            }
                            return null;
                          },
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
                          validatorField: (value) {
                            if (value == null) {
                              return "Field Wajib Diisi";
                            }
                            return null;
                          },
                          itemList: ['Padat', 'Cair', 'No UCO'],
                          labelField: "Jenis UCO",
                          function: (value) {
                            // print("Jenis UCO : ${value}");
                            setState(() {
                              // _jenisUCO = (value == "No UCO") ? "N" : "C";
                              if (value == "Padat") {
                                _jenisUCO = "P";
                              } else if (value == "Cair") {
                                _jenisUCO = "C";
                              } else if (value == "No UCO") {
                                _jenisUCO = "N";
                                _quantityKg = 0.0;
                                _quantityLiter = 0;
                              }
                            });
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        (_jenisUCO != "N")
                            ? DropdownSearch<PackType>(
                                validator: (value) {
                                  if (value == null) {
                                    return "Field Wajib Diisi";
                                  }
                                  return null;
                                },
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
                                },
                                popupProps:
                                    PopupPropsMultiSelection.modalBottomSheet(
                                  showSearchBox: true,
                                  showSelectedItems: false,
                                  searchFieldProps: textFieldProps(),
                                  // showSearchBox: true,
                                  itemBuilder: (context, item, isSelected) {
                                    return itemDropdownBuilder(item.title!);
                                  },
                                ),
                                itemAsString: (item) => item.title!,
                              )
                            : Container(),
                        // Radio Button Mode Konversi
                        (_jenisUCO != "N")
                            ? Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ListTile(
                                      leading: Radio(
                                        value: 0,
                                        groupValue: _valueRadio,
                                        onChanged: (value) {
                                          setState(() {
                                            _valueRadio = value!;
                                            _quantityKg = 0.0;
                                            _quantityLiter = 0;
                                          });
                                        },
                                      ),
                                      title: Text("Mode Konversi Lt-Kg"),
                                    ),
                                    ListTile(
                                      leading: Radio(
                                        value: 1,
                                        groupValue: _valueRadio,
                                        onChanged: (value) {
                                          setState(() {
                                            _valueRadio = value!;
                                            _quantityKg = 0.0;
                                            _quantityLiter = 0;
                                          });
                                        },
                                      ),
                                      title: Text("Mode Konversi Kg-Lt"),
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                        (_jenisUCO != "N")
                            ? (_valueRadio == 0)
                                ? Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            right: 17.5,
                                          ),
                                          child: TextFieldWithoutIcon(
                                            context,
                                            validatorField: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "Field Wajib Diisi";
                                              }
                                              return null;
                                            },
                                            obsText: false,
                                            // initValue: _defaultQtyLiter,
                                            readOnlyText: (_jenisUCO == "N")
                                                ? true
                                                : false,
                                            textController: (_jenisUCO == "N")
                                                ? TextEditingController(
                                                    text: _defaultQtyLiter)
                                                : null,
                                            label: "Quantity/Lt",
                                            // initValue: _quantityLiter.toString(),
                                            inputType:
                                                TextInputType.numberWithOptions(
                                                    decimal: false),
                                            // contentPrefixText: "Kg",
                                            convertValueOnChanged: (val) {
                                              if (val!.isEmpty) {
                                                val = "0";
                                              }
                                              double res_convert =
                                                  objKonversi.getKonversiLtToKg(
                                                      double.parse(val));
                                              setState(
                                                () {
                                                  // _updateQuantityLt(val);

                                                  _updateQuantityKg(
                                                      res_convert);
                                                  _quantityLiter =
                                                      double.tryParse(val!)!;
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
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          // color: Colors.red,
                                          margin: EdgeInsets.only(
                                            left: 5,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                  )
                                :
                                // Mode Konversi Kg-Lt
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
                                            validatorField: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "Field Wajib Diisi";
                                              }
                                              return null;
                                            },
                                            obsText: false,
                                            // initValue: _defaultQtyLiter,
                                            readOnlyText: (_jenisUCO == "N")
                                                ? true
                                                : false,
                                            textController: (_jenisUCO == "N")
                                                ? TextEditingController(
                                                    text: _defaultQtyKg)
                                                : null,
                                            label: "Quantity/Kg",
                                            // initValue: _quantityLiter.toString(),
                                            inputType:
                                                TextInputType.numberWithOptions(
                                                    decimal: false),
                                            // contentPrefixText: "Kg",
                                            convertValueOnChanged: (val) {
                                              if (val!.isEmpty) {
                                                val = "0";
                                              }
                                              double res_convert =
                                                  objKonversi.getKonversiKgToLt(
                                                      double.parse(val));
                                              setState(
                                                () {
                                                  // _updateQuantityLt(val);

                                                  _updateQuantityLt(
                                                      res_convert);
                                                  _quantityKg =
                                                      double.tryParse(val!)!;
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
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          // color: Colors.red,
                                          margin: EdgeInsets.only(
                                            left: 5,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "Quantity/Lt",
                                              ),
                                              Text(
                                                  "${(_quantityLiter != 0) ? _quantityLiter.toString() : 0}")
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                            : Container(),

                        TextFieldWithoutIcon(
                          context,
                          validatorField: (value) {
                            if (value == null) {
                              return "Field Wajib Diisi";
                            }
                            return null;
                          },
                          // hintText: "Nama Usaha",
                          obsText: false,
                          readOnlyText: (_jenisUCO == "N") ? true : false,
                          textController: _harga,
                          label: "Harga Satuan",
                          inputType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        DropdownSearch<CategoryStatus>(
                          validator: (value) {
                            if (value == null) {
                              return "Field Wajib Diisi";
                            }
                            return null;
                          },
                          dropdownDecoratorProps:
                              dropDownDecoratorPropsWidget("Kategori Status"),
                          asyncItems: (String filter) async {
                            String category_name =
                                (_jenisUCO == "N") ? "No Uco" : "Deal";
                            CategoryStatusService _dataCategoryStatus =
                                await CategoryStatusService();
                            return _dataCategoryStatus.getCategoryStatusData(
                                category_name: category_name);
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
                              if (_formKey.currentState!.validate()) {
                                SharedPreferences _prefs =
                                    await SharedPreferences.getInstance();
                                CreatedDataModel _data = CreatedDataModel(
                                  user_id: _prefs.getString("user_id"),
                                  category_business_id: _kategoriBisnisID,
                                  lokasi_gudang: _lokasiGudangID,
                                  nama_usaha: _namaUsaha.text,
                                  nama_pj: _namaPJ.text,
                                  jabatan_pj: _jabatanPJ.text,
                                  no_telp: int.parse(_noTelpPJ.text),
                                  province_id: _provinsiID,
                                  kab_kota_id: _kotaID,
                                  kecamatan_id: _kecamatanID,
                                  kelurahan_id: _kelurahanID,
                                  alamat_detail: _alamatDetail.text,
                                  harga: int.parse(_harga.text),
                                  jenis_uco: _jenisUCO,
                                  kemasan_id: _kemasanID,
                                  quantity_kg: _quantityKg!,
                                  quantity_liter: _quantityLiter,
                                  kategori_status_id: _kategoriStatusID,
                                  status_pelanggan: (_code["source"] == "inbox")
                                      ? "E"
                                      : (_code["code_screen"] == "ro")
                                          ? "R"
                                          : "",
                                  pelanggan_code:
                                      (_codePelanggan.text.isNotEmpty)
                                          ? _codePelanggan.text
                                          : null,
                                );
                                if (_code["code_screen"] == "new") {
                                  var compiling = _data.toJson();
                                  print("to JSON : " + jsonEncode(compiling));
                                  context
                                      .read<CreatedDataCubit>()
                                      .submittedData(compiling);
                                } else {
                                  var compiling = _data.toJsonRepeat();
                                  print("to JSON : " + jsonEncode(compiling));
                                  context
                                      .read<CreatedDataCubit>()
                                      .submittedDataRepeat(compiling);
                                }
                              }
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
