/*
[
 {
      "row": "5"
      "data": {
          "gold_grade": 0.999,
          "actual_gold_grade": 0.999
      },
    },
     {
      "row": "5"
      "data": {
          "gold_grade": 0.999,
          "actual_gold_grade": 0.999
      },
    }
    ]
 */

class GoldSplitReq {
  String? row;
  GoldInfo? data;
  GoldSplitReq({this.row, this.data});
  factory GoldSplitReq.fromJson(Map<String, dynamic> json) =>
      GoldSplitReq(row: json['row'], data: json['data']);
  Map<String, dynamic> toJson() => {"row": row, "data": data?.toJson()};
}

class GoldInfo {
  num? goldGrade;
  num? actualGoldGrade;
  GoldInfo({this.goldGrade, this.actualGoldGrade});
  factory GoldInfo.fromJson(Map<String, dynamic> json) => GoldInfo(
        goldGrade: json['gold_grade'],
        actualGoldGrade: json['actual_gold_grade'],
      );
  Map<String, dynamic> toJson() =>
      {"gold_grade": goldGrade, "actual_gold_grade": actualGoldGrade};
}

// final info = GoldInfo(goldGrade: 0.999, actualGoldGrade: 0.995);
// final goldReq = GoldSplitReq();
// goldReq.row = "5";
// goldReq.data = info;

