import '../api_repository/api_repo_singleton.dart';
import '../constants/const_api_routes.dart';

import '../core/storage/app_storage.dart';
import 'shared_preferences_singleton.dart';
import 'dio_config.dart';

Future<void> appConfig() async {
  await SharedPreferencesSingleton.init();
  String basedURL = ConstApiRoutes.basedURL;
  final DioConfig dioConfig =
      DioConfig(baseUrl: basedURL, token: AppStorage.getToken ?? "");
  ApiRepoSingleton.dio = dioConfig.init();
  ApiRepoSingleton.updateDio();
}
