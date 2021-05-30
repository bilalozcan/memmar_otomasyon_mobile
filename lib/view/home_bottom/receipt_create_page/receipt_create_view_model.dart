import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:memmar_otomasyon_mobile/model/product_model.dart';
import 'package:memmar_otomasyon_mobile/model/receipt_model.dart';
import 'package:memmar_otomasyon_mobile/model/sales_model.dart';
import 'package:memmar_otomasyon_mobile/service/receipt_service.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/home_page/product_list_page/product_list_view_model.dart';
import 'package:memmar_otomasyon_mobile/view/login_page/login_page_view_model.dart';
import 'package:provider/provider.dart';

class ReceiptCreateViewModel extends ChangeNotifier {
  TextEditingController _searchController = TextEditingController();
  final ReceiptService? _receiptService = ReceiptService.instance;
  var _companyInfoControl = true;
  bool _totalview = false;

  bool get totalview => _totalview;

  set totalview(bool value) {
    _totalview = value;
    notifyListeners();
  }

  List<SalesModel> sales = [];
  List<Product> products = [];
  ReceiptModel? _receiptModel;
  double totalAmount = 0;

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

  ReceiptModel get receiptModel => _receiptModel!;

  set receiptModel(ReceiptModel value) {
    _receiptModel = value;
    notifyListeners();
  }

  receiptProductDelete(int index,int quantity) {
    if(sales[index].quantity==quantity){
      totalAmount -= (quantity * products[index].salePrice!);
      sales.removeAt(index);
      products.removeAt(index);
    }
    else{
      totalAmount -= (quantity * products[index].salePrice!);
      sales[index].quantity = sales[index].quantity! - quantity;
    }

    notifyListeners();
  }
  removeAll(){
    totalAmount =0.0;
    sales.clear();
    products.clear();
    notifyListeners();
  }
  getProduct(BuildContext context, var value) async {
    String quant = '';
    String brcd = '';
    if (value.length == 1) {
      quant = '1';
      brcd = value[0];
    } else if (value.length == 2) {
      quant = value[0];
      brcd = value[1];
    }
    for (var a in context.read<ProductListViewModel>().productList) {
      if (a.barcode == brcd) {
        for (var b in sales) {
          if (a.id == b.productId) {
            b.quantity = (b.quantity! + int.tryParse(quant)!);
            totalAmount += (int.tryParse(quant)! * a.salePrice!);
            searchController.clear();
            notifyListeners();
            return;
          }
        }
        sales.add(SalesModel(
          quantity: int.tryParse(quant),
          createdDate: DateTime.now(),
          productId: a.id,
          userId: context.read<LoginPageViewModel>().user!.id,
        ));
        products.add(a);
        totalAmount += (int.tryParse(quant)! * a.salePrice!);
        searchController.clear();
        notifyListeners();
        return;
      }
    }
    Fluttertoast.showToast(msg: 'Ürün Bulunamadı');
  }

  postReceipt(BuildContext context) async {
    Loader.show(context, progressIndicator: CircularProgressIndicator());
    ReceiptModel receiptModel = ReceiptModel(
      createdUser: context.read<LoginPageViewModel>().user!.id,
      totalSales: this.sales.length,
      totalAmount: this.totalAmount,
      paymentType: 1,
      companyId: context.read<LoginPageViewModel>().company.id,
      createdDate: DateTime.now(),
      salesList: sales,
    );
    var receipt =
        await _receiptService!.createReceipt(receiptModel: receiptModel);
    Loader.hide();
    if (receipt == null) {
      Fluttertoast.showToast(msg: 'Fiş Oluşturulamadı');
    } else {
      Fluttertoast.showToast(msg: 'Fiş Başarılı bir şekilde oluşturuldu');
      sales.clear();
      products.clear();
      totalAmount =0.0;
      notifyListeners();
    }
  }
}
