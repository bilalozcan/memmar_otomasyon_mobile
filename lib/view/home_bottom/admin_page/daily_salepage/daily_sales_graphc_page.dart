
import 'package:flutter/material.dart';
import 'package:memmar_otomasyon_mobile/core/constants/app/app_constans.dart';
import 'package:memmar_otomasyon_mobile/service/statistic_service.dart';
import 'package:memmar_otomasyon_mobile/view/login_page/login_page_view_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:provider/provider.dart';
class DailySalesGraphicPage extends StatefulWidget {
  @override
  _DailySalesGraphicPageState createState() => _DailySalesGraphicPageState();
}

class _DailySalesGraphicPageState extends State<DailySalesGraphicPage> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,(){
      context.read<DailySalesGraphicViewModel>().wait=true;
      context.read<DailySalesGraphicViewModel>().getStatisticSeven(context);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Günlük Toplam  Satış Grafiği'),
      ),
      body: context.watch<DailySalesGraphicViewModel>().wait==false? Center(
          child: Container(
              child: SfCartesianChart(
                // Initialize category axis
                  primaryXAxis: CategoryAxis(),

                  series: <LineSeries<SalesData, String>>[
                    LineSeries<SalesData, String>(
                      // Bind data source
                        dataSource:  context.watch<DailySalesGraphicViewModel>().salsesData,
                        xValueMapper: (SalesData sales, _) => sales.day.toString(),
                        yValueMapper: (SalesData sales, _) => sales.totalAmount
                    )
                  ]
              )
          )
      ):Center(child: CircularProgressIndicator()),
    );
  }
}
class SalesData {
  int? month;
  int? day;
  int? year;
  double? totalAmount;

  SalesData(this.month, this.day, this.year, this.totalAmount);
}
class DailySalesGraphicViewModel extends ChangeNotifier {
  final StatisticService? _statisticService = StatisticService.instance;
  List<SalesData> salsesData = [];
  bool? _wait=false;

  bool get wait => _wait!;

  set wait(bool value) {
    _wait = value;
    notifyListeners();
  }
  getStatisticSeven(BuildContext context) async {
    if (this._wait == true) {
      var response = await _statisticService!.getStatistic(queryParameters: {
        "companyId": context.read<LoginPageViewModel>().user!.companyId,
      },
        path: 'seven',
      );
      salsesData.clear();
      for (var data in response["data"]) {
        SalesData sales = SalesData(data["month"], data["day"],data["year"],data["totalAmount"]+0.0);
        if(data["month"]==6)
        salsesData.add(sales);
      }
      this.wait = false;
      notifyListeners();
    }
  }
}