import 'package:json_annotation/json_annotation.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_model.dart';

part 'supplier_model.g.dart';

@JsonSerializable()
class SupplierModel extends BaseModel{
  int? id;
  String? name;
  String? phone;

  @override
  fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
   return _$SupplierModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    return _$SupplierModelToJson(this);
  }

  SupplierModel({this.id, this.name, this.phone});
}