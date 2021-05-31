import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_state.dart';
import 'package:memmar_otomasyon_mobile/core/constants/enums/barcode_type_enums.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/home_page/product_list_page/product_list_view_model.dart';
import 'package:memmar_otomasyon_mobile/view/product_page/product_page.dart';
import 'package:memmar_otomasyon_mobile/widgets/barcodeSearchWidget.dart';
import 'package:provider/provider.dart';
class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends BaseState<ProductListPage> {

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Loader.hide();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductListViewModel>().clear();
    Future.delayed(Duration.zero,(){
      context.read<ProductListViewModel>().wait = true;
    context.read<ProductListViewModel>().getproductList(context);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Ürün Listesi'
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            BarcodeSearchWidget(
              controller:
              context.read<ProductListViewModel>().searchCont,
              title: 'Ürün Ara',
              barcodeType: BarcodeTypeEnums.NORMAL,
              onChange: (value) {
                context.read<ProductListViewModel>().wait = true;
                Future.delayed(Duration(milliseconds: 100),(){
                  context.read<ProductListViewModel>().getproductList(context);
                });
                //context.read<ReceiptCreateViewModel>().searchController(value);
              },
            ),
            SizedBox(height: 10,),
            if(context.watch<ProductListViewModel>().wait==false)Expanded(
              child: ListView.builder(
                itemCount: context.read<ProductListViewModel>().productList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: context.read<ProductListViewModel>().productList[index].isActive==true ? Colors.white:Colors.grey.withOpacity(0.1),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        splashColor: Colors.white,
                        onTap: (){
                          /* Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductPage()),
                      );*/
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      context.read<ProductListViewModel>().productList[index].name.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: dynamicHeight(0.02),
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      context.read<ProductListViewModel>().productList[index].salePrice!.toStringAsFixed(2)+'₺',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: dynamicHeight(0.02),
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      'Kalan Stok: '+context.read<ProductListViewModel>().productList[index].stock.toString(),
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
                                    Future<dynamic> future = Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ProductPage(product:context.read<ProductListViewModel>().productList[index] ,)),
                                    );
                                    future.then((value) {
                                        if (value != null) {
                                          context.read<ProductListViewModel>().wait = true;
                                       context.read<ProductListViewModel>().getproductList(context);
                                        }

                                    });

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
                  );
                },
              ),
            )
          ],
        ),
      )
    );
  }

}
