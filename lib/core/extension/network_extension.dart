import 'package:memmar_otomasyon_mobile/core/constants/enums/network_service_enum.dart';

extension ServicePathExtension on ServicePath {
  String get rawValue {
    switch (this) {
      case ServicePath.USERLOGIN:
        return '/user/login';
      case ServicePath.USERCREATE:
        return '/user/create';
      case ServicePath.USERLIST:
        return '/user/list';
      case ServicePath.COMPANYCREATE:
        return '/company/create';
      case ServicePath.COMPANYUPDATE:
        return '/company/update';
      case ServicePath.COMPANYGET:
        return '/company/list';
      case ServicePath.PRODUCTALL:
        return '/product/all';
      case ServicePath.PRODUCTCREATE:
        return '/product/create';
      case ServicePath.PRODUCTSEARCH:
        return '/product/list';
      case ServicePath.PRODUCTUPDATE:
        return '/product/update';
      case ServicePath.RECEIPTCREATE:
        return '/receipt/create';
      case ServicePath.RECEIPTLIST:
        return '/receipt/list';
      case ServicePath.SUPPLIERCREATE:
        return '/supplier/create';
      case ServicePath.SUPPLIERLIST:
        return '/supplier/list';
    }
  }
}
