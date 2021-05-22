import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomePageContents {
  String? text;
  IconData? icon;
  int? permission;
  Color? colors;

  HomePageContents(this.text, this.icon, this.permission, this.colors);
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
  HomePageContents('Ürün Bul',Icons.ac_unit,1,Colors.green),
  HomePageContents('Ürün Bilgisi Düzenle',Icons.ac_unit,1,Colors.red),
  HomePageContents('Satışları Görüntüle',Icons.ac_unit,1,Colors.amber),
  HomePageContents('Çalışanları Görüntüle',Icons.ac_unit,0,Colors.deepPurpleAccent),
];
}