import 'package:bliss_flutter/global/theme.dart' as theme;
import 'package:bliss_flutter/provider_models/get_items_provider_model.dart';
import 'package:bliss_flutter/provider_models/get_user_data_provider.dart';
import 'package:bliss_flutter/ui/common/common_loader.dart';
import 'package:bliss_flutter/ui/screens/items/detailed_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bliss_flutter/ui/common/common_filter_item.dart';
import 'package:bliss_flutter/ui/common/common_popular_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final userDataPMDL = Provider.of<UserDataProviderModel>(
        context, listen: false);
    userDataPMDL.getUserData(context);
    final getDataPMDL = Provider.of<ItemsProviderModel>(context, listen: false);
    getDataPMDL.getItemsData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userDataPMDL = Provider.of<UserDataProviderModel>(
        context, listen: false);
    final getDataPMDL = Provider.of<ItemsProviderModel>(context);

    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
        body:
        !getDataPMDL.isLoading
            ? Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors:
                    [
                      theme.appPink,
                     // theme.appPink50
                      Colors.white70
                    ])
            ),
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(top: 50.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Container(
                                padding: EdgeInsets.only(left: 20),
                                alignment: Alignment.centerLeft,
                                child: Image.asset('assets/images/logo.png'))
                        ),
                        Spacer(),
                        Expanded(
                            child: Container(
                              padding: EdgeInsets.only(right: 20),
                              alignment: Alignment.centerRight,
                              height: 50,
                              width: 50,
                              child: Material(
                                  elevation: 3.0,
                                  shape: CircleBorder(),
                                  clipBehavior: Clip.hardEdge,
                                  color: Colors.transparent,
                                  child:
                                  Image.network(userDataPMDL.userData.user.image)
                              ),
                            ))
                      ],
                    )),
                Container(
                  padding: EdgeInsets.only(top: 40,bottom: 40),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 20,bottom: 20),
                        child: Text(
                          "Hello,",
                          style: theme.helloStyle,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 20),
                        child: Text(userDataPMDL.userData.user.name,
                        style: theme.nameStyle),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: width - 40,
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Search Your Model",
                      style: theme.searchStyle,
                      )),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Container(
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: theme.purpleIsh
                            ),
                            height: 40,
                          width: 40,
                          child: Icon(Icons.search,color: Colors.white)
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 40),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 20,bottom: 20),
                        child: Text(
                          "By Category",
                          style: theme.categoryStyle,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        height: 75,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: false,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:10.0,bottom: 10,right: 20),
                              child: commonCategoryItem(
                                  theme.pinkIsh,
                                  'assets/images/handbag.png',
                                  "Bags"
                              ),
                            ),
                            // SizedBox(width: 20),
                            Padding(
                              padding: const EdgeInsets.only(top:10.0,bottom: 10,right: 20),
                              child: commonCategoryItem(
                                  theme.yellow,
                                  'assets/images/wallet.png',
                                  "Purse"
                              ),
                            ),
                            // SizedBox(width: 20),
                            Padding(
                              padding: const EdgeInsets.only(top:10.0,bottom: 10,right: 20),
                              child: commonCategoryItem(
                                  theme.appGreen,
                                  'assets/images/supermarket.png',
                                  "Key Tags"
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 40),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 20,bottom: 20),
                        child: Text(
                          "Most Popular",
                          style: theme.categoryStyle,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: false,
                            itemCount: getDataPMDL.itemsData.data.length,
                          itemBuilder: (BuildContext context,int index){
                            return InkWell(
                              child: Container(
                                padding: EdgeInsets.only(right: 20),
                                child: commonPopularItem(context,getDataPMDL.itemsData.data[index],index,
                                    getDataPMDL.itemsData.data[index].category == 'bag'
                                    ?theme.appPurple :theme.appDPurple,
                                    getDataPMDL.itemsData.data[index].category == 'bag'
                                    ?'assets/images/bag-one.png':'assets/images/bag-two.png',
                                    getDataPMDL.itemsData.data[index].modelName
                                ),
                              ),
                              onTap: (){
                                getDataPMDL.setSingleItem(getDataPMDL.itemsData.data[index]);
                                Navigator.push(
                                    context, CupertinoPageRoute(builder: (context) => DetailedPage()));
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ) : Container(
          child:Center(child: loadingAnimation())
        ));
  }

}