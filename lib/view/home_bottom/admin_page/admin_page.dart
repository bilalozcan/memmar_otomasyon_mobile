import 'package:flutter/material.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_state.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/admin_page_view_model.dart';
import 'package:provider/provider.dart';
class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends BaseState<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: context.watch<AdminPageViewModel>().contents.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              splashColor: Colors.grey,
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => context.watch<AdminPageViewModel>().contents[index].page),
                );
              },
              child: Card(
                color:
                context.watch<AdminPageViewModel>().contents[index].colors,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: dynamicHeight(0.08),
                      height: dynamicHeight(0.08),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.11),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Icon(
                        context.watch<AdminPageViewModel>().contents[index].icon,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Text(
                        '${context.watch<AdminPageViewModel>().contents[index].text}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: dynamicHeight(0.02),
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
