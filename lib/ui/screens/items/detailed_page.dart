import 'package:bliss_flutter/provider_models/get_items_provider_model.dart';
import 'package:bliss_flutter/ui/common/inc_decre_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bliss_flutter/global/theme.dart' as theme;

class DetailedPage extends StatefulWidget {
  @override
  _DetailedPageState createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  @override
  Widget build(BuildContext context) {
    final getDataPMDL = Provider.of<ItemsProviderModel>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isFav = false;
    isFav = getDataPMDL.selectedItem.isFav;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: getDataPMDL.selectedItem.category == 'bag'
            ? theme.appPurple
            : theme.appDPurple,
        automaticallyImplyLeading: true,
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              child: Icon(Icons.share),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 20.0, left: 20),
            child: InkWell(
                onTap: (){
                  isFav = !isFav;
                  // getDataPMDL.itemsData.data[index].isFav = isFav;
                  getDataPMDL.addToFav(context,isFav, getDataPMDL.itemsData.data
                      .indexOf(getDataPMDL.selectedItem));
                },
                child: Icon(
              Icons.favorite,
              color: getDataPMDL.selectedItem.isFav ? Colors.red : Colors.white,
            )),
          ),
          Container(
            padding: const EdgeInsets.only(right: 20.0, left: 20),
            child: InkWell(child: Icon(Icons.shopping_cart)),
          ),
        ],
      ),
      backgroundColor: getDataPMDL.selectedItem.category == 'bag'
          ? theme.appPurple
          : theme.appDPurple,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height / 2.2,
              width: width,
              decoration: BoxDecoration(
                color: getDataPMDL.selectedItem.category == 'bag'
                    ? theme.detailPurple
                    : theme.detailDPurple,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    topLeft: Radius.circular(40.0)),
              ),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 25, left: 50),
                      alignment: Alignment.topLeft,
                      child: Text(
                        getDataPMDL.selectedItem.modelName,
                        style: theme.popCodeDetailLabel,
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 20, left: 50),
                        child: Container(
                          child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                    children: [
                                  Container(
                                    child: Text("Price",
                                        style: theme.detailDStyle),
                                    padding: EdgeInsets.only(bottom: 15),
                                  ),
                                  Container(
                                    child: Text("Height",
                                        style: theme.detailDStyle),
                                    padding: EdgeInsets.only(bottom: 15),
                                  ),
                                  Container(
                                    child: Text("Width",
                                        style: theme.detailDStyle),
                                    padding: EdgeInsets.only(bottom: 15),
                                  ),
                                  Container(
                                    child: Text("Weight",
                                        style: theme.detailDStyle),
                                    padding: EdgeInsets.only(bottom: 15),
                                  ),
                                ]),
                                SizedBox(width: width/4),
                                Column(
                                    crossAxisAlignment:CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(getDataPMDL.selectedItem.price,
                                            style: theme.detailDStyle),
                                        padding: EdgeInsets.only(bottom: 15),
                                      ),
                                      Container(
                                        child: Text(getDataPMDL.selectedItem.height,
                                            style: theme.detailDStyle),
                                        padding: EdgeInsets.only(bottom: 15),
                                      ),
                                      Container(
                                        child: Text(getDataPMDL.selectedItem.width,
                                            style: theme.detailDStyle),
                                        padding: EdgeInsets.only(bottom: 15),
                                      ),
                                      Container(
                                        child: Text(getDataPMDL.selectedItem.weight,
                                            style: theme.detailDLStyle),
                                        padding: EdgeInsets.only(bottom: 15),
                                      ),
                                    ]),

                              ]),
                        )),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left:40,bottom: 20),
                        child: Row(
                          children: [
                            Container(
                              height: 70,
                              child: IncrementDecrementWidget(
                                  onDecrement: (){
                                    getDataPMDL.decrementQuant(context, getDataPMDL.itemsData.data
                                        .indexOf(getDataPMDL.selectedItem));
                                  },
                                onIncrement: (){
                                  getDataPMDL.incrementQuant(context, getDataPMDL.itemsData.data
                                      .indexOf(getDataPMDL.selectedItem));
                                  },
                                 value: getDataPMDL.selectedItem.quantity.toString(),
                                label: " ",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 50,
                        width: width-100,
                        padding: EdgeInsets.only(right: 20,left: 20),
                        decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: theme.purpleIsh,
                            boxShadow: [BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              // spreadRadius: 5,
                              blurRadius: 7,
                            )]),
                        child: Center(child: Text("Add to Cart",
                          style: theme.addCartButtonStyle,
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: height / 1.5,
            child: Center(
                child: Hero(
              tag: "photo" +
                  getDataPMDL.itemsData.data
                      .indexOf(getDataPMDL.selectedItem)
                      .toString(),
              child: Image.asset(
                getDataPMDL.selectedItem.category == 'bag'
                    ? 'assets/images/bag-one.png'
                    : 'assets/images/bag-two.png',
              ),
            )),
          ),
        ],
      ),
    );
  }
}
