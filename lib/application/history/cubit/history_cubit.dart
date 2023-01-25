import 'package:bloc/bloc.dart';
import 'package:green_corp_app/infrastructure/transaction/get_transaction.dart';
import 'package:green_corp_app/model/transaction.dart/history.dart';
import 'package:meta/meta.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryInitial());

  final GetTransaction _getTransaction = GetTransaction();

  void getHistory({
    String date = "",
    String status_pelanggan = "",
    String nama_usaha = "",
  }) async {
    emit(HistoryLoading());
    try {
      final _data = await _getTransaction.getHistoryByParam(
          date: date,
          status_pelanggan: status_pelanggan,
          nama_usaha: nama_usaha);
      _data.fold(
        (l) => emit(HistoryError(l)),
        (r) => emit(HistorySuccess(r)),
      );
    } catch (e) {
      emit(HistoryError(e.toString()));
    }
  }
}
