import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/controllers/bmi_controller.dart';

class BmiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BMIController());
  }
}
