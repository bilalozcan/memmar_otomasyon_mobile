import 'package:json_annotation/json_annotation.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_model.dart';

part 'supply_model.g.dart';

@JsonSerializable()
class SupplyModel extends BaseModel{
  int? id;
  int? productId;
  int? supplierId;
  int? quantity;
  int? companyId;
  double? purchasePrice;
  DateTime? createdDate;

  @override
  fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return _$SupplyModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    return _$SupplyModelToJson(this);
  }


}