import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/models/user_model/user_model.dart';

class UserController extends GetxController {
  var user = UserModel(userName: '', targetWeight: 70.0).obs;
  final List<String> avatarList = [
    "assets/images/profile/avatars/male_1.svg",
    "assets/images/profile/avatars/female_1.svg",
    "assets/images/profile/avatars/male_2.svg",
    "assets/images/profile/avatars/female_2.svg",
    "assets/images/profile/avatars/male_3.svg",
    "assets/images/profile/avatars/female_3.svg",
    "assets/images/profile/avatars/male_4.svg",
    "assets/images/profile/avatars/female_4.svg",
    "assets/images/profile/avatars/male_5.svg",
    "assets/images/profile/avatars/female_5.svg",
    "assets/images/profile/avatars/male_6.svg",
    "assets/images/profile/avatars/female_6.svg",
  ];
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
