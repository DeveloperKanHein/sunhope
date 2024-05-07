class Category {
  String? id;
  String? name;
  String? nameCN;
  Category({this.id, this.name, this.nameCN});
  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(id: json['_id'], name: json['name'], nameCN: json['nameCN']);
  Map<String, dynamic> toJson() => {"id": id, "name": name, "nameCN": nameCN};
}
