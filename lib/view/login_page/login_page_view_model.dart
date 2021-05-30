
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:memmar_otomasyon_mobile/model/company_model.dart';
import 'package:memmar_otomasyon_mobile/model/user.dart';
import 'package:memmar_otomasyon_mobile/service/auth_service.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/home_bottom.dart';

class LoginPageViewModel extends ChangeNotifier {
  final AuthService? _authService = AuthService.instance;
  var _email = TextEditingController();
  var _password = TextEditingController();
  User? user = User();
  get email => _email;
  Company company = Company();
  companyUpdate(Company company){
    this.company =company;
    notifyListeners();
  }
  set email(value) {
    _email = value;
    notifyListeners();
  }

  get password => _password;

  set password(value) {
    _password = value;
    notifyListeners();
  }


  void createCompanyTEST() async {
    var olusanCompanyOwner = await _authService!.createCompany(companyCreateMap: {
      "companyName": "Mobil Test Company",
      "createdDate": DateTime.now().toString(),
      "fullName": "Mobile Test",
      "email": "mobile22@gmail.com",
      "password": "Bilal123"
    });
    print('Debug');
  }

   loginUserTEST(BuildContext context) async {
    Loader.show(context,progressIndicator:CircularProgressIndicator());
    var girisYapanKullanici = await _authService!.loginUser(email: _email.text, password: _password.text);
    if(girisYapanKullanici==null){
      Fluttertoast.showToast(
          msg: "Kullanıcı bulunamadı veya şifre yanlış",
        gravity: ToastGravity.SNACKBAR
      );
      Loader.hide();
    }
    else{
      user = girisYapanKullanici;
      var userCopmany = await _authService!.getCompanyList(companyId: user!.companyId);
      if(userCopmany!=null)this.company = userCopmany[0];
      else return;
      Fluttertoast.showToast(
          msg: "Giriş Başarılı",
          gravity: ToastGravity.SNACKBAR
      );
      Loader.hide();
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeBottom()),
        );
    }

    return girisYapanKullanici;

  }
}