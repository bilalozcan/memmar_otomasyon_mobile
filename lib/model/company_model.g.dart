// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return Company(
    id: json['id'] as int?,
    totalAmount: (json['totalAmount'] as num?)?.toDouble(),
    totalSupply: (json['totalSupply'] as num?)?.toDouble(),
    receiptList: json['receiptList'] as String?,
    createdAdd: json['createdAdd'] == null
        ? null
        : DateTime.parse(json['createdAdd'] as String),
    income: json['income'] as int?,
    userList: json['userList'] as String?,
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'id': instance.id,
      'totalAmount': instance.totalAmount,
      'totalSupply': instance.totalSupply,
      'receiptList': instance.receiptList,
      'createdAdd': instance.createdAdd?.toIso8601String(),
      'income': instance.income,
      'userList': instance.userList,
      'name': instance.name,
    };
