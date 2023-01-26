import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:green_corp_app/application/driver_task/cubit/driver_task_cubit.dart';
import 'package:green_corp_app/config/input_validation.dart';
// import 'package:green_corp_app/presentation/user/driver/pickup_detail.dart';
import 'package:green_corp_app/presentation/user/driver/task_driver_card.dart';
import 'package:green_corp_app/presentation/widget/appbar_custom.dart';
// import 'package:green_corp_app/presentation/widget/no_data_found.dart';
import 'package:green_corp_app/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
// import 'package:green_corp_app/theme.dart';

class Task extends StatefulWidget {
  const Task({super.key});
  static const routeName = '/driver/task';

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriverTaskCubit, DriverTaskState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is DriverTaskLoading) {
          print("Get Data Driver Task...");
        } else if (state is DriverTaskError) {
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
                actions: [
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        context
                            .read<DriverTaskCubit>()
                            .getDataDriverTaskByDriverID(
                                prefs.getString("user_id")!);
                        Get.back();
                      },
                      child: Text(
                        "Refresh",
                        style: secondaryTextStyle,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        } else if (state is DriverGetTaskSuccess) {
          print("Get Data Success..");
        }
      },
      builder: (context, state) {
        return (state is DriverTaskLoading)
            ? Scaffold(
                body: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Retrieving Data...",
                        style: secondaryTextStyle,
                      ),
                    ],
                  ),
                ),
              )
            : Scaffold(
                appBar: AppBarCustom(context, "Driver Task"),
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: (state is DriverGetTaskSuccess)
                        ? taskDriverCard(context, state.pickupModel)
                        : Container(),
                    // child: (state is DriverGetTaskSuccess)
                    //     ? (state.pickupModel.isNotEmpty)
                    //         ? taskDriverCard(context, state.pickupModel)
                    //         : noDataFound(
                    //             context,
                    //             () async {
                    //               SharedPreferences prefs =
                    //                   await SharedPreferences.getInstance();
                    //               context
                    //                   .read<DriverTaskCubit>()
                    //                   .getDataDriverTaskByDriverID(
                    //                       prefs.getString("user_id")!);
                    //               Get.toNamed(Task.routeName);
                    //             },
                    //           )
                    //     : Container(),
                  ),
                ),
              );
      },
    );
  }
}
