class Customer {
  String? id;
  String? fingerPrintId;
  String? name;
  String? phone;
  int? balance;
  String? remark;
  int? no;
  Customer({
    this.id,
    this.fingerPrintId,
    this.name,
    this.phone,
    this.balance,
    this.remark,
    this.no,
  });
  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
      id: json['_id'],
      fingerPrintId: json['fingerPrintId'],
      name: json['name'],
      phone: json['phone'],
      balance: json['balance'],
      remark: json['remark'],
      no: json['no']);
  Map<String, dynamic> toJson() => {
        "id": id,
        "fingerPrintId": fingerPrintId,
        "name": name,
        "phone": phone,
        "balance": balance,
        "remark": remark
      };
}
