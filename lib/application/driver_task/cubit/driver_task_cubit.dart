import 'package:bloc/bloc.dart';
import 'package:green_corp_app/infrastructure/driver/driver_service.dart';
import 'package:green_corp_app/model/driver/pickup.dart';
import 'package:meta/meta.dart';

part 'driver_task_state.dart';

class DriverTaskCubit extends Cubit<DriverTaskState> {
  DriverTaskCubit() : super(DriverTaskInitial());
  final DriverService _driverService = DriverService();

  void getDataDriverTaskByDriverID(String driver_id) async {
    emit(DriverTaskLoading());
    try {
      final _data = await _driverService.getDriverTaskByID(driver_id);
      _data.fold(
        (l) => emit(DriverTaskError(l)),
        (r) => emit(DriverGetTaskSuccess(r)),
      );
    } catch (e) {
      emit(DriverTaskError(e.toString()));
    }
  }
}
