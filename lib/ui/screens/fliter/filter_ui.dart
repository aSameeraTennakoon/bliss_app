import 'package:bliss_flutter/provider_models/get_items_provider_model.dart';
import 'package:bliss_flutter/ui/common/common_category_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bliss_flutter/global/theme.dart' as theme;
import 'package:provider/provider.dart';

class FilterScreen extends StatefulWidget {
  final String category;
  FilterScreen(this.category);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    final getDataPMDL = Provider.of<ItemsProviderModel>(context, listen: false);

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

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
            Container(
              padding: EdgeInsets.only(left: 30),
              alignment: Alignment.topLeft,
              child: Text(
                widget.category,style: theme.categoryStyle,
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 30),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: false,
                  itemCount: getDataPMDL.bagList.length,
                  itemBuilder: (BuildContext context,int index){
                    return Container(
                        padding: EdgeInsets.only(bottom: 20,right: 20),
                      child:
                      commonCategoryListItem(context,
                          widget.category == 'Bags'
                            ?theme.appPurple :theme.appDPurple,
                        width,
                        height,
                          widget.category == 'Bags'
                            ?'assets/images/bag-one.png':'assets/images/bag-two.png',
                          widget.category == 'Bags'
                          ?getDataPMDL.bagList[index]:getDataPMDL.purseList[index]
                      )
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
