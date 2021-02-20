import 'package:bliss_flutter/provider_models/get_items_provider_model.dart';
import 'package:bliss_flutter/ui/common/common_cart_item.dart';
import 'package:bliss_flutter/ui/screens/home/home_page.dart';
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
                colors: [theme.appPink, Colors.white70])),
        child: getDataPMDL.cartList.isNotEmpty
            ? Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 50.0, bottom: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Container(
                                  padding: EdgeInsets.only(left: 20),
                                  alignment: Alignment.centerLeft,
                                  child:
                                      Image.asset('assets/images/logo.png'))),
                        ],
                      )),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.only(left: 30),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: false,
                      itemCount: getDataPMDL.cartList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          child: Container(
                              padding: EdgeInsets.only(bottom: 20, right: 20),
                              child: commonCartListItem(
                                context,
                                getDataPMDL.cartList[index].category == 'bag'
                                    ? theme.appPurple
                                    : theme.appDPurple,
                                width,
                                height,
                                getDataPMDL.cartList[index].category == 'bag'
                                    ? 'assets/images/bag-one.png'
                                    : 'assets/images/bag-two.png',
                                getDataPMDL.cartList[index],
                                () {
                                  getDataPMDL.removeFromCart(
                                      context, getDataPMDL.cartList[index]);
                                },
                                () {
                                  getDataPMDL.setSingleItem(
                                      getDataPMDL.itemsData.data[index]);
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              DetailedPage(true)));
                                },
                              )),
                          onTap: () {
                            getDataPMDL.setSingleItem(
                                getDataPMDL.itemsData.data[index]);
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => DetailedPage(true)));
                          },
                        );
                      },
                    ),
                  )),
                  Divider(
                    indent: 40.0,
                    endIndent: 40,
                    thickness: 5,
                    color: theme.pinkIsh,
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 40, top: 40),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 40),
                            child: Text(
                              "Total",
                              style: theme.categoryStyle,
                            )),
                        Spacer(),
                        Container(
                            padding: EdgeInsets.only(right: 40),
                            child: Text("Rs. ${getDataPMDL.total.toString()}",
                                style: theme.categoryStyle)),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 30),
                      child: InkWell(
                        onTap: () {
                          getDataPMDL.addToCart(
                              context, getDataPMDL.selectedItem);
                        },
                        child: Container(
                          height: 50,
                          width: width - 100,
                          padding: EdgeInsets.only(right: 20, left: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: theme.appButtonColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  // spreadRadius: 5,
                                  blurRadius: 7,
                                )
                              ]),
                          child: Center(
                              child: Text(
                            "Checkout",
                            style: theme.addCartButtonStyle,
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Container(
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                      height: height / 2.5,
                    )),
                    Expanded(
                        child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/images/shopping-cart.png',
                            scale: 3,
                            color: Colors.purple,
                          ),
                        ),
                        SizedBox(height: 40),
                        Expanded(
                          child: Container(
                            child: Text(
                              "Your cart is currently \n empty !",
                              textAlign: TextAlign.center,
                              style: theme.categoryStyle,
                            ),
                          ),
                        ),
                      ],
                    )),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: EdgeInsets.only(bottom: 30),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          HomePage()),
                                  (r) => false);
                            },
                            child: Container(
                              height: 50,
                              width: width - 100,
                              padding: EdgeInsets.only(right: 20, left: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: theme.appButtonColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      // spreadRadius: 5,
                                      blurRadius: 7,
                                    )
                                  ]),
                              child: Center(
                                  child: Text(
                                "Browse Items",
                                style: theme.addCartButtonStyle,
                              )),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
