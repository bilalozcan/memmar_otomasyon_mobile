import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_state.dart';
import 'package:memmar_otomasyon_mobile/core/constants/app/app_constans.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/personel_created_page/personel_created_view_model.dart';
import 'package:memmar_otomasyon_mobile/widgets/DropdownButton.dart';
import 'package:memmar_otomasyon_mobile/widgets/input.dart';
import 'package:provider/provider.dart';
class PersonelCreatedPage extends StatefulWidget {
  @override
  _PersonelCreatedPageState createState() => _PersonelCreatedPageState();
}

class _PersonelCreatedPageState extends BaseState<PersonelCreatedPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PersonelCreatedViewModel>().clear();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Loader.hide();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Personel Oluştur'),
      ),
      body: Form(
        key: formKey,
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40,),
                CustomInput(
                  controller: context.read<PersonelCreatedViewModel>().name,
                  title: 'İsim Soyisim',
                  hint: 'isim soyisim ',
                  width: 357,
                  validateEmpty: true,
                ),
                CustomInput(
                  controller: context.read<PersonelCreatedViewModel>().email,
                  title: 'E-mail giriniz',
                  hint: 'e-mail',
                  width: 357,
                  validateEmpty: true,
                ),
                DropdownButtonWidget(
                  list: ApplicationConstants.USER_TYPE,
                  select: ApplicationConstants.USER_TYPE[
                  context.read<PersonelCreatedViewModel>().userType!],
                  title: 'Kullanıcı Tipi',
                  textName: 'Kullanıcı Tipi',
                  iconData: Icons.person,
                  function: (value) {
                    context.read<PersonelCreatedViewModel>().userType = value;
                  },
                ),
                CustomInput(
                  controller: context.read<PersonelCreatedViewModel>().password,
                  title: 'Şifre Oluşturunuz',
                  hint: 'şifre',
                  hidePass: true,
                  validateEmpty: true,

                  width: 357,
                ),

                SizedBox(height: dynamicHeight(0.05),),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate() == false) return;
                        context.read<PersonelCreatedViewModel>().createUser(context);
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
      ),
    );
  }
}
