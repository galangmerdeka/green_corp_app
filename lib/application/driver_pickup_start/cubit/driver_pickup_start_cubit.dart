import 'package:bloc/bloc.dart';
import 'package:green_corp_app/infrastructure/driver/driver_service.dart';
import 'package:meta/meta.dart';

part 'driver_pickup_start_state.dart';

class DriverPickupCubit extends Cubit<DriverPickupState> {
  DriverPickupCubit() : super(DriverPickupStartInitial());
  final DriverService _driverService = DriverService();

  void startPickupByTransID(String transaction_id) async {
    emit(DriverPickupStartLoading());
    try {
      final _data =
          await _driverService.startTimePickupByTransID(transaction_id);
      _data.fold(
        (l) => emit(DriverPickupStartError(l)),
        (r) => emit(DriverPickupStartSucces(r)),
      );
    } catch (e) {
      emit(DriverPickupStartError(e.toString()));
    }
  }

  void rescheduleRequest(String transaction_id, String reschedule_note) async {
    emit(DriverRescheduleLoading());
    try {
      final _data = await _driverService.reschedule(
          transaction_id: transaction_id, reschedule_note: reschedule_note);
      _data.fold(
        (l) => emit(DriverRescheduleError(l)),
        (r) => emit(DriverRescheduleSuccess(r)),
      );
    } catch (e) {
      emit(DriverRescheduleError(e.toString()));
    }
  }

  void submitPickupProcess(String transaction_id, String pic_1, String pic_2,
      String signature) async {
    emit(DriverPickupLoading());
    try {
      final _data = await _driverService.submitPickup(
          transaction_id: transaction_id,
          pic_1: pic_1,
          pic_2: pic_2,
          signature: signature);
      _data.fold(
        (l) => emit(DriverPickupError(l)),
        (r) => emit(DriverPickupSuccess(r)),
      );
    } catch (e) {
      emit(DriverPickupError(e.toString()));
    }
  }
}
