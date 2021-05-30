import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:memmar_otomasyon_mobile/model/product_model.dart';
import 'package:memmar_otomasyon_mobile/service/product_service.dart';
import 'package:memmar_otomasyon_mobile/view/login_page/login_page_view_model.dart';
import 'package:provider/provider.dart';
class ProductListViewModel extends ChangeNotifier{
  var searchCont = TextEditingController(text: '');
  final ProductService? _productService = ProductService.instance;
  List<Product> productList = [];
  bool? _wait;

   bool get wait {
     return this._wait!;
   }

  set wait(bool value) {
    _wait = value;
    notifyListeners();
  }

  clear(){
    searchCont.clear();
  }
  getproductList(BuildContext context) async{
    if(_wait==true){
      var response = await _productService!.getProductSearch(companyId: context.read<LoginPageViewModel>().user!.companyId,filter: searchCont.text);
       productList.clear();
      for(var a in response){
        productList.add(a);
      }
      this.wait = false;

    }

  }
}