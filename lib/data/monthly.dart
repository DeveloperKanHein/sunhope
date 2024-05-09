class Monthly {
  MonthlyID? monthlyID;
  int? totalAmount;
  int? count;
  Monthly({this.monthlyID, this.totalAmount, this.count});
  factory Monthly.fromJson(Map<String, dynamic> json) => Monthly(
      monthlyID: MonthlyID.fromJson(json["_id"]),
      totalAmount: json['totalAmount'],
      count: json['count']);
  Map<String, dynamic> toJson() => {"totalAmount": totalAmount};
}

class MonthlyID {
  int? year;
  int? month;
  MonthlyID({this.year, this.month});
  factory MonthlyID.fromJson(Map<String, dynamic> json) =>
      MonthlyID(year: json['year'], month: json['month']);
  Map<String, dynamic> toJson() => {"year": year, "month": month};
}
