import 'package:json_annotation/json_annotation.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_model.dart';

part 'product_model.g.dart';

@JsonSerializable()

class Product extends BaseModel{
  Product({
    this.id,
    this.name,
    this.purchasePrice,
    this.stock,
    this.barcode,
    this.countryCode,
    this.salePrice,
    this.productType,
    this.isActive,
    this.createdUser,
    this.createdDate,
    this.supplierId,
    this.sold,
    this.updateDate,
    this.companyId,
  });
@JsonKey(disallowNullValue: true)
  int? id;
  String? name;
  double? purchasePrice;
  int? stock;
  String? barcode;
  String? countryCode;
  double? salePrice;
  int? productType;
  bool? isActive;
  int? createdUser;
  DateTime? createdDate;
  int? supplierId;
  int? sold;
  DateTime? updateDate;
  int? companyId;

  @override
  fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return _$ProductFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
   return _$ProductToJson(this);
  }
}
