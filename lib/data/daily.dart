class Daily {
  String? id;
  int? totalAmount;
  int? count;
  Daily({this.id, this.totalAmount, this.count});
  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
      id: json["_id"], totalAmount: json['totalAmount'], count: json['count']);
  Map<String, dynamic> toJson() => {"totalAmount": totalAmount};
}
