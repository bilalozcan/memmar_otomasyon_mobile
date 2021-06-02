
import 'package:flutter/material.dart';
import 'package:memmar_otomasyon_mobile/core/constants/app/app_constans.dart';
import 'package:memmar_otomasyon_mobile/service/statistic_service.dart';
import 'package:memmar_otomasyon_mobile/view/login_page/login_page_view_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:provider/provider.dart';
class MonthlySupplyPage extends StatefulWidget {
  @override
  _MonthlySupplyPageState createState() => _MonthlySupplyPageState();
}

class _MonthlySupplyPageState extends State<MonthlySupplyPage> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,(){
      context.read<MonthlySupplyViewModel>().wait=true;
      context.read<MonthlySupplyViewModel>().getStatisticFive(context);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Şirket Aylık Giderler'),
      ),
      body: context.watch<MonthlySupplyViewModel>().wait==false? Center(
          child: Container(
              child: SfCartesianChart(
                  primaryYAxis: CategoryAxis(),
                  primaryXAxis: CategoryAxis(),
                  series: <ChartSeries>[
                    // Renders bar chart
                    BarSeries<SalesData, String>(
                        dataSource:  context.watch<MonthlySupplyViewModel>().salsesData,
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
class MonthlySupplyViewModel extends ChangeNotifier {
  final StatisticService? _statisticService = StatisticService.instance;
  List<SalesData> salsesData = [];


  bool? _wait=false;

  bool get wait => _wait!;

  set wait(bool value) {
    _wait = value;
    notifyListeners();
  }
  getStatisticFive(BuildContext context) async {
    if (this._wait == true) {
      var response = await _statisticService!.getStatistic(queryParameters: {
        "companyId": context.read<LoginPageViewModel>().user!.companyId,
      },
        path: 'five',
      );
      salsesData.clear();
      for (var data in response["data"]) {
        String month = ApplicationConstants.MONTH_LIST[data["month"]-1];
        SalesData sales = SalesData(month, data["totalSupply"]);
        salsesData.add(sales);
      }
      this.wait = false;
      notifyListeners();
    }
  }
}