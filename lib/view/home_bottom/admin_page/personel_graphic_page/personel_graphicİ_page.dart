
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
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
                         SalesData('Jan', 35),
                         SalesData('Feb', 28),
                         SalesData('Mar', 34),
                         SalesData('Apr', 32),
                         SalesData('May', 40)
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