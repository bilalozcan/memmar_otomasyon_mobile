import 'package:json_annotation/json_annotation.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_model.dart';
import 'package:memmar_otomasyon_mobile/model/company_model.dart';
import 'package:memmar_otomasyon_mobile/model/user.dart';

part 'company_owner.g.dart';

@JsonSerializable()
class CompanyOwner extends BaseModel {
  @override
  fromJson(Map<String, dynamic> json) => _$CompanyOwnerFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CompanyOwnerToJson(this);

  CompanyOwner({this.company, this.user});

  Company? company;
  User? user;
}
