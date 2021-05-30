import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_state.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/home_page/home_page_view_model.dart';
import 'package:memmar_otomasyon_mobile/view/product_page/product_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomePageViewModel>().clear();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).viewInsets.bottom);
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
              ),
              /*ElevatedButton(
                  onPressed: () => scanBarcodeNormal(),
                  child: Text('Start barcode scan')),

              ElevatedButton(
                  onPressed: () => startBarcodeScanStream(),
                  child: Text('Start barcode scan stream')),*/
              searchWidget(context),
              SizedBox(
                height: 30,
              ),
              if (context.watch<HomePageViewModel>().contentView)
                contentWidget(context),
              if (!context.watch<HomePageViewModel>().contentView)
                productListHomeWidget(context),
            ],
          ),
        ),
      ),
    );
  }

   productListHomeWidget(BuildContext context) {
    return Container(
        height: dynamicHeight(0.5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: dynamicWidth(0.3),
                  child: Text('Ürün'),
                ),
                Container(
                  alignment: Alignment.center,
                  width: dynamicWidth(0.3),
                  child: Text('Fiyat(₺)'),
                ),
                Container(
                    alignment: Alignment.center,
                    width: dynamicWidth(0.3),
                    child: Text('Stock')),
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            Container(
              height: dynamicHeight(0.25),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: context.read<HomePageViewModel>().productList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: (){
                      Future<dynamic> future = Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductPage(product:context.read<HomePageViewModel>().productList[index] ,)),
                      );
                      future.then((value) {
                        if (value != null) {
                          context.read<HomePageViewModel>().wait = true;
                          context.read<HomePageViewModel>().getproductList(context);
                        }

                      });
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: dynamicWidth(0.3),
                              child: Text(
                                  '${context.read<HomePageViewModel>().productList[index].name}'),
                            ),
                            Container(
                                alignment: Alignment.center,
                                width: dynamicWidth(0.3),
                                child: Text(
                                    '${context.read<HomePageViewModel>().productList[index].salePrice}')),
                            Container(
                                alignment: Alignment.center,
                                width: dynamicWidth(0.3),
                                child: Text(
                                    '${context.read<HomePageViewModel>().productList[index].stock}')),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted || barcodeScanRes == '-1') {
      context.read<HomePageViewModel>().contentViewChange(true);
      return;
    }

    context.read<HomePageViewModel>().searchController.text = barcodeScanRes;
  }

  Container contentWidget(BuildContext context) {
    return Container(
      height: dynamicHeight(0.5),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: context.watch<HomePageViewModel>().contents.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                splashColor: Colors.grey,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => context
                            .watch<HomePageViewModel>()
                            .contents[index]
                            .page),
                  );
                },
                child: Card(
                  color:
                      context.watch<HomePageViewModel>().contents[index].colors,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: dynamicHeight(0.08),
                        height: dynamicHeight(0.08),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.11),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Icon(
                          context
                              .watch<HomePageViewModel>()
                              .contents[index]
                              .icon,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: Text(
                          '${context.watch<HomePageViewModel>().contents[index].text}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: dynamicHeight(0.02),
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  Container searchWidget(BuildContext context) {
    return Container(
      height: dynamicHeight(0.08),
      width: dynamicWidth(0.9),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: [
            BoxShadow(blurRadius: 8, color: Colors.black.withOpacity(0.5))
          ]),
      child: Row(
        children: [
          Container(
            width: dynamicWidth(0.8),
            child: TextField(
              onTap: () {
                context.read<HomePageViewModel>().wait = true;
                Future.delayed(Duration.zero, () {
                  context.read<HomePageViewModel>().getproductList(context);
                });
                context.read<HomePageViewModel>().contentViewChange(false);
              },
              onSubmitted: (v) {
                context.read<HomePageViewModel>().contentViewChange(true);
              },
              onChanged: (value) {
                context.read<HomePageViewModel>().wait = true;
                Future.delayed(Duration.zero, () {
                  context.read<HomePageViewModel>().getproductList(context);
                });
              },
              controller: context.read<HomePageViewModel>().searchController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Ürün Ara",
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              scanBarcodeNormal();
            },
            child: Container(
              child: Icon(Icons.qr_code_scanner),
            ),
          )
        ],
      ),
    );
  }
}
