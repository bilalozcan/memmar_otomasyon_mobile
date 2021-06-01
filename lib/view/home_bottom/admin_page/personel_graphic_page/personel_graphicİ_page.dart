
import 'package:flutter/material.dart';
import 'package:memmar_otomasyon_mobile/model/receipt_model.dart';
import 'package:memmar_otomasyon_mobile/service/receipt_service.dart';
import 'package:memmar_otomasyon_mobile/view/login_page/login_page_view_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:provider/provider.dart';
class PersonelGraphicPage extends StatefulWidget {
  @override
  _PersonelGraphicPageState createState() => _PersonelGraphicPageState();
}

class _PersonelGraphicPageState extends State<PersonelGraphicPage> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
 return Scaffold(
     appBar: AppBar(
       title: Text('Şirket Aylık Satışlar'),
     ),
     body: Center(
         child: Container(
             child: SfCartesianChart(
               // Initialize category axis
                  primaryYAxis: CategoryAxis(),
                 primaryXAxis: CategoryAxis(),
                 series: <LineSeries<SalesData, String>>[
                   LineSeries<SalesData, String>(
                     // Bind data source
                       dataSource:  <SalesData>[
                         SalesData('OCAK', 999),
                         SalesData('ŞUBAT', 28),
                         SalesData('MART', 34),
                         SalesData('NİSAN', 32),
                         SalesData('MAYIS', 40)
                       ],
                       xValueMapper: (SalesData sales, _) => sales.year,
                       yValueMapper: (SalesData sales, _) => sales.sales
                   )
                 ]
             )
         )
     )
 );
  }
}
class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
class PersonelGraphicViewModel extends ChangeNotifier {
  final ReceiptService? _receiptService = ReceiptService.instance;
  List<ReceiptModel> receiptList = [];
  bool? _wait;

  bool get wait => _wait!;

  set wait(bool value) {
    _wait = value;
    notifyListeners();
  }
  getReceiptList(BuildContext context) async {
    if (this._wait == true) {
      var response = await _receiptService!.getReceipt(parameter: {
        "companyId": context.read<LoginPageViewModel>().user!.companyId,

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