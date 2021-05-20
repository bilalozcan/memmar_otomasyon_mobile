import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  double dynamicHeight(double value) => MediaQuery.of(context).size.height * value;

  double dynamicWidth(double value) => MediaQuery.of(context).size.width * value;

  double dynamicStatusBarHeight({double value = 1}) => MediaQuery.of(context).padding.top * value;

  double dynamicAppBarHeight(double value) => AppBar().preferredSize.height * value;

  double dynamicAppBarWidth(double value) => AppBar().preferredSize.width * value;

  // String customFormatDate(DateTime dateTime) =>
  //     formatDate(dateTime, [dd, ' ', MM, ' ', yyyy, '  ', HH, ':', nn], locale: TurkishDateLocale());
}
