import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_state.dart';
import 'package:memmar_otomasyon_mobile/view/register_page/register_page_view_model.dart';
import 'package:memmar_otomasyon_mobile/widgets/input.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<RegisterPageViewModel>().clear();
  }
  @override
  void dispose() {
    Loader.hide();
    super.dispose();
    Loader.hide();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kayıt'),
      ),
      body: Form(
        key: formKey,
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomInput(
                  controller: context.read<RegisterPageViewModel>().companyName,
                  title: 'Şirket Adı ',
                  hint: 'isim',
                  width: 357,
                  validateEmpty: true,
                ),
                CustomInput(
                  controller: context.read<RegisterPageViewModel>().userName,
                  title: 'Şirket Sahibi ismi ',
                  hint: 'yetkili',
                  width: 357,
                  validateEmpty: true,

                ),
                CustomInput(
                  controller: context.read<RegisterPageViewModel>().email,
                  title: 'E-mail ',
                  hint: 'input@gmail.com',
                  width: 357,
                  validateEmpty: true,
                  validator: (str) {
                    if (str == '') {
                      return 'Lütfen mail giriniz';
                    }
                  },
                ),
                CustomInput(
                  controller: context.read<RegisterPageViewModel>().password,
                  title: 'Şifre',
                  hint: '*******',
                  hidePass: true,
                  validateEmpty: true,
                  validator: (str) {
                    if (str == '') {
                      return 'Lütfen şifre giriniz';
                    }
                  },
                  width: 357,
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate() == false) return;
                         context.read<RegisterPageViewModel>().createCompanyTEST(context);
                      },
                      //context.read<RegisterPageViewModel>().createUserTEST,
                      //context.read<RegisterPageViewModel>().createCompanyTEST,

                      /*() {
                        if (formKey.currentState!.validate() == false) return;
                        setState(() {});
                      },*/
                      child: Container(
                        width: dynamicWidth(0.7),
                        child: Center(child: Text('Kayıt Ol')),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
