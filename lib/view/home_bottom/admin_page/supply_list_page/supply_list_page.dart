import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_state.dart';
import 'package:memmar_otomasyon_mobile/model/supplier_model.dart';
import 'package:memmar_otomasyon_mobile/model/supply_model.dart';
import 'package:memmar_otomasyon_mobile/service/supplier_service.dart';
import 'package:memmar_otomasyon_mobile/service/supply_service.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/supplier_list_page/supplier_list_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/home_page/product_list_page/product_list_view_model.dart';
import 'package:memmar_otomasyon_mobile/view/login_page/login_page_view_model.dart';
import 'package:memmar_otomasyon_mobile/view/product_page/product_view_page_model.dart';
import 'package:provider/provider.dart';
class SupplyListPage extends StatefulWidget {
  @override
  _SupplyListPageState createState() => _SupplyListPageState();
}

class _SupplyListPageState extends BaseState<SupplyListPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,(){
      context.read<SupplyListViewModel>().wait = true;
     context.read<SupplyListViewModel>().getSupplyList(context);
    });
    Future.delayed(Duration.zero,(){
      context.read<ProductListViewModel>().wait = true;
      context.read<ProductListViewModel>().getproductList(context);
    });
    Future.delayed(Duration.zero,(){
      context.read<SupplierListViewModel>().wait = true;
      context.read<SupplierListViewModel>().getSupplierList(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'Tedarik Listesi'
          ),
        ),
        body: context.watch<SupplyListViewModel>().wait==false?Column(
          children: [
            SizedBox(height: 10,),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 15),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ürün',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: dynamicHeight(0.025),
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                  Text(
                    'Tedarikçi',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: dynamicHeight(0.025),
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                  Text(
                    ' Adet',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: dynamicHeight(0.025),
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                ],
            ),
             ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount:  context.read<SupplyListViewModel>().supplyList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        splashColor: Colors.grey,
                        onTap: (){
                          /* Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProductPage()),
                        );*/
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              getProduct(index).name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: dynamicHeight(0.02),
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            Text(
                              getSuplier(index).name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: dynamicHeight(0.02),
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            Text(
                              context.read<SupplyListViewModel>().supplyList[index].quantity.toString()+' Adet',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: dynamicHeight(0.02),
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ):Center(child: Container())
    );
  }
   getProduct(int index){
    //context.read<SupplyListViewModel>().supplyList[index].productId
    for(var a in context.read<ProductListViewModel>().productList){
      if(a.id==context.read<SupplyListViewModel>().supplyList[index].productId)
        return a;
    }
  }
  getSuplier(int index){
    //context.read<SupplyListViewModel>().supplyList[index].productId
    for(var a in context.read<SupplierListViewModel>().supplierList){
      if(a.id==context.read<SupplyListViewModel>().supplyList[index].supplierId)
        return a;
    }
  }
}
class SupplyListViewModel extends ChangeNotifier{
  final SupplyService? _supplierService = SupplyService.instance;
  List<SupplyModel> supplyList = [];
  bool? wait;



  getSupplyList(BuildContext context) async{
    if(wait==true){
      Loader.show(context,progressIndicator:CircularProgressIndicator());
      var response = await _supplierService!.getSupplyList(companyId: context.read<LoginPageViewModel>().user!.companyId);
      supplyList.clear();
      for(var a in response){
        supplyList.add(a);
      }
      this.wait =false;
      notifyListeners();
      Loader.hide();
    }

  }
}
