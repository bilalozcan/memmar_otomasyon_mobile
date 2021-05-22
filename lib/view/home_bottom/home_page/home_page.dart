import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_state.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/home_page/home_page_view_model.dart';
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
              if (!context.watch<HomePageViewModel>().contentView)Container(
                height: dynamicHeight(0.5),
                child: ListView.builder(
                  itemCount: 50,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Item ${index + 1}'),
                      ),
                    );
                  },
                )
              ),
            ],
          ),
        ),
      ),
    );
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
    if (!mounted||barcodeScanRes=='-1') {
      context.read<HomePageViewModel>().contentViewChange(true);
      return;
    }

    context.read<HomePageViewModel>().changeSearchController(barcodeScanRes);
  }
  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
        '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
    // Platform messages are asynchronous, so we initialize in an async method.
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
                onTap: (){

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
                            borderRadius: BorderRadius.all(Radius.circular(50))),
                        child: Icon(
                          context.watch<HomePageViewModel>().contents[index].icon,
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
                context.read<HomePageViewModel>().contentViewChange(false);
              },
              onSubmitted: (v) {
                context.read<HomePageViewModel>().contentViewChange(true);
              },
              onChanged: (value) {},
              controller: context.read<HomePageViewModel>().searchController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Ürün Ara",
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
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
