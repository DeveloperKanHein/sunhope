class Promotion {
  String? id;
  String? name;
  int? basedAmount;
  int? percent;
  String? startDate;
  String? endDate;
  String? createdAt;
  Promotion(
      {this.id,
      this.name,
      this.basedAmount,
      this.percent,
      this.startDate,
      this.endDate,
      this.createdAt});
  factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
        id: json['_id'],
        name: json['name'],
        basedAmount: json['basedAmount'],
        percent: json['percent'],
        startDate: json['startDate'],
        endDate: json['endDate'],
        createdAt: json['createdAt'],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "basedAmount": basedAmount,
        "percent": percent,
        "startDate": startDate,
        "endDate": endDate
      };
}
