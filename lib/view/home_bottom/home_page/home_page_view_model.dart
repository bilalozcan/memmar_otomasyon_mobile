import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memmar_otomasyon_mobile/model/product_model.dart';
import 'package:memmar_otomasyon_mobile/service/product_service.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/home_page/product_list_page/product_list_page.dart';
import 'package:memmar_otomasyon_mobile/view/login_page/login_page_view_model.dart';
import 'package:memmar_otomasyon_mobile/view/product_page/product_page.dart';
import 'package:provider/provider.dart';
class HomePageContents {
  String? text;
  IconData? icon;
  int? permission;
  Color? colors;
  Widget page;
  HomePageContents(this.text, this.icon, this.permission, this.colors,this.page);
}
class HomePageViewModel extends ChangeNotifier {
  int permission = 1;
  var searchController = TextEditingController(text: '');
  bool contentView = true;
  contentViewChange(bool value){
    contentView = value;
    notifyListeners();
  }
List<HomePageContents> contents = [
  HomePageContents('Ürünler',Icons.production_quantity_limits,1,Colors.blueGrey,ProductListPage()),
  HomePageContents('Ürün Ekle',Icons.add,1,Colors.deepPurpleAccent,ProductPage()),
  HomePageContents('Ürün Düzenle',Icons.edit,1,Colors.red,ProductListPage()),
];

  final ProductService? _productService = ProductService.instance;
  List<Product> productList = [];
  bool? _wait;

  bool get wait => _wait!;

  set wait(bool value) {
    _wait = value;
    notifyListeners();
  }

  clear(){
    searchController.clear();
  }
  getproductList(BuildContext context) async{
    if(this._wait==true){

      var response = await _productService!.getProductSearch(companyId: context.read<LoginPageViewModel>().user!.companyId,filter: searchController.text);
      productList.clear();
      for(var a in response){
        productList.add(a);
      }
      this.wait = false;
      notifyListeners();
    }

  }
}