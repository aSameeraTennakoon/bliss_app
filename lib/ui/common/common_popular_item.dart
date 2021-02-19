import 'package:bliss_flutter/provider_models/get_items_provider_model.dart';
import 'package:flutter/material.dart';
import 'package:bliss_flutter/global/theme.dart' as theme;
import 'package:provider/provider.dart';

Widget commonPopularItem(context,index,color,image,label){
  bool isFav = false;
  final getDataPMDL = Provider.of<ItemsProviderModel>(context);
  isFav = getDataPMDL.itemsData.data[index].isFav;
  return Container(
    padding: EdgeInsets.only(top: 20,bottom: 20,right: 20,left: 20),
    decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
        boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          // spreadRadius: 5,
          blurRadius: 7,
        )]),
    child: Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(label,
                    style: theme.popCodeLabel,
                  ),
                  padding: EdgeInsets.only(right: 10),
                  alignment: Alignment.topLeft,
                ),
                SizedBox(width: 30),
                Container(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: (){
                      isFav = !isFav;
                      getDataPMDL.itemsData.data[index].isFav = isFav;
                      print(getDataPMDL.itemsData.data[index].isFav);
                      print("isFave $isFav");
                    },
                    child:
                    !isFav
                    ?Icon(Icons.favorite,color: Colors.white,):Icon(Icons.favorite,color: Colors.red,),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
            child: Image.asset(image,scale: 3,),
          ),
        ),
      ],
    ),
  );
}