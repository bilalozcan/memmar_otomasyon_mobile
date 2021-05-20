import 'package:memmar_otomasyon_mobile/core/constants/enums/network_service_enum.dart';

extension ServicePathExtension on ServicePath {
  String get rawValue {
    switch (this) {
      case ServicePath.USERLOGIN:
        return '/User/Login';
      case ServicePath.USERCREATE:
        return '/User/Create';
    }
  }
}
