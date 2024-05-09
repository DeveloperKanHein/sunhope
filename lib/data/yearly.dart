class Yearly {
  YearlyID? yearlyID;
  int? totalAmount;
  int? count;
  Yearly({this.yearlyID, this.totalAmount, this.count});
  factory Yearly.fromJson(Map<String, dynamic> json) => Yearly(
      yearlyID: YearlyID.fromJson(json["_id"]),
      totalAmount: json['totalAmount'],
      count: json['count']);
  Map<String, dynamic> toJson() => {"totalAmount": totalAmount};
}

class YearlyID {
  int? year;

  YearlyID({this.year});
  factory YearlyID.fromJson(Map<String, dynamic> json) => YearlyID(
        year: json['year'],
      );
  Map<String, dynamic> toJson() => {"year": year};
}
