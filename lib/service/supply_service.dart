import 'package:memmar_otomasyon_mobile/core/constants/enums/network_service_enum.dart';
import 'package:memmar_otomasyon_mobile/core/init/network/network_manager.dart';
import 'package:memmar_otomasyon_mobile/model/supplier_model.dart';
import 'package:memmar_otomasyon_mobile/core/extension/network_extension.dart';
import 'package:memmar_otomasyon_mobile/model/supply_model.dart';

class SupplyService {
  static SupplyService? _instance;

  static SupplyService? get instance {
    _instance ??= SupplyService._init();
    return _instance;
  }

  SupplyService._init();

  final NetworkManager? _networkManager = NetworkManager.instance;

  Future getSupplyList({required int? companyId}) async => await _networkManager!
      .dioGet(path: ServicePath.SUPPLYLIST.rawValue, model: SupplyModel(),queryParameters: {
    "companyId":companyId,
  },isList: true );
}