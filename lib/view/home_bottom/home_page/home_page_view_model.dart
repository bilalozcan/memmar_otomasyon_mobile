import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/home_page/product_list_page/product_list_page.dart';
import 'package:memmar_otomasyon_mobile/view/product_page/product_page.dart';
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
  var searchController = TextEditingController();
  changeSearchController(String string){
    searchController.text = string;
    notifyListeners();
  }
  bool contentView = true;
  contentViewChange(bool value){
    contentView = value;
    notifyListeners();
  }
List<HomePageContents> contents = [
  HomePageContents('Ürünler',Icons.production_quantity_limits,1,Colors.blueGrey,ProductListPage()),
  HomePageContents('Ürün Ekle',Icons.add,1,Colors.deepPurpleAccent,ProductPage()),
  HomePageContents('Ürün Düzenle',Icons.edit,1,Colors.red,Container()),
];
}