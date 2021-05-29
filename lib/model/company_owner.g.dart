// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyOwner _$CompanyOwnerFromJson(Map<String, dynamic> json) {
  return CompanyOwner(
    company: json['company'] == null
        ? null
        : Company.fromJson(json['company'] as Map<String, dynamic>),
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CompanyOwnerToJson(CompanyOwner instance) =>
    <String, dynamic>{
      'company': instance.company,
      'user': instance.user,
    };
