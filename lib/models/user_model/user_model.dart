import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart'; // Bu satır eksikti
part 'user_model.g.dart'; // Eğer JSON serileştirme yapıyorsanız

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    String? userAvatar,
    required String userName,
    required double targetWeight,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
