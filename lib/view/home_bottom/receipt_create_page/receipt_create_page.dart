import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_state.dart';
import 'package:memmar_otomasyon_mobile/core/constants/enums/barcode_type_enums.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/receipt_create_page/receipt_create_view_model.dart';
import 'package:memmar_otomasyon_mobile/widgets/barcodeSearchWidget.dart';
import 'package:provider/provider.dart';

class ReceiptCreatePage extends StatefulWidget {
  @override
  _ReceiptCreatePageState createState() => _ReceiptCreatePageState();
}

class _ReceiptCreatePageState extends BaseState<ReceiptCreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                  controller:
                      context.read<ReceiptCreateViewModel>().searchController,
                  title: 'Ürün Ekle',
                  barcodeType: BarcodeTypeEnums.STREAM,
                  onChange: (value) {
                    //context.read<ReceiptCreateViewModel>().searchController(value);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: dynamicWidth(0.85),
                  height: dynamicHeight(0.65),
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
                                    borderRadius: BorderRadius.all(Radius.circular(50))
                                  ),
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
                )
              ],
            ),
          ),
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
              itemCount: 50,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Item ${index + 1}'),
                  ),
                );
              },
            )),
        Text(
          'TOPLAM: 39.90',
          textAlign: TextAlign.start,
          style: GoogleFonts.noticiaText(
              fontSize: dynamicHeight(0.03), fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Container companyInfoWidget() {
    return Container(
      height: dynamicHeight(0.2),
      child: Column(
        children: [
          Text(
            'MEMMAR HİPERMARKET',
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
            'KASİYER ADI:MEHMET ARSAY',
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
                    'TARİH:02.01.2020',
                    textAlign: TextAlign.start,
                    style:
                        GoogleFonts.noticiaText(fontSize: dynamicHeight(0.02)),
                  ),
                  Text(
                    'FİŞ NO:351',
                    textAlign: TextAlign.start,
                    style:
                        GoogleFonts.noticiaText(fontSize: dynamicHeight(0.02)),
                  ),
                ],
              ),
              Text(
                'SAAT: 18.30',
                textAlign: TextAlign.start,
                style: GoogleFonts.noticiaText(fontSize: dynamicHeight(0.02)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
