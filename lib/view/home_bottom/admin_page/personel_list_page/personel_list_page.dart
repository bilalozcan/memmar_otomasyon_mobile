import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_state.dart';
import 'package:memmar_otomasyon_mobile/model/user.dart';
import 'package:memmar_otomasyon_mobile/service/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:memmar_otomasyon_mobile/view/login_page/login_page_view_model.dart';
class PersonelListPage extends StatefulWidget {
  @override
  _PersonelListPageState createState() => _PersonelListPageState();
}

class _PersonelListPageState extends BaseState<PersonelListPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,(){
      context.read<PersonelListViewPage>().wait = true;
        context.read<PersonelListViewPage>().getPersonelList(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Personel Listesi'
        ),
      ),
      body: context.watch<PersonelListViewPage>().wait==false?ListView.builder(
        itemCount:  context.read<PersonelListViewPage>().userList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                splashColor: Colors.grey,
                onTap: (){
                  /* Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductPage()),
                  );*/
                },
                child: Card(
                  color:Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: dynamicHeight(0.08),
                            height: dynamicHeight(0.08),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.11),
                                borderRadius: BorderRadius.all(Radius.circular(50))),
                            child: Icon(
                              Icons.person_pin,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.read<PersonelListViewPage>().userList[index].fullName.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: dynamicHeight(0.02),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              Text(
                                context.read<PersonelListViewPage>().userList[index].email.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: dynamicHeight(0.02),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          ),

                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                            },
                            child: Container(
                              height: dynamicHeight(0.07),
                              width: dynamicWidth(0.08),
                              color: Colors.green.withOpacity(0.1),
                              child: Icon(
                                Icons.edit,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: InkWell(
                              onTap: (){

                              },
                              child: Container(
                                height: dynamicHeight(0.07),
                                width: dynamicWidth(0.08),
                                color: Colors.red.withOpacity(0.1),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ):Center(child: Container())
    );
  }
}
class PersonelListViewPage extends ChangeNotifier {
  final AuthService? _authService = AuthService.instance;
  List<User> userList = [];
  bool? _wait=false;

  bool get wait {
    return this._wait!;
  }

  set wait(bool value) {
    _wait = value;
    notifyListeners();
  }
  getPersonelList(BuildContext context) async{
    if(_wait==true){
      Loader.show(context,progressIndicator:CircularProgressIndicator());
      var response = await _authService!.getUserList(companyId: context.read<LoginPageViewModel>().user!.companyId);
      userList.clear();
      for(var a in response){
        userList.add(a);
      }
      this.wait =false;
      Loader.hide();
    }

  }
}