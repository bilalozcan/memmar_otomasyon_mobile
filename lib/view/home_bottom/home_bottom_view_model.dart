import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/admin_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/home_page/home_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/receipt_create_page/receipt_create_page.dart';

class HomeBottomViewModel extends ChangeNotifier {
  int  _index =0;

  int get index => _index;

  set index(int value) {
    _index = value;
  }
  clear(){
    index=0;

  }
  changeIndex(int index){
    this._index = index;
    notifyListeners();
  }
  List<Widget> pages =[
    HomePage(),
    ReceiptCreatePage(),
    AdminPage(),
  ];
  goToPage(){
    return pages[index];
  }
}