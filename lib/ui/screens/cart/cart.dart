import 'package:bliss_flutter/provider_models/get_items_provider_model.dart';
import 'package:bliss_flutter/ui/common/common_cart_item.dart';
import 'package:bliss_flutter/ui/screens/items/detailed_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bliss_flutter/global/theme.dart' as theme;


class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final getDataPMDL = Provider.of<ItemsProviderModel>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors:
                [
                  theme.appPink,
                  Colors.white70
                ])
        ),
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(top: 50.0,bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.only(left: 20),
                            alignment: Alignment.centerLeft,
                            child: Image.asset('assets/images/logo.png'))
                    ),
                  ],
                )),
            Expanded(
              child:
              getDataPMDL.cartList.isNotEmpty
              ?Container(
                padding: EdgeInsets.only(left: 30),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: false,
                  itemCount: getDataPMDL.cartList.length,
                  itemBuilder: (BuildContext context,int index){
                    return InkWell(
                      child: Container(
                          padding: EdgeInsets.only(bottom: 20,right: 20),
                          child:
                          commonCartListItem(context,
                              getDataPMDL.cartList[index].category == 'bag'
                                  ?theme.appPurple :theme.appDPurple,
                              width,
                              height,
                              getDataPMDL.cartList[index].category == 'bag'
                                  ?'assets/images/bag-one.png':'assets/images/bag-two.png',
                              getDataPMDL.cartList[index],
                              (){getDataPMDL.removeFromCart(context,getDataPMDL.cartList[index]);},
                                (){
                              getDataPMDL.setSingleItem(getDataPMDL.itemsData.data[index]);
                              Navigator.push(
                                  context, CupertinoPageRoute(builder: (context) => DetailedPage()));
                            },
                          )
                      ),
                      onTap: (){
                        getDataPMDL.setSingleItem(getDataPMDL.itemsData.data[index]);
                        Navigator.push(
                            context, CupertinoPageRoute(builder: (context) => DetailedPage()));
                      },
                    );
                  },
                ),
              ):Container(

              ),
            )
          ],
        ),
      ),
    );
  }
}
