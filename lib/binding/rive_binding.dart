import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/controllers/rive_controller.dart';

class RiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RiveController());
  }
}
