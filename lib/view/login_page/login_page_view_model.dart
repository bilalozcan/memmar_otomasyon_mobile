import 'package:flutter/cupertino.dart';
import 'package:memmar_otomasyon_mobile/model/user.dart';
import 'package:memmar_otomasyon_mobile/service/auth_service.dart';

class LoginPageViewModel extends ChangeNotifier {
  final AuthService? _authService = AuthService.instance;
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

  void loginUserTEST() async {
    print('AAa');
    var girisYapanKullanici = await _authService!.loginUser(email: 'mobile22@gmail.com', password: 'Bilal123');
    print('Debug');
  }
}