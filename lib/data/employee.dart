class Employee {
  String? id;
  String? shopId;
  String? employeeID;
  String? name;
  String? nickname;
  String? phone;
  String? role;
  Employee(
      {this.id,
      this.shopId,
      this.employeeID,
      this.name,
      this.nickname,
      this.phone,
      this.role});
  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json['_id'],
        employeeID: json['employeeID'],
        name: json['name'],
        nickname: json['nickname'],
        phone: json['phone'],
        role: json['role'],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "shopId": shopId,
        "employeeID": employeeID,
        "name": name,
        "nickname": nickname,
        "phone": phone,
        "role": role
      };
}
