import 'dart:io';
import 'package:dio/dio.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_model.dart';
import 'package:memmar_otomasyon_mobile/core/constants/app/app_constans.dart';
import 'package:memmar_otomasyon_mobile/model/base_response.dart';

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

  /// Sabit bir reponse için POST methodu
  /// path: URL'in sonuna eklenecek endpoint kısmını belirtir
  /// model: POST işlemi sonucunda gelen yanıtın hangi model sınıfına dönüşeceğini belirtir
  /// data: POST işleminde gönderilecek dataları içeren MAP'i ifade eder
  /// isList: GET işlemi sonucunda liste mi yoksa tek bir veri mi geleceğini alan ifade eder
  Future dioPostModel<T extends BaseModel>(
      {required String path, required T model, required T data, bool isList = false}) async {
    final response = await dio.post(path, data: data.toJson());
    if (response.statusCode == HttpStatus.ok) {
      return _baseResponseConverter(response.data, model, isList);
    } else {
      print('dioPost Error Status Code: ${response.statusCode}');
      return null;
    }
  }

  /// Sabit bir reponse için GET methodu
  /// path: URL'in sonuna eklenecek endpoint kısmını belirtir
  /// model: GET işlemi sonucunda gelen yanıtın hangi model sınıfına dönüşeceğini belirtir
  /// queryParameters: GET işleminde gönderilecek sorgu parametre değerlerini içeren MAP'i ifade eder
  /// isList: GET işlemi sonucunda liste mi yoksa tek bir veri mi geleceğini alan ifade eder
  Future dioGet<T extends BaseModel>(
      {required String path, required T model, Map<String, dynamic>? queryParameters, bool isList = false}) async {
    final response = await dio.get(path, queryParameters: queryParameters);
    if (response.statusCode == HttpStatus.ok) {
      return _baseResponseConverter(response.data, model, isList);
    } else {
      print('Dio Get Error Status Code: ${response.statusCode}');
    }
  }

  Future dioPostMap<T extends BaseModel>(
      {required String path, required T model, required Map data, bool isList = false}) async {
    final response = await dio.post(path, data: data);
    if (response.statusCode == HttpStatus.ok) {
      return _baseResponseConverter(response.data, model, isList);
    } else {
      print('dioPostLogin Error Status Code: ${response.statusCode}');
      return null;
    }
  }

  /// BaseResponse için tip çevirmesini gerçekleştiren yardımcı method
  dynamic _baseResponseConverter<T extends BaseModel>(dynamic data, T model, bool isList) {
    final baseResponse = BaseResponse().fromJson(data);
    if (baseResponse.success!) {
      if (isList) {
        if (baseResponse.data != null) {
          var list = [];
          (baseResponse.data as List).map((value) => list.add(model.fromJson(value))).toList();
          return list;
        } else {
          return null;
        }
      } else {
        return baseResponse.data != null ? model.fromJson((baseResponse.data! as Map<String, dynamic>)) : null;
      }
    }
  }
}
