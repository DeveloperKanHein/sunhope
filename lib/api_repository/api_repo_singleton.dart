import 'package:dio/dio.dart';

import 'api_repositories.dart';

class ApiRepoSingleton {
  static ApiRepositories? _instance;
  static Dio? dio;
  static void updateDio() {
    if (_instance != null) {
      _instance = ApiRepositories(dio!);
    }
  }

  static ApiRepositories get instance {
    _instance ??= ApiRepositories(dio ?? Dio());
    return _instance!;
  }
}
