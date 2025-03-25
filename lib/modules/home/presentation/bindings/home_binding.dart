import 'package:flutter_repo_hunter/core/constants/app_imports.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RepositoryRepository>(() => RepositoryRepository(Get.find()));
    Get.lazyPut<HomeRepository>(() => HomeRepository(Get.find()));
    Get.lazyPut<HomeController>(() => HomeController(Get.find(), Get.find()));
  }
}
