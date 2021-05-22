import 'package:memmar_otomasyon_mobile/core/init/notifier/theme_notifier.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/home_bottom_view_model.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/home_page/home_page_view_model.dart';
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
  ];
}
