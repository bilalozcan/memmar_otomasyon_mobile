
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:memmar_otomasyon_mobile/model/user.dart';
import 'package:memmar_otomasyon_mobile/service/auth_service.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/home_bottom.dart';

class LoginPageViewModel extends ChangeNotifier {
  final AuthService? _authService = AuthService.instance;
  var _email = TextEditingController();
  var _password = TextEditingController();
  User? user = User();
  get email => _email;

  set email(value) {
    _email = value;
    notifyListeners();
  }

  get password => _password;

  set password(value) {
    _password = value;
    notifyListeners();
  }

  void createUserTEST() async {
    User exampleUser = User.fromJson({
      'fullName': 'Mobil Test User',
      'email': 'mobiltest@gmail.com',
      'password': 'deneme123',
      'userType': 0,
      'createdDate': '2021-05-29T03:28:00',
      'companyId': 1
    });
    var olusanKullanici = await _authService!.createUser(user: exampleUser);
    print('Debug');
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


    user = girisYapanKullanici;
    return girisYapanKullanici;

  }
}