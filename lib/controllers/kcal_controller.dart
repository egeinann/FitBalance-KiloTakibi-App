import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/view/home_screen/kcal/model/kcal_model.dart';

class KcalController extends GetxController {
  Rx<Gender> gender = Gender.Male.obs;
  Rx<ActivityLevel> activityLevel = ActivityLevel.Sedentary.obs;
  Rx<Goal> goal = Goal.MaintainWeight.obs;

  Rx<double> dailyCalories = 2009.0.obs; // Rx<double> olarak tanımlandı

  // Kalori hesaplama fonksiyonu
  void calculateCalories() {
    double bmr;

    // BMR hesaplaması cinsiyete göre değişir
    if (gender.value == Gender.Male) {
      bmr = 10 * 70 + 6.25 * 175 - 5 * 25 + 5; // Erkek için örnek değerler
    } else {
      bmr = 10 * 60 + 6.25 * 165 - 5 * 25 - 161; // Kadın için örnek değerler
    }

    // Aktivite seviyesine göre kalori ihtiyacı
    switch (activityLevel.value) {
      case ActivityLevel.Sedentary:
        dailyCalories.value = bmr * 1.2;
        break;
      case ActivityLevel.Light:
        dailyCalories.value = bmr * 1.375;
        break;
      case ActivityLevel.Moderate:
        dailyCalories.value = bmr * 1.55;
        break;
      case ActivityLevel.Intense:
        dailyCalories.value = bmr * 1.725;
        break;
      case ActivityLevel.VeryIntense:
        dailyCalories.value = bmr * 1.9;
        break;
    }

    // Hedefe göre kalori düzenlemesi
    if (goal.value == Goal.RegularWeightLoss) {
      dailyCalories.value -= 500; // Kilo kaybı için 500 kcal azaltma
    } else if (goal.value == Goal.RapidWeightLoss) {
      dailyCalories.value -= 1000; // Hızlı kilo kaybı için 1000 kcal azaltma
    } else if (goal.value == Goal.RegularWeightGain) {
      dailyCalories.value += 500; // Kilo alımı için 500 kcal ekleme
    }

    // Kalori değeri 0'dan küçükse sıfırlama
    if (dailyCalories.value < 0) {
      dailyCalories.value = 0.0;
    }
  }

  // Gender güncelleme
  void updateGender(Gender newGender) {
    gender.value = newGender;
    calculateCalories(); // Gender değiştiğinde kalori hesaplamayı yeniden yap
  }

  // ActivityLevel güncelleme
  void updateActivityLevel(ActivityLevel newActivityLevel) {
    activityLevel.value = newActivityLevel;
    calculateCalories(); // ActivityLevel değiştiğinde kalori hesaplamayı yeniden yap
  }

  // Goal güncelleme
  void updateGoal(Goal newGoal) {
    goal.value = newGoal;
    calculateCalories(); // Goal değiştiğinde kalori hesaplamayı yeniden yap
  }

  // modeli kaydet
  KcalModel? kcalModel;
  void saveData() {
    // Modeli oluştur ve kaydet
    kcalModel = KcalModel(
      gender: gender.value,
      activityLevel: activityLevel.value,
      goal: goal.value,
    );

    print("Veriler kaydedildi: $kcalModel");
  }
}
