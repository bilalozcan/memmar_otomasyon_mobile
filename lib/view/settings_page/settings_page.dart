import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_state.dart';
import 'package:memmar_otomasyon_mobile/model/company_model.dart';
import 'package:memmar_otomasyon_mobile/service/auth_service.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/home_bottom_view_model.dart';
import 'package:memmar_otomasyon_mobile/view/login_page/login_page.dart';
import 'package:memmar_otomasyon_mobile/view/login_page/login_page_view_model.dart';
import 'package:memmar_otomasyon_mobile/widgets/input.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends BaseState<SettingPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SettingsViewModel>().companyName.text = context.read<LoginPageViewModel>().company.name.toString();
    context.read<SettingsViewModel>().createdAdd.text = DateFormat('dd.MM.yyyy').format(context.read<LoginPageViewModel>().company.createdAdd!);
    context.read<SettingsViewModel>().totalAmount.text = context.read<LoginPageViewModel>().company.totalAmount.toString();
    context.read<SettingsViewModel>().totalSupply.text = context.read<LoginPageViewModel>().company.totalSupply.toString();
    context.read<SettingsViewModel>().income.text = context.read<LoginPageViewModel>().company.income.toString();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayarlar'),
        actions: [
          ElevatedButton(onPressed: (){
            context.read<HomeBottomViewModel>().clear();
            Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
    },
      
      child: Text('????k???? Yap'),
          )
        ],
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                       CustomInput(
                        controller:
                        context.read<SettingsViewModel>().companyName,
                        title: '??irket Ad??',
                        validateEmpty: true,
                        readOnly: context.watch<LoginPageViewModel>().user!.userType==0?false:true,
                        validator: (val) {
                          if (val == '') return '??irket Ad?? Bo?? olamaz';
                        },
                        keyboardType: TextInputType.number,
                        width: dynamicWidth(0.85),
                      ),
                      CustomInput(
                        controller:
                        context.read<SettingsViewModel>().userName,
                        title: 'Kullan??c?? Ad??',
                        hint: context.watch<LoginPageViewModel>().user!.fullName,
                        validateEmpty: true,
                        readOnly: true,
                        keyboardType: TextInputType.number,
                        width: dynamicWidth(0.85),
                      ),
                       CustomInput(
                        controller:
                        context.read<SettingsViewModel>().createdAdd,
                        title: 'Ol??turulma tarihi',
                        readOnly: true,
                        keyboardType: TextInputType.number,
                        width: dynamicWidth(0.85),
                      ),
                      if(context.watch<LoginPageViewModel>().user!.userType==0)CustomInput(
                        controller:
                        context.read<SettingsViewModel>().totalAmount,
                        title: 'Yap??lan sat???? Miktar?? (???)',
                        readOnly: true,
                        keyboardType: TextInputType.number,
                        width: dynamicWidth(0.85),
                      ),
                      if(context.watch<LoginPageViewModel>().user!.userType==0)  CustomInput(
                        controller:
                        context.read<SettingsViewModel>().totalSupply,
                        title: 'Yap??lan Al???? Miktar?? (???)',
                        readOnly: true,
                        keyboardType: TextInputType.number,
                        width: dynamicWidth(0.85),
                      ),
                      if(context.watch<LoginPageViewModel>().user!.userType==0) CustomInput(
                        controller:
                        context.read<SettingsViewModel>().income,
                        title: 'Gelir (???)',
                        readOnly: true,
                        keyboardType: TextInputType.number,
                        width: dynamicWidth(0.85),
                      ),
                    ],
                  ),
                ),
              ),
              if(context.watch<LoginPageViewModel>().user!.userType==0)  Center(
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate() == false)
                        return;
                      Company company =
                      context.read<LoginPageViewModel>().company;
                      company.name = context.read<SettingsViewModel>().companyName.text;
                      context.read<SettingsViewModel>().updateCompany(context, company);
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

class SettingsViewModel extends ChangeNotifier {
  final AuthService? _authService = AuthService.instance;

  TextEditingController companyName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController createdAdd = TextEditingController();
  TextEditingController totalAmount = TextEditingController();
  TextEditingController totalSupply = TextEditingController();
  TextEditingController income = TextEditingController();

  void updateCompany(BuildContext context, Company company) async {
    Loader.show(context, progressIndicator: CircularProgressIndicator());

    var updateProduct = await _authService!.updateCompany(company: company);
    if (updateProduct != null) {
      Fluttertoast.showToast(
          msg: "??irket G??ncellendi", gravity: ToastGravity.SNACKBAR);
      context.read<LoginPageViewModel>().companyUpdate(company);
      notifyListeners();
    } else {
      Fluttertoast.showToast(
          msg: "??irket G??ncellenemedi", gravity: ToastGravity.SNACKBAR);
    }
    Loader.hide();
  }
}
