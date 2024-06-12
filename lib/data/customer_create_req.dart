class CustomerCreateReq {
  String? name;
  String? phone;
  int? balance;
  int? cash;
  int? kpay;
  CustomerCreateReq(
      {this.name, this.phone, this.balance, this.cash, this.kpay});
  factory CustomerCreateReq.fromJson(Map<String, dynamic> json) =>
      CustomerCreateReq(
        name: json['name'],
        phone: json['phone'],
        balance: json['balance'],
        cash: json['cash'],
        kpay: json['kpay'],
      );
  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'balance': cash! + kpay!,
        'kpay': kpay,
        'cash': cash,
      };
}
