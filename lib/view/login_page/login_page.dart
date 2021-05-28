import 'package:flutter/material.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_state.dart';
import 'package:memmar_otomasyon_mobile/view/login_page/login_page_view_model.dart';
import 'package:memmar_otomasyon_mobile/widgets/input.dart';
import 'package:provider/provider.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Giriş'
        ),
      ),
      body: Form(
        key: formKey,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomInput(
                controller: context.read<LoginPageViewModel>().email,
                title: 'E-mail ',
                hint: 'input@gmail.com',
                width: 357,
                validateEmpty: true,
                validator: (str){
                  if(str==''){
                    return 'Lütfen mail giriniz';
                  }
                },
              ),
              CustomInput(
                controller: context.read<LoginPageViewModel>().password,
                title: 'Şifre',
                hint: '*******',
                hidePass: true,
                validateEmpty: true,
                validator: (str){
                  if(str==''){
                    return 'Lütfen şifre giriniz';
                  }
                },
                width: 357,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate() == false) return;
                      setState(() {});
                    },
                    child: Container(
                      width: dynamicWidth(0.7),
                      child: Center(child: Text('Giriş Yap')),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
