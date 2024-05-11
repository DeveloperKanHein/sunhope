class ServiceReq {
  String? id;
  String? name;
  String? nameCN;
  int? price;
  int? discount;
  String? employeeId;
  String? employeeName;
  int? quantity;
  bool? isFoc;
  String? createdAt;
  ServiceReq(
      {this.id,
      this.name,
      this.nameCN,
      this.price,
      this.discount,
      this.employeeId,
      this.employeeName,
      this.quantity = 1,
      this.isFoc = false,
      this.createdAt});
  factory ServiceReq.fromJson(Map<String, dynamic> json) => ServiceReq(
        id: json['_id'],
        name: json['name'],
        nameCN: json['nameCN'],
        price: json['price'],
        discount: json['discount'],
        employeeId: json['employeeId'],
        employeeName: json['employeeName'],
        quantity: json['quantity'],
        isFoc: json['isFoc'],
        createdAt: json['createdAt'],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "nameCN": nameCN,
        "price": price,
        "discount": discount,
        "employeeId": employeeId,
        "employeeName": employeeName,
        "quantity": quantity,
        "isFoc": isFoc,
        "createdAt": createdAt
      };
}
