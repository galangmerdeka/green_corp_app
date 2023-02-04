import 'package:bloc/bloc.dart';
import 'package:green_corp_app/infrastructure/transaction/get_inbox.dart';
import 'package:green_corp_app/model/transaction/inbox.dart';
import 'package:meta/meta.dart';

part 'check_status_state.dart';

class CheckStatusCubit extends Cubit<CheckStatusState> {
  CheckStatusCubit() : super(CheckStatusInitial());

  final GetInbox _getInbox = GetInbox();

  void checkStatus(String id) async {
    emit(InboxLoadingCheckStatus());
    try {
      final _data = await _getInbox.getCheckStatusTransaction(id);
      _data.fold(
        (l) => emit(InboxCheckStatusError(l)),
        (r) => emit(InboxCheckStatusSuccess(r)),
      );
    } catch (e) {
      emit(InboxCheckStatusError(e.toString()));
    }
  }
}
