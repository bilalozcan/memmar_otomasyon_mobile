// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supply_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupplyModel _$SupplyModelFromJson(Map<String, dynamic> json) {
  return SupplyModel()
    ..id = json['id'] as int?
    ..productId = json['productId'] as int?
    ..supplierId = json['supplierId'] as int?
    ..quantity = json['quantity'] as int?
    ..companyId = json['companyId'] as int?
    ..purchasePrice = (json['purchasePrice'] as num?)?.toDouble()
    ..createdDate = json['createdDate'] == null
        ? null
        : DateTime.parse(json['createdDate'] as String);
}

Map<String, dynamic> _$SupplyModelToJson(SupplyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'supplierId': instance.supplierId,
      'quantity': instance.quantity,
      'companyId': instance.companyId,
      'purchasePrice': instance.purchasePrice,
      'createdDate': instance.createdDate?.toIso8601String(),
    };
