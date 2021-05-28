import 'package:flutter/cupertino.dart';

class ReceiptCreateViewModel extends ChangeNotifier {
  var _searchController = TextEditingController();
  var _companyInfoControl=true;

  bool get companyInfoControl => _companyInfoControl;

  set companyInfoControl(bool value) {
    _companyInfoControl = value;
    notifyListeners();
  }

  get searchController => _searchController;

  set searchController(value) {
    _searchController = value;
    notifyListeners();
  }
}