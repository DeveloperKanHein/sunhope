class Daily {
  String? id;
  int? totalAmount;
  int? cash;
  int? kpay;
  int? count;
  Daily({this.id, this.totalAmount, this.cash, this.kpay, this.count});
  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
      id: json["_id"],
      totalAmount: json['totalAmount'],
      cash: json['cash'],
      kpay: json['kpay'],
      count: json['count']);
  Map<String, dynamic> toJson() => {"totalAmount": totalAmount};
}
