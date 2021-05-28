// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int?,
    fullName: json['fullName'] as String?,
    email: json['email'] as String?,
    password: json['password'] as String?,
    userType: json['userType'] as int?,
    createdDate: json['createdDate'] == null
        ? null
        : DateTime.parse(json['createdDate'] as String),
    companyId: json['companyId'] as int?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'password': instance.password,
      'userType': instance.userType,
      'createdDate': instance.createdDate?.toIso8601String(),
      'companyId': instance.companyId,
    };
