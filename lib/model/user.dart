import 'package:json_annotation/json_annotation.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_model.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends BaseModel{
  User({
  this.id,
  this.fullName,
  this.email,
  this.password,
  this.userType,
  this.createdDate,
  this.companyId,
  });

  int? id;
  String? fullName;
  String? email;
  String? password;
  int? userType;
  DateTime? createdDate;
  int? companyId;


  @override
  fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() =>_$UserToJson(this);
}
