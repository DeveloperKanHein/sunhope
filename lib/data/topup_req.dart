class TopupReq {
  String? customer;
  int? cash;
  int? kpay;
  int? amount;
  TopupReq({this.customer, this.cash, this.kpay, this.amount});
  factory TopupReq.fromJson(Map<String, dynamic> json) => TopupReq(
        customer: json['customer'],
        cash: json['cash'],
        kpay: json['kpay'],
        amount: json['amount'],
      );
  Map<String, dynamic> toJson() => {
        "customer": customer,
        "cash": cash,
        "kpay": kpay,
        "amount": cash! + kpay!
      };
}
