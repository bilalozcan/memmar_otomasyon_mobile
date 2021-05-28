import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_state.dart';
import 'package:memmar_otomasyon_mobile/core/constants/enums/barcode_type_enums.dart';
class BarcodeSearchWidget extends StatefulWidget {
  var controller;
  Function? onTap;
  Function? onChange;
  Function? onSubmited;
  String? title;
  BarcodeTypeEnums? barcodeType;
  @override
  _BarcodeSearchWidgetState createState() => _BarcodeSearchWidgetState();

  BarcodeSearchWidget({this.controller, this.onTap, this.onChange,
      this.onSubmited, this.title, this.barcodeType});
}

class _BarcodeSearchWidgetState extends BaseState<BarcodeSearchWidget> {
  final _sigInFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _sigInFormKey,
      child: Container(
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
                  if(widget.onTap!=null)
                  widget.onTap!();
                },
                onSubmitted: (v) {
                  if(widget.onSubmited!=null)
                  widget.onSubmited!(v);
                },
                onChanged: (value) {
                  if(widget.onChange!=null)
                  widget.onChange!(value);
                },
                controller: widget.controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.title,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                if(widget.barcodeType==BarcodeTypeEnums.NORMAL)
                  scanBarcodeNormal();
               else  if(widget.barcodeType==BarcodeTypeEnums.STREAM)
                startBarcodeScanStream();
              },
              child: Container(
                child: Icon(Icons.qr_code_scanner),
              ),
            )
          ],
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
      return;
    }
    if(widget.onChange!=null)
    widget.onChange!(barcodeScanRes);
  }
  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
        '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) {
          if(widget.onChange!=null)
            widget.onChange!(barcode);
    });
    // Platform messages are asynchronous, so we initialize in an async method.
  }
}
