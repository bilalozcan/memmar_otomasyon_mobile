
import 'package:flutter/material.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_state.dart';
import 'package:memmar_otomasyon_mobile/model/receipt_model.dart';
import 'package:memmar_otomasyon_mobile/service/receipt_service.dart';
import 'package:memmar_otomasyon_mobile/service/statistic_service.dart';
import 'package:memmar_otomasyon_mobile/view/login_page/login_page_view_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:provider/provider.dart';
class PersonelGraphicPage extends StatefulWidget {
  @override
  _PersonelGraphicPageState createState() => _PersonelGraphicPageState();
}

class _PersonelGraphicPageState extends BaseState<PersonelGraphicPage> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,(){
      context.read<PersonelGraphicViewModel>().wait=true;
      context.read<PersonelGraphicViewModel>().getStatisticOne(context);
    });

  }
  @override
  Widget build(BuildContext context) {
 return Scaffold(
     appBar: AppBar(
       title: Text('Çalışan  Satışlar'),
     ),
     body: context.watch<PersonelGraphicViewModel>().wait==false? Column(
       children: [
         Row(
           mainAxisSize: MainAxisSize.max,
           mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
           children: [
             GestureDetector(
               onTap: (){
                 Future.delayed(Duration.zero,(){
                   context.read<PersonelGraphicViewModel>().wait=true;
                   context.read<PersonelGraphicViewModel>().isSales=true;
                   context.read<PersonelGraphicViewModel>().getStatisticOne(context);
                 });
               },
               child: Container(
                 color:!context.watch<PersonelGraphicViewModel>().isSales?Colors.white:Colors.blue,
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text('Ürün adetine göre'),
                 ),
               ),
             ),
             GestureDetector(
               onTap: (){
                 Future.delayed(Duration.zero,(){
                   context.read<PersonelGraphicViewModel>().wait=true;
                   context.read<PersonelGraphicViewModel>().isSales=false;
                   context.read<PersonelGraphicViewModel>().getStatisticOne(context);
                 });
               },
               child: Container(
                 color:!context.watch<PersonelGraphicViewModel>().isSales?Colors.blue:Colors.white,
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text('Ürün Fiyatına göre'),
                 ),
               ),
             )
           ],
         ),
         Container(
           height: dynamicHeight(0.75),
             child: SfCartesianChart(
                 primaryYAxis: CategoryAxis(),
                 primaryXAxis: CategoryAxis(),
                 series: <ChartSeries>[
                   // Renders bar chart
                   BarSeries<SalesData, String>(
                       dataSource:  context.watch<PersonelGraphicViewModel>().salsesData,
                       xValueMapper: (SalesData sales, _) => sales.user,
                       yValueMapper: (SalesData sales, _) => sales.sales
                   )
                 ]
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
  final double  sales;
}
class PersonelGraphicViewModel extends ChangeNotifier {
  final StatisticService? _statisticService = StatisticService.instance;
  List<SalesData> salsesData = [];
  bool isSales = false;
  bool? _wait=false;

  bool get wait => _wait!;

  set wait(bool value) {
    _wait = value;
    notifyListeners();
  }
  getStatisticOne(BuildContext context) async {
    if (this._wait == true) {
      var response = await _statisticService!.getStatistic(queryParameters: {
        "companyId": context.read<LoginPageViewModel>().user!.companyId,
        "isSales":isSales
      },
        path: 'one',
      );
      salsesData.clear();
      for (var data in response["data"]) {
        if(isSales)
            salsesData.add(SalesData(data["fullName"], data["totalSales"]+0.0));
        else
          salsesData.add(SalesData(data["fullName"], data["totalAmount"]+0.0));

      }
      this.wait = false;
      notifyListeners();
    }
  }
}