import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_state.dart';
import 'package:memmar_otomasyon_mobile/model/supplier_model.dart';
import 'package:memmar_otomasyon_mobile/service/supplier_service.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/supplier_list_page/supplier_list_page.dart';
import 'package:memmar_otomasyon_mobile/widgets/input.dart';
import 'package:provider/provider.dart';
class SupplierCreatedPage extends StatefulWidget {
  @override
  _SupplierCreatedPageState createState() => _SupplierCreatedPageState();
}

class _SupplierCreatedPageState extends BaseState<SupplierCreatedPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SupplierCreatedViewModel>().clear();
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
      appBar: AppBar(
        title: Text(
          'Tedarikçi Ekle'
        ),
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
                  controller: context.watch<SupplierCreatedViewModel>().name,
                  title: 'İsim Soyisim',
                  hint: 'isim soyisim ',
                  width: 357,
                  validateEmpty: true,
                ),
                CustomInput(
                  controller: context.watch<SupplierCreatedViewModel>().phone,
                  title: 'Telefon numarası giriniz',
                  hint: 'telefon',
                  width: 357,
                  validateEmpty: true,
                ),

                SizedBox(height: dynamicHeight(0.05),),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate() == false) return;
                        context.read<SupplierCreatedViewModel>().createSupplier(context);
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
class SupplierCreatedViewModel extends ChangeNotifier{
  final SupplierService? _supplierService = SupplierService.instance;
  var name = TextEditingController();
  var phone = TextEditingController();
  clear (){
    this.name.clear();
    this.phone.clear();
  }
  createSupplier(BuildContext context) async {
    Loader.show(context, progressIndicator: CircularProgressIndicator());
    SupplierModel supplierModel = SupplierModel(
     name: name.text,
      phone: phone.text
    );
    var receipt =
    await _supplierService!.createSupplier(supplierModel: supplierModel);
    Loader.hide();
    if (receipt == null) {
      Fluttertoast.showToast(msg: 'Tedarikçi oluşturulamadı');
    } else {
      Fluttertoast.showToast(msg: 'Tedarikçi Başarılı bir şekilde oluşturuldu');
      clear();
      notifyListeners();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SupplierListPage()),
      );
    }
  }
}
