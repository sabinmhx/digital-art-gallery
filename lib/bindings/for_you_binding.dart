import 'package:art/controllers/for_you_controller.dart';
import 'package:get/get.dart';

/// The binding for the for you view.
class ForYouBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForYouController>(() => ForYouController());
  }
}
