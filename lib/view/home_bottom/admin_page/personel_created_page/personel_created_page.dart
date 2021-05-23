import 'package:flutter/material.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_state.dart';
import 'package:memmar_otomasyon_mobile/widgets/input.dart';
import 'package:provider/provider.dart';
class PersonelCreatedPage extends StatefulWidget {
  @override
  _PersonelCreatedPageState createState() => _PersonelCreatedPageState();
}

class _PersonelCreatedPageState extends BaseState<PersonelCreatedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Personel Oluştur'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              CustomInput(
                title: 'İsim Soyisim',
                hint: 'isim soyisim giriniz',
                width: 357,
              ),
              CustomInput(
                title: 'E-mail giriniz',
                hint: 'e-mail',
                width: 357,
              ),
              CustomInput(
                title: 'Şifre Oluşturunuz',
                hint: 'şifre',
                width: 357,
              ),

              SizedBox(height: dynamicHeight(0.05),),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Container(
                      width: dynamicWidth(0.7),
                      child: Center(child: Text('Kaydet')),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
