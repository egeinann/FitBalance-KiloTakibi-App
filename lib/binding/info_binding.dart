import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/controllers/info_controller.dart';

class InfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InfoController());
  }
}
