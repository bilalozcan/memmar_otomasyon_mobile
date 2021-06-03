
import 'package:flutter/material.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_state.dart';
import 'package:memmar_otomasyon_mobile/core/constants/app/app_constans.dart';
import 'package:memmar_otomasyon_mobile/service/statistic_service.dart';
import 'package:memmar_otomasyon_mobile/view/login_page/login_page_view_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:provider/provider.dart';
class MonthlySalesPage extends StatefulWidget {
  @override
  _MonthlySalesPageState createState() => _MonthlySalesPageState();
}

class _MonthlySalesPageState extends BaseState<MonthlySalesPage> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,(){
      context.read<MonthlySalesViewModel>().wait=true;
      context.read<MonthlySalesViewModel>().getStatisticFour(context);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Şirket Aylık Gelirler'),
      ),
      body: context.watch<MonthlySalesViewModel>().wait==false? Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
            children: [
              GestureDetector(
                onTap: (){
                  Future.delayed(Duration.zero,(){
                    context.read<MonthlySalesViewModel>().wait=true;
                    context.read<MonthlySalesViewModel>().isSales=true;
                    context.read<MonthlySalesViewModel>().getStatisticFour(context);
                  });
                },
                child: Container(
                  color:!context.watch<MonthlySalesViewModel>().isSales?Colors.white:Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Ürün Fiyatına göre'),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Future.delayed(Duration.zero,(){
                    context.read<MonthlySalesViewModel>().wait=true;
                    context.read<MonthlySalesViewModel>().isSales=false;
                    context.read<MonthlySalesViewModel>().getStatisticFour(context);
                  });
                },
                child: Container(
                  color:!context.watch<MonthlySalesViewModel>().isSales?Colors.blue:Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Ürün Adetine göre'),
                  ),
                ),
              )
            ],
          ),
          Center(
              child: Container(
                height: dynamicHeight(0.75),
                  child: SfCartesianChart(
                      primaryYAxis: CategoryAxis(),
                      primaryXAxis: CategoryAxis(),
                      series: <ChartSeries>[
                        // Renders bar chart
                        BarSeries<SalesData, String>(
                            dataSource:  context.watch<MonthlySalesViewModel>().salsesData,
                            xValueMapper: (SalesData sales, _) => sales.user,
                            yValueMapper: (SalesData sales, _) => sales.sales
                        )
                      ]
                  )
              )

          ),
        ],
      ):Center(child: CircularProgressIndicator()),
    );
  }
}
class SalesData {
  SalesData(this.user, this.sales);
  final String user;
  final double sales;
}
class MonthlySalesViewModel extends ChangeNotifier {
  final StatisticService? _statisticService = StatisticService.instance;
  List<SalesData> salsesData = [];
  bool? _wait=false;
bool isSales=true;
  bool get wait => _wait!;

  set wait(bool value) {
    _wait = value;
    notifyListeners();
  }
  getStatisticFour(BuildContext context) async {
    if (this._wait == true) {
      var response = await _statisticService!.getStatistic(queryParameters: {
        "companyId": context.read<LoginPageViewModel>().user!.companyId,
      },
        path:isSales? 'four':'six',
      );
      salsesData.clear();
      for (var data in response["data"]) {
        SalesData sales;
        if(isSales){
          String month = ApplicationConstants.MONTH_LIST[data["month"]-1];
          sales = SalesData(month, data["totalAmount"]+0.0);
        }
        else{
          String month = ApplicationConstants.MONTH_LIST[data["ay"]-1];
          sales = SalesData(month, data["quantity"]+0.0);
        }


        salsesData.add(sales);
      }
      this.wait = false;
      notifyListeners();
    }
  }
}