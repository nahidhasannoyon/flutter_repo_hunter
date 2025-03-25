import 'package:flutter_repo_hunter/core/constants/app_imports.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiService>(() => ApiService());
    Get.lazyPut<NetworkHelper>(() => NetworkHelper());
  }
}
