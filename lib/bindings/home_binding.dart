import 'package:get/get.dart';
import 'package:test_demo_01/controllers/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(HomeController());
  }
}