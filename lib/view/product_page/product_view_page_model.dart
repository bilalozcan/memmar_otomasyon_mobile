
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:memmar_otomasyon_mobile/model/product_model.dart';
import 'package:memmar_otomasyon_mobile/model/supplier_model.dart';
import 'package:memmar_otomasyon_mobile/service/product_service.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/supplier_list_page/supplier_list_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/home_page/product_list_page/product_list_view_model.dart';
import 'package:memmar_otomasyon_mobile/view/login_page/login_page_view_model.dart';
import 'package:provider/provider.dart';
class ProductViewPageModel extends ChangeNotifier{
  final ProductService? _authService = ProductService.instance;
  SupplierModel? selectSupplier;
  supplierChange(SupplierModel value){
    selectSupplier = value;
    notifyListeners();
  }
  int? productType=0;
  set productTypeChange(int value) {
    productType = value;
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
      "purchasePrice":  double.tryParse(double.tryParse(this.purchasePrise.text)!.toStringAsFixed(2)),
      "stock":  int.tryParse(this.stock.text),
      "barcode":  this.barcodeCont.text,
      "countryCode":  'TR',
      "salePrice": double.tryParse(double.tryParse(this.salePrise.text)!.toStringAsFixed(2)),
      "productType": this.productType,
      "isActive": true,
      "createdUser": context.read<LoginPageViewModel>().user!.id,
      "createdDate": DateTime.now().toString(),
      "supplierId": selectSupplier!.id,
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

  void updatePrpduct(BuildContext context,Product product) async {
    Loader.show(context,progressIndicator:CircularProgressIndicator());
    product = Product().fromJson({
      "id":product.id,
      "companyId":context.read<LoginPageViewModel>().user!.companyId,
      "name":   this.nameCont.text,
      "purchasePrice":  double.tryParse(double.tryParse(this.purchasePrise.text)!.toStringAsFixed(2)),
      "stock":  int.tryParse(this.stock.text),
      "barcode":  this.barcodeCont.text,
      "countryCode":  'TR',
      "salePrice": double.tryParse(double.tryParse(this.salePrise.text)!.toStringAsFixed(2)),
      "productType": this.productType,
      "isActive": true,
      "createdUser": context.read<LoginPageViewModel>().user!.id,
      "createdDate": DateTime.now().toString(),
      "supplierId": selectSupplier!.id,
      "sold": 0,
      "updateDate":  DateTime.now().toString(),

    });
    var updateProduct = await _authService!.updateProduct(product:product );
    if(updateProduct!=null){
      Fluttertoast.showToast(
          msg: "Ürün Güncellendi",
          gravity: ToastGravity.SNACKBAR
      );
      notifyListeners();
      Navigator.pop(context,product);
    }

    else{
      Fluttertoast.showToast(
          msg: "Ürün Güncellenemedi",
          gravity: ToastGravity.SNACKBAR
      );
    }
    Loader.hide();
  }


}