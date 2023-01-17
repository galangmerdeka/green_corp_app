import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:get/get.dart';
import 'package:green_corp_app/application/driver_pickup_start/cubit/driver_pickup_start_cubit.dart';
import 'package:green_corp_app/application/driver_task/cubit/driver_task_cubit.dart';
import 'package:green_corp_app/config/constant.dart';
// import 'package:green_corp_app/config/constant.dart';
// import 'package:green_corp_app/presentation/landing_page/landing.dart';
import 'package:green_corp_app/presentation/user/driver/signature_page.dart';
import 'package:green_corp_app/presentation/user/driver/task.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:green_corp_app/presentation/widget/appbar_custom.dart';
import 'package:green_corp_app/presentation/widget/snackbar_custom.dart';
import 'package:green_corp_app/theme.dart';
// import 'package:signature/signature.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PickupDetail extends StatefulWidget {
  const PickupDetail({super.key});
  static const routeName = '/driver/task/pickup-detail';

  @override
  State<PickupDetail> createState() => _PickupDetailState();
}

class _PickupDetailState extends State<PickupDetail> {
  File? image1;
  File? image2;
  Uint8List? signature;
  String? image1base64;
  String? image2base64;
  String? signbase64;
  // bool _isSubmitted = false;
  // final image1encoded;
  // SignatureController? _controllerSign;

  Future getImage1() async {
    final ImagePicker _imagePicker = ImagePicker();
    final XFile? _imagePicked = await _imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 10, maxWidth: 200);
    image1 = File(_imagePicked!.path);
    // XFile resultCompressedFile = compressedFile(_imagePicked);
    // printInfo(info: _imagePicked.readAsBytes().toString());
    Uint8List image1bytes = await _imagePicked.readAsBytes();

