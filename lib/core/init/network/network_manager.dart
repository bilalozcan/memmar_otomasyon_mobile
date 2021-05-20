import 'package:dio/dio.dart';
import 'package:memmar_otomasyon_mobile/core/constants/app/app_constans.dart';

class NetworkManager {
  static NetworkManager? _instance;

  static NetworkManager? get instance {
    if (_instance != null) return _instance;
    _instance = NetworkManager.init();
    return _instance;
  }

  late final Dio dio;

  NetworkManager.init() {
    dio = Dio(BaseOptions(
      baseUrl: ApplicationConstants.BASE_URL,
      headers: {},
      contentType: 'application/json',
    ));
  }
}
