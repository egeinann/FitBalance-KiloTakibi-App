import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/info/controller/info_controller.dart';

class InfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InfoController());
  }
}