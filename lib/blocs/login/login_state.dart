part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitializing extends LoginState {
  //
}

class LoginRequesting extends LoginState {
  //
}

class LoginSuccess extends LoginState {
  final LoginRes res;
  LoginSuccess({required this.res});
}

class LoginFail extends LoginState {
  //
}

class LoginError extends LoginState {
  //
}
