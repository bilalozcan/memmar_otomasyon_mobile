

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_model.dart';
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

  Future dioPost<T extends BaseModel>(String path, dynamic data) async {

    final response = await dio.post(path, data: data);
    if (response.statusCode == HttpStatus.ok) {
      return response;
    } else {
      print('dioPost Error Status Code: ${response.statusCode}');
      return null;
    }
  }
}
