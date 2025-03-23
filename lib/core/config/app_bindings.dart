import 'package:get/get.dart';

import '../services/networking/api_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: Implement app_binding.dart
    Get.lazyPut(() => ApiService());
  }
}
