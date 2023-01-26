part of 'driver_task_cubit.dart';

@immutable
abstract class DriverTaskState {}

class DriverTaskInitial extends DriverTaskState {}

class DriverTaskLoading extends DriverTaskState {}

class DriverTaskError extends DriverTaskState {
  final String errMessage;
  DriverTaskError(this.errMessage);
}

class DriverGetTaskSuccess extends DriverTaskState {
  final List<PickupModel?> pickupModel;

  DriverGetTaskSuccess(this.pickupModel);
}

// class DriverPickStartTimeSuccess extends DriverTaskState {
//   final String successMessage;
//   DriverPickStartTimeSuccess(this.successMessage);
// }

// class DriverPickStartTimeLoading extends DriverTaskState {}
