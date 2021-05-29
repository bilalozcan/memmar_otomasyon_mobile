import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:memmar_otomasyon_mobile/model/product_model.dart';
import 'package:memmar_otomasyon_mobile/service/product_service.dart';

class ProductListViewModel extends ChangeNotifier{
  final ProductService? _productService = ProductService.instance;
  List<Product> productList = [];
  bool? wait;
  getproductList(BuildContext context) async{
     productList = [];
    var response = await _productService!.getProduct();
      for(var a in response){
        productList.add(a);
      }
     this.wait = false;
     notifyListeners();
  }
}