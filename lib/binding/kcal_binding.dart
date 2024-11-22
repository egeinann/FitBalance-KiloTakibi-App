import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/controllers/kcal_controller.dart';

class KcalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KcalController>(() => KcalController());
  }
}
