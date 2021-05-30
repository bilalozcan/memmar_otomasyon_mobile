import 'package:memmar_otomasyon_mobile/core/constants/enums/network_service_enum.dart';
import 'package:memmar_otomasyon_mobile/core/init/network/network_manager.dart';
import 'package:memmar_otomasyon_mobile/model/supplier_model.dart';
import 'package:memmar_otomasyon_mobile/core/extension/network_extension.dart';

class SupplierService {
  static SupplierService? _instance;

  static SupplierService? get instance {
    _instance ??= SupplierService._init();
    return _instance;
  }

  SupplierService._init();

  final NetworkManager? _networkManager = NetworkManager.instance;
  Future createSupplier({required SupplierModel supplierModel}) async =>
      await _networkManager!.dioPostModel(path: ServicePath.SUPPLIERCREATE.rawValue, model: SupplierModel(), data: supplierModel);

  Future getSupplierList({required int? companyId}) async => await _networkManager!
      .dioGet(path: ServicePath.SUPPLIERLIST.rawValue, model: SupplierModel(),queryParameters: {
    "companyId":companyId,
  },isList: true );
}