import 'package:bloc/bloc.dart';
import 'package:green_corp_app/infrastructure/transaction/get_inbox.dart';
import 'package:green_corp_app/model/transaction/inbox.dart';
import 'package:meta/meta.dart';

part 'inbox_state.dart';

class InboxCubit extends Cubit<InboxState> {
  InboxCubit() : super(InboxInitial());

  final GetInbox _getInbox = GetInbox();

  void getInbox({String nama_usaha = "", String pelanggan_code = ""}) async {
    emit(InboxLoading());
    try {
      final _data = await _getInbox.getDataInboxByParam(
          nama_usaha: nama_usaha, pelanggan_code: pelanggan_code);
      _data.fold(
        (l) => emit(InboxError(l)),
        (r) => emit(InboxSuccess(r)),
      );
    } catch (e) {
      emit(InboxError(e.toString()));
    }
  }
}
