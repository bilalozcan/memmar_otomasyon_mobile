import 'package:memmar_otomasyon_mobile/core/constants/enums/network_service_enum.dart';
import 'package:memmar_otomasyon_mobile/core/init/network/network_manager.dart';
import 'package:memmar_otomasyon_mobile/model/receipt_model.dart';
import 'package:memmar_otomasyon_mobile/core/extension/network_extension.dart';
class ReceiptService {
  static ReceiptService? _instance;

  static ReceiptService? get instance {
    _instance ??= ReceiptService._init();
    return _instance;
  }

  ReceiptService._init();

  final NetworkManager? _networkManager = NetworkManager.instance;
  Future createReceipt({required ReceiptModel receiptModel}) async =>
      await _networkManager!.dioPostModel(path: ServicePath.RECEIPTCREATE.rawValue, model: ReceiptModel(), data: receiptModel);

  Future getReceipt({Map<String, dynamic>? parameter}) async => await _networkManager!
      .dioGet(path: ServicePath.RECEIPTLIST.rawValue, model: ReceiptModel(),queryParameters: parameter,isList: true );
}