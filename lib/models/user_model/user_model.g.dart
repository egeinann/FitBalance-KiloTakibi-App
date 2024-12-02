// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      userAvatar: json['userAvatar'] as String?,
      userName: json['userName'] as String,
      targetWeight: (json['targetWeight'] as num).toDouble(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'userAvatar': instance.userAvatar,
      'userName': instance.userName,
      'targetWeight': instance.targetWeight,
    };
