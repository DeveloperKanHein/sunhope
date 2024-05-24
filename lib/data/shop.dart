class Shop {
  String? id;
  String? name;
  String? address;
  String? username;
  String? password;
  Shop({this.id, this.name, this.address, this.username, this.password});
  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        id: json['_id'],
        name: json['name'],
        address: json['address'],
        username: json['username'],
        password: json['password'],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "username": username,
        "password": password
      };
}
