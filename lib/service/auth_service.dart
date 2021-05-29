import 'package:memmar_otomasyon_mobile/core/constants/enums/network_service_enum.dart';
import 'package:memmar_otomasyon_mobile/core/extension/network_extension.dart';
import 'package:memmar_otomasyon_mobile/core/init/network/network_manager.dart';
import 'package:memmar_otomasyon_mobile/model/company_model.dart';
import 'package:memmar_otomasyon_mobile/model/company_owner.dart';
import 'package:memmar_otomasyon_mobile/model/user.dart';

class AuthService {
  static AuthService? _instance;

  static AuthService? get instance {
    _instance ??= AuthService._init();
    return _instance;
  }

  AuthService._init();

  final NetworkManager? _networkManager = NetworkManager.instance;

  Future createCompany({required Map companyCreateMap}) async => await _networkManager!
      .dioPostMap(path: ServicePath.COMPANYCREATE.rawValue, model: CompanyOwner(), data: companyCreateMap);

  Future createUser({required User user}) async =>
      await _networkManager!.dioPostModel(path: ServicePath.USERCREATE.rawValue, model: User(), data: user);

  Future loginUser<Map>({required String email, required String password}) async => await _networkManager!
      .dioPostMap(path: ServicePath.USERLOGIN.rawValue, model: User(), data: {'email': email, 'password': password});
}
