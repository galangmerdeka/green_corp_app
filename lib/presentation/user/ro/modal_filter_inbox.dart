// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_corp_app/application/inbox/cubit/inbox_cubit.dart';
import 'package:green_corp_app/presentation/widget/text_field.dart';
import 'package:green_corp_app/theme.dart';
import 'package:intl/intl.dart';

class modalFilterInbox extends StatefulWidget {
  const modalFilterInbox({super.key});

  @override
  State<modalFilterInbox> createState() => _modalFilterInboxState();
}

class _modalFilterInboxState extends State<modalFilterInbox> {
  TextEditingController _searchNamaUsaha = TextEditingController();
  TextEditingController _searchIdPelanggan = TextEditingController();
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
                textController: _searchNamaUsaha,
                label: "Nama Usaha",
                iconField: Icons.work_history_rounded,
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                context,
                obsText: false,
                textController: _searchIdPelanggan,
                label: "ID Pelanggan",
                iconField: Icons.person_2_rounded,
              ),
              SizedBox(
                height: 10,
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
                      context.read<InboxCubit>().getInbox(
                            nama_usaha: _searchNamaUsaha.text,
                            pelanggan_code: _searchIdPelanggan.text,
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
