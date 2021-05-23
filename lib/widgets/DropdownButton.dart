import 'package:flutter/material.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_state.dart';
import 'package:supercharged/supercharged.dart';

class DropdownButtonWidget extends StatefulWidget {
  List<String>? list;
  String? title;
  String? select;
  String? textName;
  Function? function;
  IconData? iconData;
  bool? padding = false;
  bool? width = false;
  FormFieldValidator<String>? validator;

  @override
  _DropdownButtonWidgetState createState() => _DropdownButtonWidgetState();

  DropdownButtonWidget(
      {this.list,
        this.title = 'başlık',
      this.select,
      this.textName = 'Text',
      this.function,
      this.iconData,
      this.validator,
      this.padding = false,
      this.width = false});
}

class _DropdownButtonWidgetState extends BaseState<DropdownButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title!,
            style: TextStyle(
                fontSize: dynamicHeight(0.02), fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: dynamicHeight(0.07),
            width: dynamicWidth(0.9),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      color: Colors.black.withOpacity(0.1),
                    )
                  ]),
              child: FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    expands: true,
                    isHovering: true,
                    decoration: InputDecoration(
                      icon: Visibility(
                        visible: widget.iconData == null ? false : true,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 6),
                          child: Icon(
                            widget.iconData,
                            size:
                                dynamicHeight(0.05),
                            color: 'AAAAAA'.toColor(),
                          ),
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: Text(
                          "Seçiniz",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        value: widget.select,
                        isDense: true,
                        onChanged: (newValue) {
                          this.widget
                              .function!(widget.list!.indexOf(newValue!));
                          setState(() {
                            this.widget.select = newValue;
                          });
                        },
                        isExpanded: true,
                        items: widget.list!.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: Theme.of(context).textTheme.bodyText1
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
