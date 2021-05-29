import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_state.dart';
import 'package:memmar_otomasyon_mobile/core/constants/app/app_constans.dart';
import 'package:memmar_otomasyon_mobile/view/product_page/product_view_page_model.dart';
import 'package:memmar_otomasyon_mobile/widgets/DropdownButton.dart';
import 'package:memmar_otomasyon_mobile/widgets/input.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends BaseState<ProductPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductViewPageModel>().clear();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Loader.hide();
  }
  @override
  Widget build(BuildContext context) {
    print(context.read<ProductViewPageModel>().productType);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Ürün Ekle'),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInput(
                    scanner: true,
                    controller: context.read<ProductViewPageModel>().barcodeCont,
                    title: 'Barkod',
                    hint: 'Barkod no giriniz',
                    width: 357,
                    validator: (val){
                      if(val=='')
                        return 'Barkod Boş olamaz';
                    },
                    validateEmpty: true,
                  ),
                  CustomInput(
                    controller: context.read<ProductViewPageModel>().nameCont,
                    title: 'Ürün Adı',
                    hint: 'Ürün Adı Giriniz',
                    width: 357,
                    validator: (val){
                      if(val=='')
                        return 'Ürün adı Boş olamaz';
                    },
                    validateEmpty: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomInput(
                        title: 'Alış Fiyatı(₺)',
                        controller: context.read<ProductViewPageModel>().purchasePrise,
                        hint: 'Ürün alış fiyatı',
                        keyboardType: TextInputType.number,
                        width: 150,
                        validator: (val){
                          if(val=='')
                            return 'Alış Fiyatı boş olamaz';
                        },
                        validateEmpty: true,
                      ),
                      CustomInput(
                        controller: context.read<ProductViewPageModel>().salePrise,
                        title: 'Satış Fiyatı(₺)',
                        hint: 'Ürün satış fiyatı',
                         validateEmpty: true,
                        validator: (val){
                          if(val=='')
                            return 'Satış Fiyatı Boş olamaz';
                        },
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
                        controller: context.read<ProductViewPageModel>().stock,
                        title: 'Stok(Adet)',
                        hint: 'Stok Miktarı giriniz',
                        validator: (val){
                          if(val=='')
                            return 'Stok miktarı Boş olamaz';
                        },
                        validateEmpty: true,
                        keyboardType: TextInputType.number,
                        width: 150,
                      ),
                    ],
                  ),
                  DropdownButtonWidget(
                    list: ApplicationConstants.PRODUCT_TYPE_LIST,
                    select: ApplicationConstants.PRODUCT_TYPE_LIST[
                        context.read<ProductViewPageModel>().productType!],
                    title: 'Ürün Tipi',
                    textName: 'Ürün Tipi',
                    iconData: Icons.layers,
                    function: (value) {
                      context.read<ProductViewPageModel>().productType = value;
                    },
                  ),
                  DropdownButtonWidget(
                    list: ApplicationConstants.PRODUCT_TYPE_LIST,
                    select: ApplicationConstants.PRODUCT_TYPE_LIST[
                        context.read<ProductViewPageModel>().productType!],
                    title: 'Tedarikçi',
                    textName: 'tedarikçi',
                    iconData: Icons.layers,
                    function: (value) {
                      context.read<ProductViewPageModel>().productType = value;
                    },
                  ),
                  SizedBox(height: dynamicHeight(0.05),),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate() == false) return;
                          context.read<ProductViewPageModel>().createPrpductTEST(context);
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
        ),
      ),
    );
  }

  String? a;
}
