// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const ['id']);
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

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['fullName'] = instance.fullName;
  val['email'] = instance.email;
  val['password'] = instance.password;
  val['userType'] = instance.userType;
  val['createdDate'] = instance.createdDate?.toIso8601String();
  val['companyId'] = instance.companyId;
  return val;
}
