import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/daily_salepage/daily_sales_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/monthly_salepage/monthly_sales_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/monthly_supplypage/monthly_supply_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/personel_created_page/personel_created_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/personel_graphic_page/personel_graphic_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/personel_list_page/personel_list_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/product_type_sales_page/product_type_sales_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/supplier_created_page/supplier_created_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/supplier_list_page/supplier_list_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/supply_list_page/supply_list_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/home_page/home_page_view_model.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/home_page/product_list_page/product_list_page.dart';
import 'package:memmar_otomasyon_mobile/view/product_page/product_page.dart';

class AdminPageViewModel extends ChangeNotifier {
  List<HomePageContents> contents = [
    HomePageContents('Çalışanları görüntüle',Icons.person,1,Colors.blueGrey,PersonelListPage()),
    HomePageContents('Çalışan ekle',Icons.person_add,1,Colors.blue,PersonelCreatedPage()),
    HomePageContents('Çalışan Raporları',Icons.bar_chart,0,Colors.blueAccent,PersonelGraphicPage()),

    HomePageContents('Günlük Satışları Görüntüle',Icons.table_rows,1,Colors.lightGreen,DailySalesPage()),
    HomePageContents('Aylık Satış Grafiği',Icons.table_chart,1,Colors.greenAccent,MonthlySalesPage()),
    HomePageContents('Aylık Alış Grafiği',Icons.table_rows_rounded,1,Colors.green,MonthlySupplyPage()),

    HomePageContents('Tedarikçiler',Icons.person_pin_rounded,1,Colors.yellow,SupplierListPage()),
    HomePageContents('Tedarikçi Ekle',Icons.person_pin_sharp,1,Colors.yellowAccent.shade700,SupplierCreatedPage()),
    HomePageContents('Tedarik Listesi',Icons.insert_chart_sharp,1,Colors.yellow.shade900,SupplyListPage()),

    HomePageContents('Ürünler',Icons.production_quantity_limits,1,Colors.blueGrey,ProductListPage()),
    HomePageContents('Ürün Ekle',Icons.add,1,Colors.deepPurpleAccent,ProductPage()),
    HomePageContents('Ürün Tipi Satış Grafiği',Icons.ac_unit,1,Colors.red,ProductTypeSalesPage()),
  ];
}