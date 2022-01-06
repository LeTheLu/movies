import 'package:get/get.dart';
import 'package:test_demo_01/bindings/home_binding.dart';
import 'package:test_demo_01/page/home_movie/home_page.dart';
import 'package:test_demo_01/routers/routes.dart';

class Pages{
  static final pages = [
    GetPage(
        name: Routes.HOMEPAGE,
        page: () => const HomePage(),
        binding: HomeBinding(),
    )
  ];
}