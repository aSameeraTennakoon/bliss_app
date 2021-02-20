import 'package:flutter/material.dart';
import 'package:bliss_flutter/global/theme.dart' as theme;

Widget commonCategoryItem(color, image, label) {
  return Container(
    padding: EdgeInsets.only(right: 20, left: 20),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            // spreadRadius: 5,
            blurRadius: 7,
          )
        ]),
    child: Row(
      children: [
        Container(
          child: Image.asset(
            image,
            color: Colors.white,
            scale: 18,
          ),
        ),
        SizedBox(width: 10),
        Container(
          child: Text(
            label,
            style: theme.categoryLabel,
          ),
        )
      ],
    ),
  );
}
