import 'package:get/get.dart';

class Languages extends Translations {
  static const String home = "Home";
  static const String checkout = "Checkout";
  static const String services = "Services";
  static const String category = "Category";
  static const String customers = "Customers";
  static const String employee = "Employee";
  static const String report = "Report";
  static const String yearly = "Yearly";
  static const String monthly = "Monthly";
  static const String daily = "Daily";
  static const String setting = "Setting";
  static const String shop = "Shop Management";
  static const String language = "Language";
  static const String logout = "Logout";
  static const String todayCheckout = "Today Checkout";
  static const String select = "Select";
  static const String service = "Service";
  static const String price = "Price";
  static const String discount = "Discount";
  static const String quantity = "Quantity";
  static const String foc = "FOC";
  static const String action = "Action";
  static const String name = "Name";
  static const String nameWithCN = "Name (Chinese)";
  static const String edit = "Edit";
  static const String detail = "Detail";

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          home: home,
          checkout: checkout,
          services: services,
          category: category,
          customers: customers,
          employee: employee,
          report: report,
          yearly: yearly,
          monthly: monthly,
          daily: daily,
          setting: setting,
          shop: shop,
          language: language,
          logout: logout,
          todayCheckout: todayCheckout,
          select: select,
          service: service,
          price: price,
          discount: discount,
          quantity: quantity,
          foc: foc,
          action: action,
          name: name,
          nameWithCN: nameWithCN,
          edit: edit,
          detail: detail,
        },
        'cn_CHN': {
          home: "家",
          checkout: "結帳",
          services: "服務",
          category: "類別",
          customers: "客戶",
          employee: "僱員",
          report: "報告",
          yearly: "每年",
          monthly: "每月",
          daily: "每日",
          setting: "設置",
          shop: "商店",
          language: "語言",
          logout: "註銷",
          todayCheckout: "今天結帳",
          select: "選擇",
          service: "服務",
          price: "價格",
          discount: "折扣",
          quantity: "數量",
          foc: "焦點",
          action: "行動",
          name: "姓名",
          nameWithCN: "姓名（中文）",
          edit: "編輯",
          detail: "細節",
        },
        // Add more languages here
      };
}
