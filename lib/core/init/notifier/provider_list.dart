import 'package:memmar_otomasyon_mobile/core/init/notifier/theme_notifier.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/admin_page_view_model.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/daily_salepage/daily_sales_graphc_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/daily_salepage/daily_sales_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/monthly_salepage/monthly_sales_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/monthly_supplypage/monthly_supply_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/personel_created_page/personel_created_view_model.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/personel_graphic_page/personel_graphic_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/personel_list_page/personel_list_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/product_type_sales_page/product_type_sales_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/supplier_created_page/supplier_created_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/supplier_list_page/supplier_list_graphic_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/supplier_list_page/supplier_list_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/supply_list_page/supply_graphic_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/supply_list_page/supply_list_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/home_bottom_view_model.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/home_page/home_page_view_model.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/home_page/product_list_page/product_list_view_model.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/receipt_create_page/receipt_create_view_model.dart';
import 'package:memmar_otomasyon_mobile/view/login_page/login_page_view_model.dart';
import 'package:memmar_otomasyon_mobile/view/product_page/product_view_page_model.dart';
import 'package:memmar_otomasyon_mobile/view/register_page/register_page_view_model.dart';
import 'package:memmar_otomasyon_mobile/view/settings_page/settings_page.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;

  static ApplicationProvider? get instance {
    _instance ??= ApplicationProvider._init();
    return _instance;
  }

  ApplicationProvider._init();

  List<SingleChildWidget> singleItems = [];
  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(create: (context) => ThemeNotifier()),
    ChangeNotifierProvider(create: (context) => HomeBottomViewModel()),
    ChangeNotifierProvider(create: (context) => HomePageViewModel()),
    ChangeNotifierProvider(create: (context) => ProductViewPageModel()),
    ChangeNotifierProvider(create: (context) => ReceiptCreateViewModel()),
    ChangeNotifierProvider(create: (context) => AdminPageViewModel()),
    ChangeNotifierProvider(create: (context) => DailySalesViewModel()),
    ChangeNotifierProvider(create: (context) => LoginPageViewModel()),
    ChangeNotifierProvider(create: (context) => ProductListViewModel()),
    ChangeNotifierProvider(create: (context) => PersonelCreatedViewModel()),
    ChangeNotifierProvider(create: (context) => PersonelListViewPage()),
    ChangeNotifierProvider(create: (context) => SupplierCreatedViewModel()),
    ChangeNotifierProvider(create: (context) => SupplierListViewModel()),
    ChangeNotifierProvider(create: (context) => SettingsViewModel()),
    ChangeNotifierProvider(create: (context) => RegisterPageViewModel()),
    ChangeNotifierProvider(create: (context) => SupplyListViewModel()),
    ChangeNotifierProvider(create: (context) => PersonelGraphicViewModel()),
    ChangeNotifierProvider(create: (context) => MonthlySalesViewModel()),
    ChangeNotifierProvider(create: (context) => MonthlySupplyViewModel()),
    ChangeNotifierProvider(create: (context) => ProductTypeSalesViewModel()),
    ChangeNotifierProvider(create: (context) => SupplyGraphicViewModel()),
    ChangeNotifierProvider(create: (context) => DailySalesGraphicViewModel()),
    ChangeNotifierProvider(create: (context) => SupplierListGraphicViewModel()),
  ];
}
