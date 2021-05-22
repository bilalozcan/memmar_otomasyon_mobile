import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/home_page/home_page.dart';

class HomeBottomViewModel extends ChangeNotifier {
  int  _index =0;

  int get index => _index;

  set index(int value) {
    _index = value;
  }
  changeIndex(int index){
    this._index = index;
    notifyListeners();
  }
  List<Widget> pages =[
    HomePage(),
    Container(color: Colors.red,),
    Container(color: Colors.green,),
  ];
  goToPage(){
    return pages[index];
  }
}