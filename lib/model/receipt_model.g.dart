// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiptModel _$ReceiptModelFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const ['id']);
  return ReceiptModel(
    id: json['id'] as int?,
    createdUser: json['createdUser'] as int?,
    totalSales: json['totalSales'] as int?,
    totalAmount: (json['totalAmount'] as num?)?.toDouble(),
    paymentType: json['paymentType'] as int?,
    createdDate: json['createdDate'] == null
        ? null
        : DateTime.parse(json['createdDate'] as String),
    salesList: (json['salesList'] as List<dynamic>?)
        ?.map((e) => SalesModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    companyId: json['companyId'] as int?,
  );
}

Map<String, dynamic> _$ReceiptModelToJson(ReceiptModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['createdUser'] = instance.createdUser;
  val['totalSales'] = instance.totalSales;
  val['companyId'] = instance.companyId;
  val['totalAmount'] = instance.totalAmount;
  val['paymentType'] = instance.paymentType;
  val['createdDate'] = instance.createdDate?.toIso8601String();
  val['salesList'] = instance.salesList;
  return val;
}
