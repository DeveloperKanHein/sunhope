part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RequestLogin extends LoginEvent {
  final LoginReq req;
  RequestLogin({required this.req});
}
