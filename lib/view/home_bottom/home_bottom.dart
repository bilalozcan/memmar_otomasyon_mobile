import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_state.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/home_bottom_view_model.dart';
import 'package:provider/provider.dart';
class HomeBottom extends StatefulWidget {
  const HomeBottom({Key? key}) : super(key: key);

  @override
  _HomeBottomState createState() => _HomeBottomState();
}

class _HomeBottomState extends BaseState<HomeBottom> {

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mammar'),
      ),
      body: context.watch<HomeBottomViewModel>().goToPage(),
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(iconData: Icons.home, title: "Home"),
            TabData(iconData: Icons.search, title: "Search"),
            TabData(iconData: Icons.shopping_cart, title: "Basket")
          ],
          onTabChangedListener: (position) {
            context.read<HomeBottomViewModel>().changeIndex(position);
          },
        )
    );
  }
}
