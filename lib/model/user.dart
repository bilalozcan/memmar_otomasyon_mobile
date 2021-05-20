import 'package:json_annotation/json_annotation.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_model.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends BaseModel{
  User({
    this.id,
    this.name,
    this.yas,
  });

  int? id;
  String? name;
  int? yas;

  @override
  fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() =>_$UserToJson(this);
}
