import 'package:get/get.dart';

import '../modules/home/presentation/bindings/home_binding.dart';
import '../modules/home/presentation/views/home_view.dart';

class HomeRoutes {
  HomeRoutes._();

  static const home = '/home';

  static final routes = [
    GetPage(name: home, page: () => const HomeView(), binding: HomeBinding()),
  ];
}
