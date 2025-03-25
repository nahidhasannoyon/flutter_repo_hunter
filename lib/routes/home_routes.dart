import 'package:flutter_repo_hunter/core/constants/app_imports.dart';

class HomeRoutes {
  HomeRoutes._();

  static const home = '/home';

  static final routes = [
    GetPage(name: home, page: () => const HomeView(), binding: HomeBinding()),
  ];
}
