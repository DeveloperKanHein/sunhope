class LoginRes {
  String? status;
  String? message;
  String? token;
  LoginRes({this.status, this.message, this.token});
  factory LoginRes.fromJson(Map<String, dynamic> json) => LoginRes(
      status: json['status'], message: json['message'], token: json['token']);
  Map<String, dynamic> toJson() => {'status': status, 'message': message};
}
