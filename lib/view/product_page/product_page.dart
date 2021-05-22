import 'package:flutter/material.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_state.dart';
import 'package:memmar_otomasyon_mobile/widgets/input.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends BaseState<ProductPage> {
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ürün Ekle'),
      ),
      body: Center(
        child: Container(
          width: dynamicWidth(0.85),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomInput(
                scanner: true,
                title: 'Barkod',
                hint: 'Barkod no giriniz',
                width: 357,
              ),
              CustomInput(
                title: 'Ürün Adı',
                hint: 'Ürün Adı Giriniz',
                width: 357,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomInput(
                    title: 'Alış Fiyatı(₺)',
                    hint: 'Ürün alış fiyatı',
                    keyboardType: TextInputType.number,
                    width: 150,
                  ),
                  CustomInput(
                    title: 'Satış Fiyatı(₺)',
                    hint: 'Ürün satış fiyatı',
                    keyboardType: TextInputType.number,
                    width: 150,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomInput(
                    title: 'Gramaj(g)',
                    hint: 'Gramaj giriniz',
                    keyboardType: TextInputType.number,
                    width: 150,
                  ),
                  CustomInput(
                    title: 'Stok(Adet)',
                    hint: 'Stok Miktarı giriniz',
                    keyboardType: TextInputType.number,
                    width: 150,
                  ),
                ],
              ),
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['One', 'Two', 'Free', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )
            ],
          ),
        ),
      ),
    );
  }
}
