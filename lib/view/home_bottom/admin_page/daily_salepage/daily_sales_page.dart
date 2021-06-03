import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_state.dart';
import 'package:memmar_otomasyon_mobile/model/receipt_model.dart';
import 'package:memmar_otomasyon_mobile/service/receipt_service.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/daily_salepage/daily_sales_graphc_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/supply_list_page/supply_graphic_page.dart';
import 'package:memmar_otomasyon_mobile/view/login_page/login_page_view_model.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class DailySalesPage extends StatefulWidget {
  @override
  _DailySalesPageState createState() => _DailySalesPageState();
}

class _DailySalesPageState extends BaseState<DailySalesPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<DailySalesViewModel>().wait = true;
      context.read<DailySalesViewModel>().getReceiptList(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Günlük Satışlar'),
          actions: [
            GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DailySalesGraphicPage()),
                  );
                },
                child: Icon(Icons.insert_chart))
          ],
        ),
        body: Container(
          height: dynamicHeight(1),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DatePicker(
                    DateTime(DateTime.now().year, DateTime.now().month,
                        DateTime.now().day - 5),
                    initialSelectedDate:
                        context.watch<DailySalesViewModel>().selectedDate,
                    selectionColor: Colors.blue,
                    selectedTextColor: Colors.white,
                    onDateChange: (date) {
                      context.read<DailySalesViewModel>().selectedDate = date;
                      Future.delayed(Duration.zero, () {
                        context.read<DailySalesViewModel>().wait = true;
                        context
                            .read<DailySalesViewModel>()
                            .getReceiptList(context);
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      'Tarih',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: dynamicHeight(0.02),
                          fontWeight: FontWeight.w900,
                          color: Colors.black),
                    ),
                  ),
                  Text(
                    'Ödeme Tipi',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: dynamicHeight(0.02),
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                  Text(
                    'Tutar (₺)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: dynamicHeight(0.02),
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                ],
              ),
              Divider(
                color: Colors.black,
              ),
              context.watch<DailySalesViewModel>().wait == false
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: context
                            .watch<DailySalesViewModel>()
                            .receiptList
                            .length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            splashColor: Colors.blue,
                            onTap: () {
                              showDialog<void>(
                                context: context,
                                // user must tap button!
                                builder: (BuildContext context) {
                                  return Container(
                                    color: Colors.white,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Container(
                                              height: dynamicHeight(0.6),
                                              color: Colors.grey,
                                              child: ListView.builder(
                                                itemCount: context
                                                    .watch<
                                                    DailySalesViewModel>()
                                                    .receiptList[index]
                                                    .salesList!
                                                    .length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                    int index2) {
                                                  return Card(
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets.all(
                                                          8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Text(
                                                              '${context.watch<DailySalesViewModel>().receiptList[index].salesList![index2].quantity} *'
                                                                  ' ${context.watch<DailySalesViewModel>().receiptList[index].salesList![index2].productId}'),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              )),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'TOPLAM: ${context.watch<DailySalesViewModel>().receiptList[index].totalAmount} ₺',
                                                textAlign: TextAlign.start,
                                                style: GoogleFonts.roboto(
                                                    fontSize:
                                                    dynamicHeight(0.03),
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: receiptCardWidget(context, index),
                          );
                        },
                      ),
                    )
                  : Center(child: CircularProgressIndicator())
            ],
          ),
        ));
  }

  Card receiptCardWidget(BuildContext context, int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat('dd.MM.yyy HH.mm')
                  .format(context
                      .watch<DailySalesViewModel>()
                      .receiptList[index]
                      .createdDate!)
                  .toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: dynamicHeight(0.02),
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            Text(
              context
                          .watch<DailySalesViewModel>()
                          .receiptList[index]
                          .paymentType ==
                      0
                  ? 'Nakit'
                  : 'Kredi Kartı',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: dynamicHeight(0.02),
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            Text(
              context
                      .watch<DailySalesViewModel>()
                      .receiptList[index]
                      .totalAmount
                      .toString() +
                  '₺',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: dynamicHeight(0.02),
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

class DailySalesViewModel extends ChangeNotifier {
  final ReceiptService? _receiptService = ReceiptService.instance;
  DateTime? _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate!;

  set selectedDate(DateTime value) {
    _selectedDate = value;
    notifyListeners();
  }

  List<ReceiptModel> receiptList = [];
  bool? _wait=false;

  bool get wait => _wait!;

  set wait(bool value) {
    _wait = value;
    notifyListeners();
  }

  getReceiptList(BuildContext context) async {
    if (this._wait == true) {
      var response = await _receiptService!.getReceipt(parameter: {
        "companyId": context.read<LoginPageViewModel>().user!.companyId,
        "startDate": DateTime(
            selectedDate.year, selectedDate.month, selectedDate.day, 00),
        "endDate": DateTime(
            selectedDate.year, selectedDate.month, selectedDate.day, 24)
      });
      receiptList.clear();
      for (var a in response) {
        receiptList.add(a);
      }
      this.wait = false;
      notifyListeners();
    }
  }
}
