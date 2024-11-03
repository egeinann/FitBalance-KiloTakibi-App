import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controller>(() => Controller());
  }
}
