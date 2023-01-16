part of 'driver_pickup_start_cubit.dart';

@immutable
abstract class DriverPickupState {}

class DriverPickupStartInitial extends DriverPickupState {}

class DriverPickupStartLoading extends DriverPickupState {}

class DriverPickupStartError extends DriverPickupState {
  final String errMessage;
  DriverPickupStartError(this.errMessage);
}

class DriverPickupStartSucces extends DriverPickupState {
  final String successMessage;
  DriverPickupStartSucces(this.successMessage);
}

class DriverRescheduleLoading extends DriverPickupState {}

class DriverRescheduleError extends DriverPickupState {
  final String errMessage;
  DriverRescheduleError(this.errMessage);
}

class DriverRescheduleSuccess extends DriverPickupState {
  final String successMessage;
  DriverRescheduleSuccess(this.successMessage);
}
