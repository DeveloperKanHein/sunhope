class ResMessage {
  String? status;
  String? message;
  ResMessage({this.status, this.message});
  factory ResMessage.fromJson(Map<String, dynamic> json) =>
      ResMessage(status: json['status'], message: json['message']);
}
