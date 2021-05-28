import 'package:flutter/cupertino.dart';
import 'package:memmar_otomasyon_mobile/service/auth_service.dart';

class LoginPageViewModel extends ChangeNotifier{
  var _email = TextEditingController();
  var _password = TextEditingController();

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

}