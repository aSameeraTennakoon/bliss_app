import 'package:bliss_flutter/provider_models/get_items_provider_model.dart';
import 'package:bliss_flutter/ui/common/common_category_list_item.dart';
import 'package:bliss_flutter/ui/screens/items/detailed_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bliss_flutter/global/theme.dart' as theme;

///search screen UI
class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final getDataPMDL = Provider.of<ItemsProviderModel>(context);

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [theme.appPink, Colors.white70])),
        child: Column(
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
                            child: Image.asset('assets/images/logo.png'))),
                  ],
                )),
            Container(
              // width: width - 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: width - 60,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintText: "Search your Model"),
                        controller: controller,
                        // onChanged: (value) {
                        //   getDataPMDL.searchItems(context,value);
                        // },
                      )),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () {
                        getDataPMDL.searchItems(context, controller.text);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: theme.purpleIsh),
                          height: 40,
                          width: 40,
                          child: Icon(Icons.search, color: Colors.white)),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: getDataPMDL.searchList.length > 0
                  ? Container(
                      padding: EdgeInsets.only(left: 30),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: false,
                        itemCount: getDataPMDL.searchList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              getDataPMDL
                                  .setSingleItem(getDataPMDL.searchList[index]);
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          DetailedPage(false)));
                            },
                            child: Container(
                                padding: EdgeInsets.only(bottom: 20, right: 20),
                                child: commonCategoryListItem(
                                    context,
                                    getDataPMDL.searchList[index].category ==
                                            'bag'
                                        ? theme.appPurple
                                        : theme.appDPurple,
                                    width,
                                    height,
                                    getDataPMDL.searchList[index].category ==
                                            'bag'
                                        ? 'assets/images/bag-one.png'
                                        : 'assets/images/bag-two.png',
                                    getDataPMDL.searchList[index])),
                          );
                        },
                      ),
                    )
                  : Container(),
            )
          ],
        ),
      ),
    );
  }
}
