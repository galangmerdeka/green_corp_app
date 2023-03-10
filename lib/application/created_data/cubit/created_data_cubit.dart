import 'package:bloc/bloc.dart';
import 'package:green_corp_app/infrastructure/transaction/add_data.dart';
// import 'package:green_corp_app/model/transaction.dart/created_data_model.dart';
import 'package:meta/meta.dart';

part 'created_data_state.dart';

class CreatedDataCubit extends Cubit<CreatedDataState> {
  CreatedDataCubit() : super(CreatedDataInitial());
  final AddData _createdNewService = new AddData();
  void submittedData(Map<String, dynamic> _dataSubmitted) async {
    emit(CreatedDataLoading());
    try {
      final _data = await _createdNewService.createdDataNew(
          createdDataModel: _dataSubmitted);
      _data.fold(
        (l) => emit(CreatedDataError(l)),
        (r) => emit(CreatedDataSuccess(r)),
      );
    } catch (e) {
      emit(CreatedDataError(e.toString()));
    }
  }

  void submittedDataRepeat(Map<String, dynamic> _dataSubmitted) async {
    emit(CreatedDataLoading());
    try {
      final _data = await _createdNewService.createdDataRepeat(
          createdDataModel: _dataSubmitted);
      _data.fold(
        (l) => emit(CreatedDataRepeatError(l)),
        (r) => emit(CreatedDataRepeatSuccess(r)),
      );
    } catch (e) {
      emit(CreatedDataRepeatError(e.toString()));
    }
  }
}
