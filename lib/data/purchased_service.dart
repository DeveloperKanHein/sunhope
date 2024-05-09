class PurchasedService {
  String? id;
  String? name;
  String? nameCN;
  int? price;
  int? discount;
  int? quantity;
  bool? isFoc;
  PurchasedService(
      {this.id, this.name, this.nameCN, this.price, this.discount, this.isFoc});
  factory PurchasedService.fromJson(Map<String, dynamic> json) =>
      PurchasedService(
        id: json['_id'],
        name: json['name'],
        nameCN: json['nameCN'],
        price: json['price'],
        discount: json['discount'],
        isFoc: json['isFoc'],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "nameCN": nameCN,
        "price": price,
        "discount": discount,
        "isFoc": isFoc
      };
}
