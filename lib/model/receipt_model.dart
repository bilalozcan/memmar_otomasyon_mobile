import 'package:json_annotation/json_annotation.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_model.dart';
import 'package:memmar_otomasyon_mobile/model/sales_model.dart';

part 'receipt_model.g.dart';

@JsonSerializable()
class ReceiptModel extends BaseModel{
  @JsonKey(disallowNullValue: true)
  int? id;
  int? createdUser;
  int? totalSales;
  int? companyId;
  double? totalAmount;
  int? paymentType;
  DateTime? createdDate;
  List<SalesModel> ?salesList;


  @override
  fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return _$ReceiptModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    return _$ReceiptModelToJson(this);
  }

  ReceiptModel({this.id, this.createdUser, this.totalSales, this.totalAmount,
      this.paymentType, this.createdDate, this.salesList,this.companyId});
}