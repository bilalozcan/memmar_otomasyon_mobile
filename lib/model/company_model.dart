import 'package:json_annotation/json_annotation.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_model.dart';
part 'company_model.g.dart';
@JsonSerializable()
class Company extends BaseModel{

  Company({
    this.id,
    this.totalAmount,
    this.totalSupply,
    this.receiptList,
    this.createdAdd,
    this.income,
    this.userList,
    this.name,
  });

  int? id;
  double? totalAmount;
  double? totalSupply;
  String? receiptList;
  DateTime? createdAdd;
  int? income;
  String? userList;
  String? name;

  @override
  fromJson(Map<String, dynamic> json) {
    return _$CompanyFromJson(json);
  }
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}