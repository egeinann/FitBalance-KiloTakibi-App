import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/models/user_model/user_model.dart';

class UserController extends GetxController {
  var user = UserModel(userName: '', targetWeight: 70.0).obs;

  // Kullanıcı adı ve hedef kilo güncelleme fonksiyonları
  void setUserName(String name) {
    user.value = user.value.copyWith(userName: name);
  }

  void setTargetWeight(double weight) {
    user.value = user.value.copyWith(targetWeight: weight);
  }

  void setAvatar(String? avatar) {
    user.value = user.value.copyWith(userAvatar: avatar);
  }
}
