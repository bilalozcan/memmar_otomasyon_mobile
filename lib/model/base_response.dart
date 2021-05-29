import 'package:json_annotation/json_annotation.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_model.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse extends BaseModel {
  @override
  fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);

  BaseResponse({this.data, this.success});

  Object? data;
  bool? success;
}