    setState(() {
      // print("image 1 path : ${image1}");
      image1base64 = base64.encode(image1bytes);
    });
  }

  Future getImage2() async {
    final ImagePicker _imagePicker = ImagePicker();
    final XFile? _imagePicked = await _imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 10, maxWidth: 200);
    image2 = File(_imagePicked!.path);
    Uint8List image2bytes = await _imagePicked.readAsBytes();
    setState(() {
      // print("image 2 path : ${image2}");
      image2base64 = base64.encode(image2bytes);
    });
  }

  // Future<File> compressedFile(File file) async {
  //   File compressedFile =
  //       await FlutterNativeImage.compressImage(file.path, quality: 10);
  //   return compressedFile;
  // }

  // void _updateIsSubmitted(value) {
  //   setState(() {
  //     _isSubmitted = value;
  //   });
  // }

  void _checkImageNull() {
    if (image1 == null || image2 == null || signature == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            icon: Icon(
              Icons.info_outlined,
              color: Colors.red,
            ),
            content: Text(
              "Foto dan Tanda Tangan harus disertakan",
              style: secondaryTextStyle,
            ),
            actions: [
              Center(
                child: ElevatedButton.icon(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.close_outlined),
                  label: Text(
                    "Close",
                    style: secondaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final _dataPickupDetail = ModalRoute.of(context)!.settings.arguments as Map;
    return BlocConsumer<DriverPickupCubit, DriverPickupState>(
      listener: (context, state) async {
        // TODO: implement listener
        if (state is DriverPickupLoading) {
          print("Sending data Pickup...");
        } else if (state is DriverPickupError) {
          alertDialogErrorPickup(context, state);
        } else if (state is DriverPickupSuccess) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          print("Response : " + state.successMessage);
          var snackbar = SnackBarCustom(title: state.successMessage);
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
          // Get.offNamedUntil(Task.routeName, ModalRoute.withName('/landing'));
          context
              .read<DriverTaskCubit>()
              .getDataDriverTaskByDriverID(prefs.getString("user_id")!);
          Get.offAll(() => Task());
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBarCustom(context, "Pickup Detail"),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      width: double.infinity,
                      // color: Colors.green,
                      child: Column(
                        children: [
                          Text(
                            "Customer",
                            style: secondaryTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: bold,
                            ),
                          ),
                          detailPickupData("ID Pelanggan",
                              _dataPickupDetail["pelanggan_code"]),
                          Divider(
                            thickness: 2,
                          ),
                          detailPickupData(
                              "Order ID", _dataPickupDetail["order_code"]),
                          Divider(
                            thickness: 2,
                          ),
                          detailPickupData("Sales Name",
                              _dataPickupDetail["user_created_name"]),
                          Divider(
                            thickness: 2,
                          ),
                          detailPickupData("Lokasi Gudang",
                              _dataPickupDetail["gudang_name"]),
                          Divider(
                            thickness: 2,
                          ),
                          detailPickupData(
                              "Nama Usaha", _dataPickupDetail["nama_usaha"]),
                          Divider(
                            thickness: 2,
                          ),
                          detailPickupData(
                              "Nama PJ", _dataPickupDetail["nama_pj"]),
                          Divider(
                            thickness: 2,
                          ),
                          detailPickupData("No Telp",
                              "0${_dataPickupDetail["phone_number"]}"),
                          Divider(
                            thickness: 2,
                          ),
                          detailPickupData(
                              "Alamat Detail", _dataPickupDetail["alamat"]),
                          Divider(
                            thickness: 2,
                          ),
                          detailPickupData(
                              "Kemasan", _dataPickupDetail["kemasan"]),
                          Divider(
                            thickness: 2,
                          ),
                          detailPickupData("Total Kemasan",
                              _dataPickupDetail["total_kemasan"]),
                          Divider(
                            thickness: 2,
                          ),
                          detailPickupData(
                              "Jenis UCO", _dataPickupDetail["jenis_uco"]),
                          Divider(
                            thickness: 2,
                          ),
                          detailPickupData("Total Quantity / Lt",
                              _dataPickupDetail["quantity_liter"]),
                          Divider(
                            thickness: 2,
                          ),
                          detailPickupData("Total Quantity / Kg",
                              _dataPickupDetail["quantity_kg"]),
                          Divider(
                            thickness: 2,
                          ),
                          Text(
                            "Bukti Kunjungan",
                            style: secondaryTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: bold,
                            ),
                          ),
                          (image1 != null)
                              ? Column(
                                  children: [
                                    Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Image.file(
                                        image1!,
                                        filterQuality: FilterQuality.medium,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        await getImage1();
                                      },
                                      child: Container(
                                        // color: Colors.red,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.add_a_photo_rounded),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Retake",
                                              style:
                                                  secondaryTextStyle.copyWith(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: fourthColorGrey,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () async {
                                        await getImage1();
                                      },
                                      icon: Icon(
                                        Icons.add_a_photo_rounded,
                                      ),
                                    ),
                                  ),
                                ),
                          SizedBox(
                            height: 10,
                          ),
                          (image2 != null)
                              ? Column(
                                  children: [
                                    Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Image.file(
                                        image2!,
                                        filterQuality: FilterQuality.medium,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        await getImage2();
                                      },
                                      child: Container(
                                        // color: Colors.red,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.add_a_photo_rounded),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Retake",
                                              style:
                                                  secondaryTextStyle.copyWith(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: fourthColorGrey,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () async {
                                        await getImage2();
                                      },
                                      icon: Icon(
                                        Icons.add_a_photo_rounded,
                                      ),
                                    ),
                                  ),
                                ),
                          SizedBox(
                            height: 10,
                          ),
                          (signature == null)
                              ? Container()
                              : Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: MemoryImage(signature!),
                                      filterQuality: FilterQuality.medium,
                                      fit: BoxFit.contain,
                                    ),
                                    // color: fourthColorGrey,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                          Container(
                            child: Center(
                              child: TextButton(
                                onPressed: () async {
                                  final getSignature =
                                      await Get.to(() => SignaturePage());
                                  setState(() {
                                    this.signature = getSignature;
                                    signbase64 = base64.encode(getSignature);
                                  });
                                },
                                child: Text(
                                  (signature != null)
                                      ? "Re-Signing"
                                      : "Click to add signature here",
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            // color: Colors.red,
                            margin: EdgeInsets.only(
                              bottom: 10,
                            ),
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: (state is DriverPickupLoading)
                                  ? null
                                  : () async {
                                      // _updateIsSubmitted(true);
                                      // Future.delayed(Duration(seconds: 5));
                                      _checkImageNull();
                                      context
                                          .read<DriverPickupCubit>()
                                          .submitPickupProcess(
                                            _dataPickupDetail["transaction_id"],
                                            BASE64INITVALUE + image1base64!,
                                            BASE64INITVALUE + image2base64!,
                                            BASE64INITVALUE + signbase64!,
                                          );
                                    },
                              style: buttonStyleForForm.copyWith(
                                backgroundColor:
                                    MaterialStateProperty.all(buttonColor),
                              ),
                              child: (state is DriverPickupLoading)
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> alertDialogErrorPickup(
      BuildContext context, DriverPickupError state) {
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

  Row detailPickupData(String fieldName, String valueData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 1,
          child: Container(
            child: Text(
              fieldName,
              style: secondaryTextStyle.copyWith(
                fontSize: 12,
                fontWeight: semiBold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            child: Text(
              valueData,
              style: secondaryTextStyle.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    );
  }
}
