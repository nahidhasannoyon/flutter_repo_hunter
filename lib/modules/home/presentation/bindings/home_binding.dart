import 'package:get/get.dart';
import '../../../../core/helpers/network_helper.dart';
import '../../../../core/services/networking/api_service.dart';
import '../../../../data/repositories/repository_repository.dart';
import '../../data/repositories/home_repository.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiService>(() => ApiService());
    Get.lazyPut<NetworkHelper>(() => NetworkHelper());
    Get.lazyPut<RepositoryRepository>(() => RepositoryRepository(Get.find()));
    Get.lazyPut<HomeRepository>(() => HomeRepository(Get.find()));
    Get.lazyPut<HomeController>(() => HomeController(Get.find(), Get.find()));
  }
}
