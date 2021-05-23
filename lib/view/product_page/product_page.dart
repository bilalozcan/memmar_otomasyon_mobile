import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    print(context.read<ProductViewPageModel>().productType);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Ürün Ekle'),
      ),
      body: Center(
        child: Container(
          child: SingleChildScrollView(
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
    );
  }

  String? a;
}
