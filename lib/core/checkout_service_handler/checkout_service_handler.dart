import '../../data/service_req.dart';
import '../../data/service.dart';

class CheckoutServiceHandler {
  // static List<Service> _serviceList = [];
  static List<ServiceReq> services = [];

  static List<Map<String, dynamic>> toJsonList() {
    List<Map<String, dynamic>> jsonList = [];
    for (ServiceReq service in services) {
      jsonList.add(service.toJson());
    }
    return jsonList;
  }

  static void addToCart(Service service) {
    services.add(service.toReq());
    // if (!_serviceList.contains(service)) {
    //   _serviceList.add(service);
    //   services.add(service.toReq());
    // }
  }

  static void duplicate(ServiceReq service) {
    services.add(service);
  }

  static void remove(Service service) {
    for (int i = 0; i < services.length; i++) {
      if (service.id == services[i].id) {
        services.removeAt(i);
      }
    }
    // if (_serviceList.contains(service)) {
    //   _serviceList.remove(service);
    //   for (int i = 0; i < services.length; i++) {
    //     if (service.id == services[i].id) {
    //       services.removeAt(i);
    //       break;
    //     }
    //   }
    // }
  }

  static bool checkExist(Service service) {
    // return _serviceList.contains(service);
    for (int i = 0; i < services.length; i++) {
      if (service.id == services[i].id) {
        return true;
      }
    }

    return false;
  }

  static void clear() {
    // _serviceList = [];
    services = [];
  }
}
