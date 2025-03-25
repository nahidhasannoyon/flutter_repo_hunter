import 'package:get/get.dart';

import '../helpers/network_helper.dart';
import '../services/networking/api_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiService>(() => ApiService());
    Get.lazyPut<NetworkHelper>(() => NetworkHelper());
  }
}
