import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

Widget loadingAnimation(){
  return LoadingBouncingGrid.square(
    // borderColor: Colors.white,
    backgroundColor:Colors.pinkAccent ,
    size: 50.0,
  );
}