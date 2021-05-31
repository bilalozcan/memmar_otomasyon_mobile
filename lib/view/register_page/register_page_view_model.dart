
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:memmar_otomasyon_mobile/model/company_model.dart';
import 'package:memmar_otomasyon_mobile/model/user.dart';
import 'package:memmar_otomasyon_mobile/service/auth_service.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/home_bottom.dart';

class RegisterPageViewModel extends ChangeNotifier {
  final AuthService? _authService = AuthService.instance;
  var _email = TextEditingController();
  var _password = TextEditingController();
  var companyName = TextEditingController();
  var userName = TextEditingController();
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
clear(){
    _email.clear();
    _password.clear();
    companyName.clear();
    userName.clear();
}

  void createCompanyTEST(BuildContext context) async {
    Loader.show(context, progressIndicator: CircularProgressIndicator());
    var olusanCompanyOwner = await _authService!.createCompany(companyCreateMap: {
      "companyName": companyName.text,
      "createdDate": DateTime.now().toString(),
      "fullName": userName.text,
      "email": this._email.text,
      "password": this._password.text
    });
    Loader.hide();
    if(olusanCompanyOwner!=null){
      Fluttertoast.showToast(msg: 'Hesap Oluşturuldu');
      Navigator.pop(context);
    }
    else{
      Fluttertoast.showToast(msg: 'Hesap Oluşturulamadı');
    }

  }


}