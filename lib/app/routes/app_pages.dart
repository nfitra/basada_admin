import 'package:get/get.dart';

import '../modules/detail/bindings/detail_binding.dart';
import '../modules/detail/views/detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.login;

  static final routes = [
    GetPage(
      name: _Paths.routeHome,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.routeLogin,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.routeDetail,
      page: () => const DetailView(),
      binding: DetailBinding(),
    ),
  ];
}
