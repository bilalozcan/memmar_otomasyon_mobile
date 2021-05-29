
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:memmar_otomasyon_mobile/model/product_model.dart';
import 'package:memmar_otomasyon_mobile/service/product_service.dart';
import 'package:memmar_otomasyon_mobile/view/login_page/login_page_view_model.dart';
import 'package:provider/provider.dart';
class ProductViewPageModel extends ChangeNotifier{
  final ProductService? _authService = ProductService.instance;
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

  var purchasePrise = TextEditingController();
  var salePrise = TextEditingController();
  var stock = TextEditingController();
  var nameCont = TextEditingController();
  var barcodeCont = TextEditingController();

   clear (){
     this.stock.clear();
     this.salePrise.clear();
     stock.clear();
     nameCont.clear();
     barcodeCont.clear();
     purchasePrise.clear();
   }
  void createPrpductTEST(BuildContext context) async {
    Loader.show(context,progressIndicator:CircularProgressIndicator());
    var olusanCompanyOwner = await _authService!.createProduct(productCreateMap: {
      "companyId":context.read<LoginPageViewModel>().user!.companyId,
      "name":   this.nameCont.text,
      "purchasePrice":  double.tryParse(this.purchasePrise.text),
      "stock":  double.tryParse(this.stock.text),
      "remaining":  0,
      "barcode":  this.barcodeCont.text,
      "countryCode":  2,
      "salePrice": double.tryParse(this.salePrise.text),
      "productType": this.productType,
      "isActive": 1,
      "createdUser": "Mehmet",
      "createdDate": DateTime.now().toString(),
      "supplierId": 2,
      "sold": 0,
      "updateDate":  DateTime.now().toString(),

    });
    if(olusanCompanyOwner!=null){
      Fluttertoast.showToast(
          msg: "Ürün oluşturuldu",
          gravity: ToastGravity.SNACKBAR
      );
      Navigator.pop(context);
    }

    else{
      Fluttertoast.showToast(
          msg: "Ürün oluşturulamadı",
          gravity: ToastGravity.SNACKBAR
      );
    }
    Loader.hide();
  }


}