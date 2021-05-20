import 'package:flutter/material.dart';
import 'package:memmar_otomasyon_mobile/core/init/notifier/provider_list.dart';
import 'package:memmar_otomasyon_mobile/core/init/notifier/theme_notifier.dart';
import 'package:memmar_otomasyon_mobile/view/home_view.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await LocaleManager.preferencesInit();
  runApp(MultiProvider(providers: [...ApplicationProvider.instance!.dependItems], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memmarım',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeNotifier>(context).currentTheme,
      initialRoute: '/',
      routes: {},
      home: HomeView(),
    );
  }
}
