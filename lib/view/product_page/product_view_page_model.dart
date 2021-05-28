import 'package:flutter/cupertino.dart';

class ProductViewPageModel extends ChangeNotifier{
  int? productType=0;
  set productTypeChange(int value) {
    productType = value;
    notifyListeners();
  }
  int? supplierId;
  set supplierIdChange(int value) {
    supplierId = value;
    notifyListeners();
  }
  int? countryCode;
  set countryCodeChange(int value) {
    countryCode = value;
    notifyListeners();
  }

  var _purchasePrise = TextEditingController();
  get purchasePrise => _purchasePrise;
  set purchasePrise(value) {
    _purchasePrise = value;
    notifyListeners();
  }

  var _stock = TextEditingController();
  get stock => _stock;
  set stock(value) {
    _stock = value;
    notifyListeners();
  }


  var _nameCont = TextEditingController();
  get nameCont => _nameCont;

  set nameCont(value) {
    _nameCont = value;
    notifyListeners();
  }
  var _barcodeCont = TextEditingController();
  get barcodeCont => _barcodeCont;

  set barcodeCont(value) {
    _barcodeCont = value;
    notifyListeners();
  }


}