

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:memmar_otomasyon_mobile/model/user.dart';
import 'package:memmar_otomasyon_mobile/service/auth_service.dart';
import 'package:memmar_otomasyon_mobile/view/login_page/login_page_view_model.dart';
import 'package:provider/provider.dart';

class PersonelCreatedViewModel extends ChangeNotifier{
  final AuthService? _authService = AuthService.instance;
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  int? userType = 1;

  clear (){
    this.name.clear();
    this.email.clear();
    password.clear();
  }
  void createUser(BuildContext context) async {
    Loader.show(context,progressIndicator:CircularProgressIndicator());
    User exampleUser = User.fromJson({
      'fullName': this.name.text,
      'email': this.email.text,
      'password':this.password.text,
      'userType': this.userType,
      'createdDate': DateTime.now().toString(),
      'companyId':context.read<LoginPageViewModel>().user!.id,
    });
    var olusanKullanici = await _authService!.createUser(user: exampleUser);
    Loader.hide();
    if(olusanKullanici==null){
      Fluttertoast.showToast(msg: 'Kullanıcı oluşturulamadı');
    }
    else{
      Fluttertoast.showToast(msg: 'Kullanıcı oluşturuldu');
      Navigator.pop(context);
    }



  }

}