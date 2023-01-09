import 'package:bloc/bloc.dart';
import 'package:green_corp_app/infrastructure/auth/auth_service.dart';
import 'package:green_corp_app/model/user/user.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthServiceRepository _authServiceRepository = AuthServiceRepository();

  void signInUser(String username, String password) async {
    emit(AuthLoading());
    try {
      var mapDataLogin = new Map<String, String>();
      mapDataLogin["phone_number"] = username;
      mapDataLogin["password"] = password;
      final _data =
          await _authServiceRepository.signInUserAuth(dataLogin: mapDataLogin);
      _data.fold(
        (l) => emit(AuthError(l)),
        (r) => emit(AuthSuccess(r)),
      );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
