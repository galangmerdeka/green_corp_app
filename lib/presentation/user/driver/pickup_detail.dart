import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  bool _isSubmitted = false;
  // SignatureController? _controllerSign;

  Future getImage1() async {
    final ImagePicker _imagePicker = ImagePicker();
    final XFile? _imagePicked =
        await _imagePicker.pickImage(source: ImageSource.camera);
    image1 = File(_imagePicked!.path);
    setState(() {
      print("image 1 path : ${image1}");
    });
  }

  Future getImage2() async {
    final ImagePicker _imagePicker = ImagePicker();
    final XFile? _imagePicked =
        await _imagePicker.pickImage(source: ImageSource.camera);
    image2 = File(_imagePicked!.path);
    setState(() {
      print("image 2 path : ${image2}");
    });
  }

  void _updateIsSubmitted(value) {
    setState(() {
      _isSubmitted = value;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                      detailPickupData("ID Pelanggan", "ID0001"),
                      Divider(
                        thickness: 2,
                      ),
                      detailPickupData("Order OD", "0001"),
                      Divider(
                        thickness: 2,
                      ),
                      detailPickupData("Sales Name", "Yudha"),
                      Divider(
                        thickness: 2,
                      ),
                      detailPickupData("Lokasi Gudang", "Gudang WH01"),
                      Divider(
                        thickness: 2,
                      ),
                      detailPickupData("Nama Usaha", "Hotel Ave Kalimantan"),
                      Divider(
                        thickness: 2,
                      ),
                      detailPickupData("Nama PJ", "Agus"),
                      Divider(
                        thickness: 2,
                      ),
                      detailPickupData("Nama PIC", "Suratno"),
                      Divider(
                        thickness: 2,
                      ),
                      detailPickupData("No Telp", "08474893938"),
                      Divider(
                        thickness: 2,
                      ),
                      detailPickupData("Alamat Detail",
                          "Jln. Perum Suka Suka Kec Ledo, Kel Sabalo Bengkayang Kalimantan"),
                      Divider(
                        thickness: 2,
                      ),
                      detailPickupData("Kemasan", "Jerigen 25"),
                      Divider(
                        thickness: 2,
                      ),
                      detailPickupData("Total Kemasan", "35"),
                      Divider(
                        thickness: 2,
                      ),
                      detailPickupData("Jenis UCO", "Cair"),
                      Divider(
                        thickness: 2,
                      ),
                      detailPickupData("Total Quantity / Lt", "350"),
                      Divider(
                        thickness: 2,
                      ),
                      detailPickupData("Total Quantity / Kg", "35"),
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
                                          style: secondaryTextStyle.copyWith(
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
                                          style: secondaryTextStyle.copyWith(
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
                                  await Get.to(SignaturePage());
                              setState(() {
                                // print("data sign : ${getSignature}");
                                this.signature = getSignature;
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
                          // child: GestureDetector(
                          //   onTap: () async {
                          //     final getSignature =
                          //         await Get.to(SignaturePage());
                          //     setState(() {
                          //       // print("data sign : ${getSignature}");
                          //       this.signature = getSignature;
                          //     });
                          //   },
                          //   child: Text(
                          //     (signature != null)
                          //         ? "Re-Signing"
                          //         : "Click to add signature here",
                          //     style: primaryTextStyle.copyWith(
                          //       fontSize: 16,
                          //     ),
                          //   ),
                          // ),
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
                          onPressed: () {
                            _updateIsSubmitted(true);
                            // Future.delayed(Duration(seconds: 5));

                            var snackbar = SnackBarCustom(
                                title: "Data Has Been Submitted");
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                            Get.offNamedUntil(Task.routeName,
                                ModalRoute.withName('/landing'));
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
              ],
            ),
          ),
        ),
      ),
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
