import 'package:memmar_otomasyon_mobile/core/constants/enums/network_service_enum.dart';
import 'package:memmar_otomasyon_mobile/core/init/network/network_manager.dart';

class AuthService {
  static AuthService? _instance;

  static AuthService? get instance {
    _instance ??= AuthService._init();
    return _instance;
  }

  AuthService._init();

  final NetworkManager? _networkManager = NetworkManager.instance;
  Future? postAuth(dynamic data) async =>
      await _networkManager!.dioPost('auth/login',data);


}