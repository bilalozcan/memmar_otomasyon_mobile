// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] as int?,
    name: json['name'] as String?,
    purchasePrice: (json['purchasePrice'] as num?)?.toDouble(),
    stock: json['stock'] as int?,
    remaining: json['remaining'] as int?,
    barcode: json['barcode'] as String?,
    countryCode: json['countryCode'] as int?,
    salePrice: (json['salePrice'] as num?)?.toDouble(),
    productType: json['productType'] as int?,
    isActive: json['isActive'] as int?,
    createdUser: json['createdUser'] as String?,
    createdDate: json['createdDate'] == null
        ? null
        : DateTime.parse(json['createdDate'] as String),
    supplierld: json['supplierld'] as int?,
    sold: json['sold'] as int?,
    updateDate: json['updateDate'] == null
        ? null
        : DateTime.parse(json['updateDate'] as String),
    companyId: json['companyId'] as int?,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'purchasePrice': instance.purchasePrice,
      'stock': instance.stock,
      'remaining': instance.remaining,
      'barcode': instance.barcode,
      'countryCode': instance.countryCode,
      'salePrice': instance.salePrice,
      'productType': instance.productType,
      'isActive': instance.isActive,
      'createdUser': instance.createdUser,
      'createdDate': instance.createdDate?.toIso8601String(),
      'supplierld': instance.supplierld,
      'sold': instance.sold,
      'updateDate': instance.updateDate?.toIso8601String(),
      'companyId': instance.companyId,
    };
