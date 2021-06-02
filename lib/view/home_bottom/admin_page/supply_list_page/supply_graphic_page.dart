
import 'package:flutter/material.dart';
import 'package:memmar_otomasyon_mobile/core/constants/app/app_constans.dart';
import 'package:memmar_otomasyon_mobile/service/statistic_service.dart';
import 'package:memmar_otomasyon_mobile/view/login_page/login_page_view_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:provider/provider.dart';
class SupplyGraphicPage extends StatefulWidget {
  @override
  _SupplyGraphicPageState createState() => _SupplyGraphicPageState();
}

class _SupplyGraphicPageState extends State<SupplyGraphicPage> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,(){
      context.read<SupplyGraphicViewModel>().wait=true;
      context.read<SupplyGraphicViewModel>().getStatisticTwo(context);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tedarik Listsi Grafiği'),
      ),
      body: context.watch<SupplyGraphicViewModel>().wait==false? Center(
          child: Container(
              child: SfCartesianChart(
                  primaryYAxis: CategoryAxis(),
                  primaryXAxis: CategoryAxis(),
                  series: <ChartSeries>[
                    // Renders bar chart
                    BarSeries<SalesData, String>(
                        dataSource:  context.watch<SupplyGraphicViewModel>().salsesData,
                        xValueMapper: (SalesData sales, _) => sales.user,
                        yValueMapper: (SalesData sales, _) => sales.sales
                    )
                  ]
              )
          )

      ):Center(child: CircularProgressIndicator()),
    );
  }
}
class SalesData {
  SalesData(this.user, this.sales);
  final String user;
  final int sales;
}
class SupplyGraphicViewModel extends ChangeNotifier {
  final StatisticService? _statisticService = StatisticService.instance;
  List<SalesData> salsesData = [];
  bool? _wait=false;

  bool get wait => _wait!;

  set wait(bool value) {
    _wait = value;
    notifyListeners();
  }
  getStatisticTwo(BuildContext context) async {
    if (this._wait == true) {
      var response = await _statisticService!.getStatistic(queryParameters: {
        "companyId": context.read<LoginPageViewModel>().user!.companyId,
      },
        path: 'three',
      );
      salsesData.clear();
      for (var data in response["data"]) {
        SalesData sales = SalesData(data["name"], data["quantity"]);
        salsesData.add(sales);
      }
      this.wait = false;
      notifyListeners();
    }
  }
}