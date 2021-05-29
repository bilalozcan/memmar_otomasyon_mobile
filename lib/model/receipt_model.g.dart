// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiptModel _$ReceiptModelFromJson(Map<String, dynamic> json) {
  return ReceiptModel()
    ..id = json['id'] as int?
    ..userId = json['userId'] as int?
    ..paymentType = json['paymentType'] as int?
    ..createdDate = json['createdDate'] == null
        ? null
        : DateTime.parse(json['createdDate'] as String)
    ..salesList = (json['salesList'] as List<dynamic>?)
        ?.map((e) => SalesModel.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$ReceiptModelToJson(ReceiptModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'paymentType': instance.paymentType,
      'createdDate': instance.createdDate?.toIso8601String(),
      'salesList': instance.salesList,
    };
