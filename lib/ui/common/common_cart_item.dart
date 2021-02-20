import 'package:bliss_flutter/provider_models/get_items_provider_model.dart';
import 'package:flutter/material.dart';
import 'package:bliss_flutter/global/theme.dart' as theme;
import 'package:provider/provider.dart';

Widget commonCartListItem(context,color,w,h,image,data,onTap,onTap2){
  final getDataPMDL = Provider.of<ItemsProviderModel>(context);
  return Container(
    padding: EdgeInsets.only(top: 20,bottom: 20,right: 20,left: 20),
    decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
        boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          blurRadius: 7,
        )]),
    child: Stack(
      children: [
        Container(
          child: InkWell(
            onTap:onTap2,
            child: Container(
              child: Row(
                children: [
                  Container(
                    height: 80,
                    child: Image.asset(image),
                  ),
                  SizedBox(width: w/18),
                  Container(
                    height: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(data.modelName,style: theme.catListStyle,),
                        ),
                        SizedBox(height:20,),
                        Container(
                          child: Text("Rs ${data.price}",
                            style:theme.catListStyle ,),
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: onTap,
              child: Icon(Icons.cancel_rounded,color: Colors.white,)),
        )
      ],
    )


  );
}