import 'package:memmar_otomasyon_mobile/core/constants/enums/network_service_enum.dart';
import 'package:memmar_otomasyon_mobile/core/init/network/network_manager.dart';
import 'package:memmar_otomasyon_mobile/model/product_model.dart';
import 'package:memmar_otomasyon_mobile/core/extension/network_extension.dart';

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

  Future createProduct({required Map productCreateMap}) async => await _networkManager!
      .dioPostMap(path: ServicePath.PRODUCTCREATE.rawValue, model: Product(), data: productCreateMap);
}