import 'package:flutter/material.dart';
import 'package:memmar_otomasyon_mobile/core/base/base_state.dart';
class PersonelListPage extends StatefulWidget {
  @override
  _PersonelListPageState createState() => _PersonelListPageState();
}

class _PersonelListPageState extends BaseState<PersonelListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Personel Listesi'
        ),
      ),
      body:ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                splashColor: Colors.grey,
                onTap: (){
                  /* Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductPage()),
                  );*/
                },
                child: Card(
                  color:Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: dynamicHeight(0.08),
                            height: dynamicHeight(0.08),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.11),
                                borderRadius: BorderRadius.all(Radius.circular(50))),
                            child: Icon(
                              Icons.person_pin,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Çalşıan Adı',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: dynamicHeight(0.02),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              Text(
                                'Telefon Numarası',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: dynamicHeight(0.02),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          ),

                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                            },
                            child: Container(
                              height: dynamicHeight(0.07),
                              width: dynamicWidth(0.08),
                              color: Colors.green.withOpacity(0.1),
                              child: Icon(
                                Icons.edit,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: InkWell(
                              onTap: (){

                              },
                              child: Container(
                                height: dynamicHeight(0.07),
                                width: dynamicWidth(0.08),
                                color: Colors.red.withOpacity(0.1),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
