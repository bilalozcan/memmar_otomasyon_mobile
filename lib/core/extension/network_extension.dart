import 'package:memmar_otomasyon_mobile/core/constants/enums/network_service_enum.dart';

extension ServicePathExtension on ServicePath {
  String get rawValue {
    switch (this) {
      case ServicePath.USERLOGIN:
        return '/user/login';
      case ServicePath.USERCREATE:
        return '/user/create';
      case ServicePath.COMPANYCREATE:
        return '/company/create';
      case ServicePath.PRODUCTALL:
        return '/product/all';
      case ServicePath.PRODUCTCREATE:
        return '/product/create';
    }
  }
}
