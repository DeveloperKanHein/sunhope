class FillTopup {
  String? id;
  int? amount;
  FillTopup({this.id, this.amount});
  factory FillTopup.fromJson(Map<String, dynamic> json) =>
      FillTopup(id: json['id'], amount: json['amount']);
  Map<String, dynamic> toJson() => {'id': id, 'amount': amount};
}
