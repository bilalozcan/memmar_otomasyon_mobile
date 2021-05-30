// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesModel _$SalesModelFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const ['id', 'receiptId']);
  return SalesModel(
    id: json['id'] as int?,
    productId: json['productId'] as int?,
    userId: json['userId'] as int?,
    createdDate: json['createdDate'] == null
        ? null
        : DateTime.parse(json['createdDate'] as String),
    receiptId: json['receiptId'] as int?,
    quantity: json['quantity'] as int?,
  );
}

Map<String, dynamic> _$SalesModelToJson(SalesModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['productId'] = instance.productId;
  val['userId'] = instance.userId;
  val['createdDate'] = instance.createdDate?.toIso8601String();
  writeNotNull('receiptId', instance.receiptId);
  val['quantity'] = instance.quantity;
  return val;
}
