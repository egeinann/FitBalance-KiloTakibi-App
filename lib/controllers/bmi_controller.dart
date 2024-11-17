import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/controllers/settings_controller.dart';
import 'package:kilo_takibi_uyg/view/home_screen/bmi/model/bmi_model.dart';

class BMIController extends GetxController {
  // BMIModel nesnesini reaktif olarak tutan değişken
  var bmiModel = BMIModel(height: 170, weight: 40, bmi: 0).obs;

  // SettingsController'ı çağırarak ayarları al
  final SettingsController settingsController = Get.find<SettingsController>();

  // Boy değerini günceller
  void updateHeight(double newHeight) {
    if (newHeight > 0) {
      bmiModel.update((bmi) {
        bmi?.height = newHeight;
        bmi!.bmi = calculateBMI(); // Yeni BMI hesapla
      });
    }
  }

  // Kilo değerini günceller
  void updateWeight(double newWeight) {
    if (newWeight > 0) {
      bmiModel.update((bmi) {
        bmi?.weight = newWeight;
        bmi!.bmi = calculateBMI(); // Yeni BMI hesapla
      });
    }
  }

  // BMI hesaplama fonksiyonu
  double calculateBMI() {
    double weight = bmiModel.value.weight;
    double height = bmiModel.value.height;

    // Kullanıcı birim seçimine göre dönüşüm yap
    if (!settingsController.isKgSelected.value) {
      // Eğer lbs seçiliyse, kg'ye çevir
      weight = weight / 2.205;
    }

    if (!settingsController.isCmSelected.value) {
      // Eğer ft seçiliyse, cm'ye çevir
      height = height * 30.48;
    }

    // Boyu metre cinsine çevir
    double heightInMeters = height / 100;

    // BMI hesapla
    return weight / (heightInMeters * heightInMeters);
  }
}
