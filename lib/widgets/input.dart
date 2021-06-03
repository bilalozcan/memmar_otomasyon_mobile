import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_model.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_state.dart';

class CustomInput extends StatefulWidget {
  TextEditingController? controller;
  String? title;
  String? hint;
  bool? scanner;
  Function? onchange;
  Function? ontap;
  double? width;
  bool? validateEmpty;
  FormFieldValidator<String>? validator;
  bool? hidePass;
  String? initValue;
  bool? readOnly;
  TextInputType? keyboardType;
  TextInputAction? inputAction;
  List<TextInputFormatter>? inputFormatters;
  bool? enabled;

  CustomInput(
      {this.controller,
      this.title = 'başlık',
      this.hint = "",
      this.onchange,
        this.scanner=false,
      this.width = double.infinity,
      this.ontap,
      this.initValue,
      this.hidePass = false,
      this.readOnly = false,
      this.keyboardType,
      this.inputAction,
      this.validateEmpty = false,
      this.enabled = true,
      this.inputFormatters,
      this.validator}){
    if(validator==null&&validateEmpty==true){
      validator = (val){
        if(val==''){
          return '$hint boş olamaz';
        }
      };
    }
  }

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends BaseState<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 25),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title!,
              style: TextStyle(
                  fontSize: dynamicHeight(0.02), fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 8, color: Colors.black.withOpacity(0.1))
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Container(
                      width: dynamicWidth(widget.width! / MediaQuery.of(context).size.width)-dynamicWidth(0.2),
                      child: TextFormField(
                        enabled: widget.enabled,
                        textInputAction: widget.inputAction,
                        keyboardType: widget.keyboardType,
                        readOnly: widget.readOnly!,
                        obscureText: widget.hidePass!,
                        initialValue: widget.initValue,
                        onTap: () {
                          if (widget.ontap != null) widget.ontap!();
                        },
                        onChanged: (value) {
                          if (widget.onchange != null) widget.onchange!(value);
                        },
                        controller: widget.controller,
                        inputFormatters: widget.inputFormatters,
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                            hintText: widget.hint, border: InputBorder.none),
                        validator: widget.validator,
                      ),
                    ),
                    if(widget.scanner!)GestureDetector(
                      onTap: (){
                        scanBarcodeNormal();
                      },
                      child: Container(
                        child: Icon(
                          Icons.qr_code_scanner
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
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

    setState(() {
      widget.controller!.text = barcodeScanRes;
    });
  }
  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
        '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
    // Platform messages are asynchronous, so we initialize in an async method.
  }
}
