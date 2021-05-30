import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_state.dart';
import 'package:memmar_otomasyon_mobile/model/supplier_model.dart';
import 'package:memmar_otomasyon_mobile/service/supplier_service.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/home_page/product_list_page/product_list_view_model.dart';
import 'package:memmar_otomasyon_mobile/view/login_page/login_page_view_model.dart';
import 'package:memmar_otomasyon_mobile/view/product_page/product_view_page_model.dart';
import 'package:provider/provider.dart';
class SupplierListPage extends StatefulWidget {
  @override
  _SupplierListPageState createState() => _SupplierListPageState();
}

class _SupplierListPageState extends BaseState<SupplierListPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
              'Tedarikçi Listesi'
          ),
        ),
        body: context.watch<SupplierListViewModel>().wait==false?ListView.builder(
          itemCount:  context.read<SupplierListViewModel>().supplierList.length,
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
                  child: Card(
                    color:Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: dynamicHeight(0.08),
                              height: dynamicHeight(0.08),
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.11),
                                  borderRadius: BorderRadius.all(Radius.circular(50))),
                              child: Icon(
                                Icons.person_pin,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context.read<SupplierListViewModel>().supplierList[index].name.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: dynamicHeight(0.02),
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                Text(
                                  context.read<SupplierListViewModel>().supplierList[index].phone.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: dynamicHeight(0.02),
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ],
                            ),

                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: (){
                              },
                              child: Container(
                                height: dynamicHeight(0.07),
                                width: dynamicWidth(0.08),
                                color: Colors.green.withOpacity(0.1),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: InkWell(
                                onTap: (){

                                },
                                child: Container(
                                  height: dynamicHeight(0.07),
                                  width: dynamicWidth(0.08),
                                  color: Colors.red.withOpacity(0.1),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ):Center(child: Container())
    );
  }
}
class SupplierListViewModel extends ChangeNotifier{
  final SupplierService? _supplierService = SupplierService.instance;
  List<SupplierModel> supplierList = [];
  bool? wait;



  getSupplierList(BuildContext context) async{
    context.read<ProductViewPageModel>().selectSupplier = null;
    if(wait==true){
      Loader.show(context,progressIndicator:CircularProgressIndicator());
      var response = await _supplierService!.getSupplierList(companyId: context.read<LoginPageViewModel>().user!.companyId);
      supplierList.clear();
      for(var a in response){
        supplierList.add(a);
      }
      this.wait =false;
      notifyListeners();
      Loader.hide();
    }

  }
}
