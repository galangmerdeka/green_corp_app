import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:green_corp_app/presentation/user/driver/pickup_detail.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:green_corp_app/presentation/widget/appbar_custom.dart';
import 'package:green_corp_app/theme.dart';
import 'package:signature/signature.dart';

class SignaturePage extends StatefulWidget {
  const SignaturePage({super.key});

  @override
  State<SignaturePage> createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  SignatureController? controller;

  @override
  void initState() {
    super.initState();
    controller = SignatureController(
      // penColor: Colors.black,
      penStrokeWidth: 5,
    );
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBarCustom(context, "Signature"),
      body: SafeArea(
        child: Container(
          // color: Color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Signature(
                controller: controller!,
                // backgroundColor: Colors.white30,
                width: MediaQuery.of(context).size.width,
                height: 400,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                // color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => controller!.clear(),
                          icon: Icon(
                            Icons.clear,
                            color: Colors.red,
                          ),
                        ),
                        Text("Clear")
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            if (controller!.isNotEmpty) {
                              final signature = await exportSignature();
                              // Navigator.pop(context, signature);
                              Get.back(result: signature, closeOverlays: true);
                            }
                          },
                          icon: Icon(
                            Icons.check,
                            color: buttonColor,
                          ),
                        ),
                        Text("Save")
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Uint8List?> exportSignature() async {
    final exportController = SignatureController(
      penStrokeWidth: 2,
      // penColor: Colors.black,
      exportBackgroundColor: Colors.white,
      points: controller!.points,
    );
    final signature = await exportController.toPngBytes();
    exportController.dispose();
    return signature;
  }
}
