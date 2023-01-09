part of 'created_data_cubit.dart';

@immutable
abstract class CreatedDataState {}

class CreatedDataInitial extends CreatedDataState {}

class CreatedDataLoading extends CreatedDataState {}

class CreatedDataError extends CreatedDataState {
  final String errMessage;
  // final String errCode;
  CreatedDataError(this.errMessage);
}

class CreatedDataSuccess extends CreatedDataState {
  final String successMessage;
  CreatedDataSuccess(this.successMessage);
}
