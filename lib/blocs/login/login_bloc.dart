import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sunhope_computer_software/api_repository/api_repo_singleton.dart';
import 'package:sunhope_computer_software/config/app_config.dart';
import 'package:sunhope_computer_software/core/storage/app_storage.dart';
import 'package:sunhope_computer_software/data/login_req.dart';
import 'package:sunhope_computer_software/data/login_res.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitializing()) {
    on<RequestLogin>((event, emit) async {
      try {
        emit(LoginRequesting());
        final res = await ApiRepoSingleton.instance.login(event.req);
        if (res.status == "SUCCESS") {
          if (res.token != null) {
            await AppStorage.setToken(res.token!);
            await appConfig();
            emit(LoginSuccess(res: res));
          } else {
            emit(LoginError());
          }
        } else {
          emit(LoginFail());
        }
      } catch (e) {
        emit(LoginError());
      }
    });
  }
}
