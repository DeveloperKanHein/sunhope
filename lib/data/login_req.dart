class LoginReq {
  String? username;
  String? password;
  LoginReq({this.username, this.password});
  factory LoginReq.fromJson(Map<String, dynamic> json) =>
      LoginReq(username: json['username'], password: json['password']);
  Map<String, dynamic> toJson() => {"username": username, "password": password};
}
