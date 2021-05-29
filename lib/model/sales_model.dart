import 'package:json_annotation/json_annotation.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_model.dart';

part 'sales_model.g.dart';

@JsonSerializable()
class SalesModel extends BaseModel{
  int? id;
  int? productId;
  int? userId;
  DateTime? createdDate;
  int? receiptId;
  int? quantity;



  @override
  fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return _$SalesModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    return _$SalesModelToJson(this);
  }
  factory SalesModel.fromJson(Map<String, dynamic> json) => _$SalesModelFromJson(json);
  SalesModel({this.id, this.productId, this.userId, this.createdDate,
      this.receiptId, this.quantity});
}