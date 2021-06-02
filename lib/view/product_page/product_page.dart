import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_state.dart';
import 'package:memmar_otomasyon_mobile/core/constants/app/app_constans.dart';
import 'package:memmar_otomasyon_mobile/model/product_model.dart';
import 'package:memmar_otomasyon_mobile/model/supplier_model.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/supplier_created_page/supplier_created_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/admin_page/supplier_list_page/supplier_list_page.dart';
import 'package:memmar_otomasyon_mobile/view/home_bottom/home_page/product_list_page/product_list_view_model.dart';
import 'package:memmar_otomasyon_mobile/view/product_page/product_view_page_model.dart';
import 'package:memmar_otomasyon_mobile/widgets/DropdownButton.dart';
import 'package:memmar_otomasyon_mobile/widgets/input.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  Product? product;

  @override
  _ProductPageState createState() => _ProductPageState();

  ProductPage({this.product});
}

class _ProductPageState extends BaseState<ProductPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<SupplierListViewModel>().wait = true;
      context.read<SupplierListViewModel>().getSupplierList(context);
    });
    if (widget.product != null) {
      context.read<ProductViewPageModel>().nameCont.text =
          widget.product!.name!;
      context.read<ProductViewPageModel>().barcodeCont.text =
          widget.product!.barcode!;
      context.read<ProductViewPageModel>().purchasePrise.text =
          widget.product!.purchasePrice.toString();
      context.read<ProductViewPageModel>().salePrise.text =
          widget.product!.salePrice.toString();
      context.read<ProductViewPageModel>().stock.text =
          widget.product!.stock.toString();
      context.read<ProductViewPageModel>().productType =
          widget.product!.productType;
      for(var a in context.read<SupplierListViewModel>().supplierList){
        if(a.id == widget.product!.supplierId)
          context.read<ProductViewPageModel>().selectSupplier = a;
      }
    } else {
      context.read<ProductViewPageModel>().clear();
    }
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
                    controller:
                        context.read<ProductViewPageModel>().barcodeCont,
                    title: 'Barkod',
                    hint: 'Barkod no giriniz',
                    width: 357,
                    validator: (val) {
                      if (val == '') return 'Barkod Boş olamaz';
                    },
                    validateEmpty: true,
                  ),
                  CustomInput(
                    controller: context.read<ProductViewPageModel>().nameCont,
                    title: 'Ürün Adı',
                    hint: 'Ürün Adı Giriniz',
                    width: 357,
                    validator: (val) {
                      if (val == '') return 'Ürün adı Boş olamaz';
                    },
                    validateEmpty: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomInput(
                        title: 'Alış Fiyatı(₺)',
                        controller:
                            context.read<ProductViewPageModel>().purchasePrise,
                        hint: 'Ürün alış fiyatı',
                        keyboardType: TextInputType.number,
                        width: 150,
                        validator: (val) {
                          if (val == '') return 'Alış Fiyatı boş olamaz';
                        },
                        validateEmpty: true,
                      ),
                      CustomInput(
                        controller:
                            context.read<ProductViewPageModel>().salePrise,
                        title: 'Satış Fiyatı(₺)',
                        hint: 'Ürün satış fiyatı',
                        validateEmpty: true,
                        validator: (val) {
                          if (val == '') return 'Satış Fiyatı Boş olamaz';
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
                        validator: (val) {
                          if (val == '') return 'Stok miktarı Boş olamaz';
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
                    supplierWidget(context),
                  SizedBox(
                    height: dynamicHeight(0.05),
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          if (widget.product == null) {
                            if (formKey.currentState!.validate() == false)
                              return;
                            context
                                .read<ProductViewPageModel>()
                                .createPrpductTEST(context);
                          } else {
                            if (formKey.currentState!.validate() == false)
                              return;
                            context
                                .read<ProductViewPageModel>()
                                .updatePrpduct(context, widget.product!);
                          }
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

  Container supplierWidget(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tedarikçi seçiniz',
            style: TextStyle(
                fontSize: dynamicHeight(0.02), fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 3,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.black.withOpacity(0.1),
                  )
                ]),
            width: dynamicWidth(0.88),
            height: dynamicHeight(0.07),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<SupplierModel>(
                  value:context.watch<ProductViewPageModel>().selectSupplier ,
                  onChanged: (newValue) {
                    setState(() {
                      context.read<ProductViewPageModel>().supplierChange(newValue!);

                    });
                  },
                  isExpanded: true,
                  items: context
                      .watch<SupplierListViewModel>()
                      .supplierList
                      .map((SupplierModel value) {
                    return DropdownMenuItem<SupplierModel>(
                      value: value,
                      child: Text(value.name.toString(),
                          style: Theme.of(context).textTheme.bodyText1),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
