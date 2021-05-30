import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_state.dart';
import 'package:memmar_otomasyon_mobile/core/constants/enums/barcode_type_enums.dart';

import 'package:memmar_otomasyon_mobile/view/home_bottom/home_page/product_list_page/product_list_view_model.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/receipt_create_page/receipt_create_view_model.dart';
import 'package:memmar_otomasyon_mobile/view/login_page/login_page_view_model.dart';
import 'package:memmar_otomasyon_mobile/widgets/DropdownButton.dart';

import 'package:memmar_otomasyon_mobile/widgets/barcodeSearchWidget.dart';
import 'package:provider/provider.dart';

class ReceiptCreatePage extends StatefulWidget {
  @override
  _ReceiptCreatePageState createState() => _ReceiptCreatePageState();
}

class _ReceiptCreatePageState extends BaseState<ReceiptCreatePage> {
  @override
  void dispose() {
    // TODO: implement dispose
    Loader.hide();
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductListViewModel>().clear();
    Future.delayed(Duration.zero, () {
      context.read<ProductListViewModel>().wait = true;
      context.read<ProductListViewModel>().getproductList(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    BarcodeSearchWidget(
                      controller: context
                          .read<ReceiptCreateViewModel>()
                          .searchController,
                      title: 'Ürün Ekle',
                      barcodeType: BarcodeTypeEnums.STREAM,
                      onTap: () {
                        context.read<ReceiptCreateViewModel>().totalview = true;
                        print('true');
                      },
                      onSubmitedButton: (value) {
                        if (value != '') {
                          var newValue = value.split("*");
                          context
                              .read<ReceiptCreateViewModel>()
                              .getProduct(context, newValue);
                        }
                      },
                      onSubmited: (value) {
                        context.read<ReceiptCreateViewModel>().totalview =
                            false;
                        if (value != '') {
                          var newValue = value.split("*");
                          context
                              .read<ReceiptCreateViewModel>()
                              .getProduct(context, newValue);
                        }
                      },
                      onChange: (value) {
                        //context.read<ReceiptCreateViewModel>().searchController(value);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: dynamicWidth(0.85),
                      height: dynamicHeight(0.68),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(width: 1, color: Colors.black)),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              receiptContent(context),
                              GestureDetector(
                                onTap: () {
                                  context
                                          .read<ReceiptCreateViewModel>()
                                          .companyInfoControl =
                                      !context
                                          .read<ReceiptCreateViewModel>()
                                          .companyInfoControl;
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.amber.withOpacity(0.5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50))),
                                      child: Icon(context
                                              .read<ReceiptCreateViewModel>()
                                              .companyInfoControl
                                          ? Icons.keyboard_arrow_right
                                          : Icons.keyboard_arrow_down),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible:
                  context.watch<ReceiptCreateViewModel>().totalview == true,
              child: Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.green.withOpacity(0.8),
                  ),
                  child: Center(
                    child: Text(
                      '${context.watch<ReceiptCreateViewModel>().totalAmount} ₺',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.roboto(
                          fontSize: dynamicHeight(0.03),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Column receiptContent(BuildContext context) {
    return Column(
      children: [
        if (context.watch<ReceiptCreateViewModel>().companyInfoControl)
          companyInfoWidget(),
        Container(
            height: context.watch<ReceiptCreateViewModel>().companyInfoControl
                ? dynamicHeight(0.4)
                : dynamicHeight(0.6),
            color: Colors.grey,
            child: ListView.builder(
              itemCount: context.watch<ReceiptCreateViewModel>().sales.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            '${context.watch<ReceiptCreateViewModel>().sales[index].quantity} * ${context.watch<ReceiptCreateViewModel>().products[index].name}'),
                        GestureDetector(
                          onTap: () {
                            int selectQ =0;
                            List<String> list = [];
                            for(int i = 0;i<context.watch<ReceiptCreateViewModel>().sales[index].quantity!;++i){
                              list.add('${i+1}');
                            }
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.SCALE,
                              dialogType: DialogType.INFO,
                              title: 'Adet Seçiniz',

                              body: Container(
                                child:  DropdownButtonWidget(
                                  list: list,
                                  title: 'Ürün Adedi',
                                  textName: 'Ürün Adedi',
                                  function: (value) {
                                    selectQ = value+1;
                                   // context.read<ProductViewPageModel>().productType = value;
                                  },
                                ),
                              ),
                              btnOkOnPress: (){
                                context.read<ReceiptCreateViewModel>().receiptProductDelete(index,selectQ);
                              }
                            )..show();

                          },
                          child: Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'TOPLAM: ${context.watch<ReceiptCreateViewModel>().totalAmount} ₺',
              textAlign: TextAlign.start,
              style: GoogleFonts.roboto(
                  fontSize: dynamicHeight(0.03), fontWeight: FontWeight.bold),
            ),
            Visibility(
              visible: context.watch<ReceiptCreateViewModel>().sales.length > 0,
              child: ElevatedButton(
                  onPressed: () {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.SCALE,
                      dialogType: DialogType.INFO,
                      title: 'Uyarı',
                      desc:'Fişi Tamamlamak istediğinize emin misiniz?',
                      btnOkOnPress: () {
                        context.read<ReceiptCreateViewModel>().postReceipt(context);
                      }
                      ,
                    )..show();

                  },
                  child: Text('Tamamla')),
            ),
          ],
        ),
      ],
    );
  }

  Container companyInfoWidget() {
    return Container(
      height: dynamicHeight(0.18),
      child: Column(

        children: [
          Text(
            context.read<LoginPageViewModel>().company.name.toString(),
            textAlign: TextAlign.center,
            maxLines: 1,
            style: GoogleFonts.noticiaText(fontSize: dynamicHeight(0.03)),
          ),
          Text(
            'ÇIRPICI MAH. 1.TAŞOCAĞI SOK. NO:35A',
            textAlign: TextAlign.start,
            style: GoogleFonts.noticiaText(fontSize: dynamicHeight(0.02)),
          ),
          Text(
            'KASİYER ADI: ${context.watch<LoginPageViewModel>().user!.fullName.toString()}',
            textAlign: TextAlign.start,
            style: GoogleFonts.noticiaText(fontSize: dynamicHeight(0.02)),
          ),
          Text(
            'TEL:05530795539',
            textAlign: TextAlign.start,
            style: GoogleFonts.noticiaText(fontSize: dynamicHeight(0.02)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TARİH:${DateFormat('dd.MM.yyyy').format(DateTime.now())}',
                    textAlign: TextAlign.start,
                    style:
                        GoogleFonts.noticiaText(fontSize: dynamicHeight(0.02)),
                  ),
                  /*Text(
                    'FİŞ NO:351',
                    textAlign: TextAlign.start,
                    style:
                        GoogleFonts.noticiaText(fontSize: dynamicHeight(0.02)),
                  ),*/

                ],
              ),
              Text(
                'SAAT: ${DateFormat('HH:mm').format(DateTime.now())}',
                textAlign: TextAlign.start,
                style: GoogleFonts.noticiaText(fontSize: dynamicHeight(0.02)),
              ),

            ],
          ),
          Visibility(
            visible: context.watch<ReceiptCreateViewModel>().sales.length>0,
            child: GestureDetector(
              onTap: (){
                AwesomeDialog(
                  context: context,
                  animType: AnimType.SCALE,
                  dialogType: DialogType.INFO,
                  title: 'Uyarı',
                  desc:'Fişi temizlemek istediğinize emin misiniz?',
                  btnOkOnPress: () {
                    context.read<ReceiptCreateViewModel>().removeAll();
                  }
                  ,
                )..show();

              },
              child: Container(
                width: dynamicWidth(0.85),
                alignment: Alignment.centerLeft,
                child: Text(
                    'Temizle',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
