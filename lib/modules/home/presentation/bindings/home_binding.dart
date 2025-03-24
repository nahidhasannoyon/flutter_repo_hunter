import 'package:flutter_repo_hunter/core/services/networking/api_service.dart';
import 'package:flutter_repo_hunter/modules/home/data/repositories/home_repository.dart';
import 'package:get/get.dart';
import '../controllers/github_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(HomeRepository(ApiService())),
    );
    Get.lazyPut<GitHubController>(() => GitHubController());
  }
}
