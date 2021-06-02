import 'package:memmar_otomasyon_mobile/core/constants/enums/network_service_enum.dart';
import 'package:memmar_otomasyon_mobile/core/init/network/network_manager.dart';
import 'package:memmar_otomasyon_mobile/model/user.dart';
import 'package:memmar_otomasyon_mobile/core/extension/network_extension.dart';

class StatisticService {
  static StatisticService? _instance;

  static StatisticService? get instance {
    _instance ??= StatisticService._init();
    return _instance;
  }

  StatisticService._init();

  final NetworkManager? _networkManager = NetworkManager.instance;




  Future getStatistic({required String path,required Map<String, dynamic>? queryParameters}) async => await _networkManager!
      .dioGetMap(path: ServicePath.STATISTIC.rawValue+path, queryParameters: queryParameters,isList: true );


}