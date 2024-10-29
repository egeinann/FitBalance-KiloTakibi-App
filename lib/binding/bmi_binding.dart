import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/bmi/controller/bmi_controller.dart';

class BmiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BMIController());
  }
}
