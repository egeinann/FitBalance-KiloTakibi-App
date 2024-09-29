import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/bmi/model/bmi_model.dart';

class BMIController extends GetxController {
  // BMIModel nesnesini reaktif olarak tutan değişken
  var bmiModel = BMIModel(height: 170, weight: 40, bmi: 0).obs;

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
    double heightInMeters =
        bmiModel.value.height / 100; // Boyu metre cinsine çevir
    return bmiModel.value.weight /
        (heightInMeters * heightInMeters); // BMI formülü
  }
}
