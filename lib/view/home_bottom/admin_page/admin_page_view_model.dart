import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/daily_salepage/daily_sales_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/monthly_salepage/monthly_sales_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/personel_created_page/personel_created_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/personel_graphic_page/personel_graphic%C4%B0_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/personel_list_page/personel_list_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/supplier_created_page/supplier_created_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/supplier_list_page/supplier_list_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/supply_list_page/supply_list_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/home_page/home_page_view_model.dart';

class AdminPageViewModel extends ChangeNotifier {
  List<HomePageContents> contents = [
    HomePageContents('Çalışanları görüntüle',Icons.person,1,Colors.blueGrey,PersonelListPage()),
    HomePageContents('Çalışan ekle',Icons.person_add,1,Colors.blue,PersonelCreatedPage()),
    HomePageContents('Çalışan Raporları',Icons.bar_chart,0,Colors.blueAccent,PersonelGraphicPage()),

    HomePageContents('Günlük Satışları Görüntüle',Icons.table_rows,1,Colors.lightGreen,DailySalesPage()),
    HomePageContents('Aylık Satışları Görüntüle',Icons.table_chart,1,Colors.greenAccent,MonthlySalesPage()),
    HomePageContents('Yıllık Satışları Görüntüle',Icons.table_rows_rounded,1,Colors.green,Container()),

    HomePageContents('Tedarikçiler',Icons.person_pin_rounded,1,Colors.yellow,SupplierListPage()),
    HomePageContents('Tedarikçi Ekle',Icons.person_pin_sharp,1,Colors.yellowAccent.shade700,SupplierCreatedPage()),
    HomePageContents('Tedarik Listesi',Icons.insert_chart_sharp,1,Colors.yellow.shade900,SupplyListPage()),

    HomePageContents('Ürünler',Icons.production_quantity_limits,1,Colors.blueGrey,Container()),
    HomePageContents('Ürün Ekle',Icons.add,1,Colors.deepPurpleAccent,Container()),
    HomePageContents('Fişleri Görüntle',Icons.ac_unit,1,Colors.red,Container()),
  ];
}