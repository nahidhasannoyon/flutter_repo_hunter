import 'package:get/get.dart';
import '../../../../data/repositories/repository_repository.dart';
import '../../data/repositories/home_repository.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RepositoryRepository>(() => RepositoryRepository(Get.find()));
    Get.lazyPut<HomeRepository>(() => HomeRepository(Get.find()));
    Get.lazyPut<HomeController>(() => HomeController(Get.find(), Get.find()));
  }
}
