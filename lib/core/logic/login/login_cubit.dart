import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_test/core/network/app_exception.dart';
import 'package:next_test/core/service/login_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginService) : super(LoginInitial());

  final LoginService loginService;

  Future<void> login(String name, String hobby) async {
    emit(LoginLoading());
    try {
      await loginService.postSubmit(name, hobby);
      emit(LoginLoaded());
    } on AppException catch (e) {
      emit(LoginFailed(e.message));
    } catch (e) {
      emit(LoginFailed(e.toString()));
    }
  }
}
