import 'package:bloc/bloc.dart';
import 'package:green_corp_app/infrastructure/transaction/created_new_service.dart';
import 'package:green_corp_app/model/transaction.dart/created_data_model.dart';
import 'package:meta/meta.dart';

part 'created_data_state.dart';

class CreatedDataCubit extends Cubit<CreatedDataState> {
  CreatedDataCubit() : super(CreatedDataInitial());
  final CreatedNewService _createdNewService = new CreatedNewService();
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
}
