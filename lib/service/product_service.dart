

import 'package:memmar_otomasyon_mobile/core/constants/enums/network_service_enum.dart';
import 'package:memmar_otomasyon_mobile/core/init/network/network_manager.dart';
import 'package:memmar_otomasyon_mobile/model/product_model.dart';
import 'package:memmar_otomasyon_mobile/core/extension/network_extension.dart';
import 'package:provider/provider.dart';
class ProductService {
  static ProductService? _instance;

  static ProductService? get instance {
    _instance ??= ProductService._init();
    return _instance;
  }

  ProductService._init();

  final NetworkManager? _networkManager = NetworkManager.instance;
  Future getProduct() async => await _networkManager!
      .dioGet(path: ServicePath.PRODUCTALL.rawValue, model: Product(),isList: true );
  Future getProductSearch({required String? filter,required int? companyId}) async => await _networkManager!
      .dioGet(path: ServicePath.PRODUCTSEARCH.rawValue, model: Product(),queryParameters: {
        "companyId":companyId,
    "searchValue":filter
  },isList: true );

  Future createProduct({required Map productCreateMap}) async => await _networkManager!
      .dioPostMap(path: ServicePath.PRODUCTCREATE.rawValue, model: Product(), data: productCreateMap);

  Future deleteProduct({required Map productCreateMap}) async => await _networkManager!
      .dioDeleteMap(path: ServicePath.PRODUCTDELETE.rawValue, model: Product(), data: productCreateMap);

  Future updateProduct({required Product product}) async => await _networkManager!
      .dioPutModel(path: ServicePath.PRODUCTUPDATE.rawValue, model: Product(), data: product);
}