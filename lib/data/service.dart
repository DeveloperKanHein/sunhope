import 'package:sunhope_computer_software/data/service_req.dart';

class Service {
  String? id;
  String? categoryId;
  String? name;
  String? nameCN;
  String? description;
  String? descriptionCN;
  int? price;
  int? discount;
  String? createdAt;
  Service(
      {this.id,
      this.categoryId,
      this.name,
      this.nameCN,
      this.description,
      this.descriptionCN,
      this.price,
      this.discount,
      this.createdAt});
  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json['_id'],
        categoryId: json['category'],
        name: json['name'],
        nameCN: json['nameCN'],
        description: json['description'],
        descriptionCN: json['descriptionCN'],
        price: json['price'],
        discount: json['discount'],
        createdAt: json['createdAt'],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryId": categoryId,
        "name": name,
        "nameCN": nameCN,
        "description": description,
        "descriptionCN": descriptionCN,
        "price": price,
        "discount": discount,
        "createdAt": createdAt
      };

  ServiceReq toReq() => ServiceReq(
      id: id, name: name, nameCN: nameCN, price: price, discount: discount);
}
