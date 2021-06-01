// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const ['id']);
  return Product(
    id: json['id'] as int?,
    name: json['name'] as String?,
    purchasePrice: (json['purchasePrice'] as num?)?.toDouble(),
    stock: json['stock'] as int?,
    barcode: json['barcode'] as String?,
    countryCode: json['countryCode'] as String?,
    salePrice: (json['salePrice'] as num?)?.toDouble(),
    productType: json['productType'] as int?,
    isActive: json['isActive'] as bool?,
    createdUser: json['createdUser'] as int?,
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

Map<String, dynamic> _$ProductToJson(Product instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['name'] = instance.name;
  val['purchasePrice'] = instance.purchasePrice;
  val['stock'] = instance.stock;
  val['barcode'] = instance.barcode;
  val['countryCode'] = instance.countryCode;
  val['salePrice'] = instance.salePrice;
  val['productType'] = instance.productType;
  val['isActive'] = instance.isActive;
  val['createdUser'] = instance.createdUser;
  val['createdDate'] = instance.createdDate?.toIso8601String();
  val['supplierld'] = instance.supplierld;
  val['sold'] = instance.sold;
  val['updateDate'] = instance.updateDate?.toIso8601String();
  val['companyId'] = instance.companyId;
  return val;
}
