
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_state.dart';
import 'package:provider/provider.dart';
class DailySalesPage extends StatefulWidget {
  @override
  _DailySalesPageState createState() => _DailySalesPageState();
}

class _DailySalesPageState extends BaseState<DailySalesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Günlük Satışlar'),
      ),
      body: Container(
        height: dynamicHeight(1),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DatePicker(
                  DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-50),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.blue,
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                  context.read<DailySalesViewModel>().selectedDate=date;
                  },
                ),
              ],
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color:Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ürün adı',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: dynamicHeight(0.02),
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            Text(
                              '10 adet',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: dynamicHeight(0.02),
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}
class DailySalesViewModel extends ChangeNotifier{
  DateTime? _selectedDate;

  DateTime get selectedDate => _selectedDate!;

  set selectedDate(DateTime value) {
    _selectedDate = value;
    notifyListeners();
  }
}