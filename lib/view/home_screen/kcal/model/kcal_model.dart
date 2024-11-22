enum Gender { Male, Female }

enum ActivityLevel { Sedentary, Light, Moderate, Intense, VeryIntense }

enum Goal {
  MaintainWeight,
  RegularWeightLoss,
  RapidWeightLoss,
  RegularWeightGain
}

class KcalModel {
  final Gender gender;
  final ActivityLevel activityLevel;
  final Goal goal;

  KcalModel({
    required this.gender,
    required this.activityLevel,
    required this.goal,
  });
}
