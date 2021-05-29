// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesModel _$SalesModelFromJson(Map<String, dynamic> json) {
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

Map<String, dynamic> _$SalesModelToJson(SalesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'userId': instance.userId,
      'createdDate': instance.createdDate?.toIso8601String(),
      'receiptId': instance.receiptId,
      'quantity': instance.quantity,
    };
