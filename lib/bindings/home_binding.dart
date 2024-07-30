import 'package:art/controllers/home_controller.dart';
import 'package:get/get.dart';

/// The binding for the home view.
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
